#

/* Device driver for the DEC DZ11 8 line asynchronous multiplexor
 *
 * Written by Mark Kampe 9/27/77
 *
 * Recoded by Noel Chiappa  MIT-LCS-CSR  15-Feb-80
 */

#include	"../h/param.h"
#include	"../h/conf.h"
#include	"../h/proc.h"
#include	"../h/user.h"
#include	"../h/userx.h"
#include	"../h/tty.h"



/* DZ11 registers, read and write */

struct	dzrregs	{	int	dzcsr;	/* Control and status register */
			int	dzrdr;	/* Receiver buffer register */
			int	dztcr;	/* Transmit control register */
			int	dzmsr;	/* Modem status register */
		};

struct	dzwregs	{	int	dzcsr;	/* Control and status register */
			int	dzlpr;	/* Line parameter register */
			int	dztcr;	/* Transmit control register */
			char	dztdr;	/* Transmitter data register */
			char	dztbr;	/* Output Break register */
		};


/* Control bits in the DZ11 registers  CSR, RDR, LPR, TCR, MSR, TDR, TBR */

#define	UNUS1	07
#define	MAINT	010		/* Enable maintainence (loopback) */
#define	CLR	020		/* Reset */
#define	SCENABL	040		/* Scan enable */
#define	RIENABL	0100		/* Receive interrupt enable */
#define	RDONE	0200		/* Receiver done */
#define	TLINE	03400		/* Transmitter line ready */
#define	UNUS2	04000
#define	SAE	010000		/* Silo alarm enable */
#define	SA	020000		/* Silo alarm */
#define	TIENABL	040000		/* Transmit interrupt enable */
#define	TDONE	0100000		/* Transmiter done */

#define	RCHAR	0377		/* Received character */
#define	RLINE	03400		/* Receiver line */
#define	UNUS3	04000
#define	PERROR	010000		/* Parity error */
#define	FRERROR	020000		/* Framing error */
#define	OVERRUN	040000		/* Data overrun */
#define	DVALID	0100000		/* Data valid */

#define	LINENO	07		/* Line number */
#define	NBITS	030		/* Number of bits/char */
#define	NBITS_5	0
#define	NBITS_6	010
#define	NBITS_7	020
#define	NBITS_8	030
#define	NSBIT	040		/* Number of stop bits */
#define	NSBIT_1	0
#define	NSBIT_2	040
#define	PENABL	0100		/* Enable parity */
#define	PAR	0200		/* Type of parity */
#define	EPAR	0
#define	OPAR	0200
#define	SPEED	07400		/* Line speed */
#define	B0	(017 << 8)	/* Off */
#define	B50	(000 << 8)	/* 50 baud */
#define	B75	(001 << 8)
#define	B110	(002 << 8)
#define	B134	(003 << 8)
#define	B150	(004 << 8)
#define	B300	(005 << 8)
#define	B600	(006 << 8)
#define	B1200	(007 << 8)
#define	B1800	(010 << 8)
#define	B2000	(011 << 8)
#define	B2400	(012 << 8)
#define	B3600	(013 << 8)
#define	B4800	(014 << 8)
#define	B7200	(015 << 8)
#define	B9600	(016 << 8)
#define	RENABL	010000		/* Receiver enable */
#define	UNUS4	0160000

#define	TENABL	01		/* Transmit enable (shifted approp) */
#define	DTR	0400		/* Turn Data Terminal Ready on/off (") */
#define	RING	01		/* Ring Detect on (") */
#define	CARR	0400		/* Carrier Detect on (") */

#define	TCHAR	0377		/* Tramsnitted character */
#define	BRK	01		/* Turn Break on/off (shifted approp) */


/* For setting line associated bits, getting line, etc */

#define	bline(bits, line)	(bits << line)
#define	getdzln(data)		((data & RLINE) >> 8)
#define	getdzch(data)		(data & RCHAR)


/* A fundamental constant and a few macros for getting unit numbers
 * and line numbers from a minor device number
 */

#define	NDZLIN	8		/* Number of lines per DZ */

#define	dzunit(line)		(line >> 03)
#define	dzline(line)		(line & (NDZLIN - 1))


/* Map a Unix speed into a DZ11 equivalent */

int	speedmap[16]	{	B0,
				B50,
				B75,
				B110,
				B134,
				B150,
				B0,	/* No 200 baud */
				B300,
				B600,
				B1200,
				B1800,
				B2400,
				B4800,
				B9600,
				B0,	/* No external 1 */
				B0	/* or external 2 */
			};


/*  Tuneable parameter; a few initial defaults for parameters and
 *  speeds, etc., and the dialup line sampling rate.
 */

#define	DEFPAR	(RENABL | B9600 | NBITS_8 | NSBIT_2)
#define	DSPD	13
#define	DZMRATE	120			/* Every two seconds */


/* Configuration control; constants and initialized data.
 */

#define NDZ11	2


/* Table of controller addresses and specification of lines with modem
 * control. Setting the appropriate entry enables modem control on that
 * line. Although statically initialized, it can be changed dynamically.
 */

char	dzmodem[NDZ11 * NDZLIN] {
		0, 0, 0, 0, 0, 0, 0, 0,	/* DZ #0 */
		0, 0, 0, 0, 0, 0, 0, 0,	/* DZ #1 */
		};
int	dzaddr[NDZ11]	{
		0170000,			/* DZ #0 */
		0170010,			/* DZ #1 */
		};


/* Static areas - tty structs for these devices; a place to remember
 * which lines have breaks set (we can't read that register for BIS
 * and BIC intructions) and a flag that says modems need to be watched.
 * Also a literal specifying how many DZ lines there are (for system
 * programs). Also a place to remember the pgrp of the guy who had
 * the line open, so that I can zap his pgrp when the phone hangs up.
 * I only need this because the DZ has shitty modem control, and by
 * the time I find out carrier is gone the line has a new pgrp.
 */

struct	tty	dz11[NDZ11 * NDZLIN];
int		dzpgrp[NDZ11 * NDZLIN];
char		dzbrk[NDZ11];
char		dzslp[NDZ11 * NDZLIN];
int		ndz11	NDZ11*NDZLIN;
int		dzcycling;


/* Open - check for valid unit, and if not open enable DZ. If a phone
 * line, wait for it to open, then set default params. Then call ttyopen
 * to do the rest of the work.
 * As a general rule, line = minor number, lineno = line within unit,
 * and unit = unit.
 */

dzopen(dev, flag)

{	register	struct	dzrregs	*dzp;
	register	struct	tty	*tp;
	register	line;
	int		lineno;
	int		dzstart();

	line = dev.d_minor;
	if (line >= (NDZ11 * NDZLIN)) {
		u.u_error = ENXIO;
		return;
		}

	dzp = dzaddr[dzunit(line)];
	tp = &dz11[line];

	if (!(tp->t_state & ISOPEN)) {
		tp->t_state =| SSTART;
		tp->t_addr = dzstart;

		dzp->dzcsr =| (SCENABL | RIENABL | TIENABL);
		lineno = dzline(line);
		dzp->dztcr =| bline(DTR, lineno);

		if (dzmodem[line]) {
			spl4();
			dzp->dzlpr = (DEFPAR | lineno);
			tp->t_state =| WOPEN;
			if (!dzcycling)
				dzstatus();
			while(!(tp->t_state & CARR_ON)) {
				dzslp[line]++;
				sleep(tp, TTOPNPRI);
				dzslp[line]--;
				if (issig()) {
						if ((dzslp[line] == 0) &&
						(!(tp->t_state & ISOPEN))) {
							dzp->dzlpr = lineno;
							dzp->dztcr &=
							 ~(bline((DTR|TENABL),lineno));
							tp->t_state = 0;
							}
						spl0();
						u.u_error = EINTR;
						return;
						}
				}
			spl0();
			}
		  else
			tp->t_state =| CARR_ON;

		tp->t_speeds = (DSPD | (DSPD << 8));
		dzparam(line);
		}

	ttyopen(dev, tp);

	if (dzpgrp[line] == 0)
		dzpgrp[line] = u.u_procp->p_pid;
}


/* Close - wait for output to drain and then turn off the line.
	Note that dzopen sometimes "closes" a half open
	line - so if dzclose changes may need to install
	the same changes in dzopen.
 */

dzclose(dev, flag)

{	register	struct	tty	*tp;
	register	struct	dzrregs	*dzp;
	register	line;
	int		lineno;

	line = dev.d_minor;
	tp = &dz11[line];
	dzp = dzaddr[dzunit(line)];

	wflushtty(tp);

	lineno = dzline(line);
	dzp->dzlpr = lineno;
	dzp->dztcr =& ~(bline((DTR | TENABL), lineno));
	tp->t_state = 0;
	dzpgrp[line] = 0;
}


/* Read and write call the appropriate tty routines, which call
 * others (e.g. dzstart and dzxint) to get things moving.
 */

dzread(dev)

{	register	struct	tty	*tp;
	register	line;

	line = dev.d_minor;
	tp = &dz11[line];
	ttread(tp);
}


dzwrite(dev)

{	register	struct	tty	*tp;
	register	line;

	line = dev.d_minor;
	tp = &dz11[line];
	ttwrite(tp);
}


/* Receiver done interrupt. Loop on the silo, getting characters,
 * and call ttyinput with them, which does all the work.
 */

dzrint(unit)

{	register	struct	dzrregs	*dzp;
	register	struct	tty	*tp;
	register	c;

	dzp = dzaddr[unit];
	unit =* NDZLIN;			/* For getting line number */
	dzp->dzcsr =& ~RIENABL;

	while((c = dzp->dzrdr) & DVALID) {
		tp = &dz11[(getdzln(c) + unit)];

		if (c & PERROR)
			if ((tp->t_flags & (EVENP | ODDP)) != (EVENP | ODDP))
				continue;
		if (c & FRERROR) {
			signal(tp->t_pgrp, SIGINT);
			c = 0;		/* Stick a null in the input buffer */
			}

		ttyinput(getdzch(c), tp);
		}

	dzp->dzcsr =| RIENABL;
}


/* Transmitter interrupt - while there are lines that need characters,
 * get a character for it; if there is a character, if the character
 * isn't a timeout, stuff in, and wake him up if we were waiting and
 * went under the low water mark or finished. If it was a timeout, start
 * the wait. If one of the above failed (no more chars or a timeout) shut
 * off the line.
 */

dzxint(unit)

{	register	struct	dzrregs	*dzp;
	register	struct	tty	*tp;
	register	c;
	int		line;
	int		ttrstrt();

	dzp = dzaddr[unit];
	unit =* NDZLIN;
	dzp->dzcsr =& ~TIENABL;

	while(dzp->dzcsr & TDONE) {
		line = (getdzln(dzp->dzcsr) + unit);
		tp = &dz11[line];

		if ((c = getc(&tp->t_outq)) >= 0) {
			if ((c & 0200) && (!(tp->t_flag2 & LITOUT))) {
				tp->t_state =| TIMEOUT;
				timeout(ttrstrt, tp, (c & 0177));
				}
			  else {
				dzp->dztdr = c;
				if ((tp->t_state & ASLEEP) &&
				    ((tp->t_outq.c_cc == TTLOWAT) ||
				     (tp->t_outq.c_cc == 0))) {
					tp->t_state =& ~ASLEEP;
					wakeup(&tp->t_outq);
					}
				continue;
				}
			}

		dzp->dztcr =& ~(bline(TENABL, dzline(line)));
		}

	dzp->dzcsr =| TIENABL;
}


/* Transmitter start - turn on the line and let the interrupt handler do
 * the work.
 */

dzstart(tp)
register	struct	tty	*tp;

{	register	struct	dzrregs	*dzp;
	register	line;

	if (tp->t_state & TIMEOUT)
		return;

	line = tp - dz11;
	dzp = dzaddr[dzunit(line)];
	dzp->dztcr =| bline(TENABL, dzline(line));
}


/* dzsgtty and dzttymd - call the appropriate handler in tty and then if we
 * have to change params call dzparam. dzsgtty also checks for special
 * break kludge.
 */

dzsgtty(dev, v)
int	*v;

{	register	struct	tty	*tp;
	register	line;
	register	unit;

	line = dev.d_minor;
	tp = &dz11[line];

	if ((v == 0) && (u.u_arg[0].lobyte == 017)) {
		unit = dzunit(line);
		switch (u.u_arg[0].hibyte) {

		  case 1:	dzbrk[unit] =| bline(BRK, dzline(line));
				break;

		  case 2:	dzbrk[unit] =& ~(bline(BRK, dzline(line)));
				break;

		  default:	return;
		  }

		dzaddr[unit]->dztbr = dzbrk[unit];
		return;
		}

	if (ttystty(tp, v))
		return;
	dzparam(line);
}


dzttymd(dev, acp)
int	*acp;

{	register	struct	tty	*tp;
	register	line;

	line  = dev.d_minor;
	tp = &dz11[line];

	if (ttmode(tp, acp))
		return;
	dzparam(line);
}


/* Set the selected parameters into the line status register for the
 * right line. Note that a) since we are not split speed, speed is
 * set from the input speed, and b) there's no way to affect the number
 * of data bits or stop bits, which are set to the maximum value to
 * provide maximal winnage. 
 */

dzparam(line)

{	register	struct	dzrregs	*dzp;
	register	struct	tty	*tp;
	register	parms;
	int		lineno;
	int		speed;

	dzp = dzaddr[dzunit(line)];
	tp = &dz11[line];
	lineno = dzline(line);

	if (tp->t_speeds == 0) {
		dzp->dzlpr = lineno;
		dzp->dztcr =& ~(bline(TENABL, lineno));
		return;
		}

	parms = (lineno | RENABL);
	parms =| speedmap[tp->t_speeds.lobyte];
	parms =| (NBITS_8 | NSBIT_2);

	if ((tp->t_flags & (EVENP | ODDP)) != (EVENP | ODDP)) {
		parms =| PENABL;
		if (tp->t_flags & EVENP)
			parms =| EPAR;
		else
			parms =| OPAR;
		}

	dzp->dzlpr = parms;
}


/* Watch modem lines to detect carrier transitions. Called every
 * few seconds as a callout. If CARR is on and were were waiting
 * for open, wake up people waiting for open. If CARR of and it
 * was on, tell everyone (current pgrp as well as pgrp that opened
 * the port originally). The reason for this is that when the phone
 * is hung up a new process could grab the port (and get it's pgrp)
 * before I notice the phone going away and send a signal to the old
 * pgrp.
 * Another job of dzstatus is to allow processes waiting for
 * open which receive a signal, to abort open call gracefully;
 * so processes waiting for open are scheduled each time thru
 * dzstatus to see if they have received any signals.
 */


dzstatus()

{	register	struct	dzrregs	*dzp;
	register	struct	tty	*tp;
	register	unsigned	line;
	int		numlines;

	numlines = 0;

	for (line = 0; line < (NDZ11 * NDZLIN); line++) {
		tp = &dz11[line];
		if ((!dzmodem[line]) || (!(tp->t_state & (ISOPEN | WOPEN))))
			continue;

		numlines++;
		dzp = dzaddr[dzunit(line)];

		if (dzp->dzmsr & bline(CARR, dzline(line))) 
			tp->t_state =| CARR_ON;
		else
			tp->t_state &= ~CARR_ON;

		if (tp->t_state & WOPEN)
			wakeup(tp);
		else
		if ((tp->t_state & ISOPEN)  && 
			(!(tp->t_state & CARR_ON)) ) {
			if (tp->t_flag2 & HUPSIG)
				pidsignal(dzpgrp[line], SIGHUP);
			  else
				signal(dzpgrp[line], SIGHUP);
			signal(tp->t_pgrp, SIGHUP);
			}
		}

	if (numlines) {
		timeout(dzstatus, 0, DZMRATE);
		dzcycling = 1;
		return;
		}
	dzcycling = 0;
}

dzioctl(dev, ip, cmd, cmdarg)
int	dev;
char	*ip;
int	cmd;
char	*cmdarg;
{
	register struct tty	*tp;

	tp = &dz11[dev.d_minor];
	ttioctl(tp, cmd, cmdarg);
}
