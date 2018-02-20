/*								-*-C-*-
 *	HUMBLE - Functions for hacking inferiors.
 */

#include "c-env.h"
#include "errno.h"
#include "sys/usysio.h"
#include "sys/usysig.h"
#include "sys/file.h"
#include "sysits.h"
#include "sys/humble.h"

#if !SYS_ITS
#error This is an ITS specific file!
#endif

#define PAGE_SIZE 02000
#define PAGE_MASK 01777
#define LOG_PAGE_SIZE 10
#define PAGE_MAP_SIZE 0400
#define LOG_PAGE_MAP_SIZE 8
#define MEMORY_SIZE 01000000
#define LOG_MEMORY_SIZE 18

#define up_to_page(intptr)\
    ((int *) ((((int) (intptr)) + PAGE_MASK) & ~PAGE_MASK))

#define down_to_page(intptr)\
    ((int *) (((int) (intptr)) & ~PAGE_MASK))

#define up_to_page_number(intptr)\
    ((((int) (intptr)) + PAGE_MASK) >> LOG_PAGE_SIZE)

#define page_number(intptr)\
    (((int) (intptr)) >> LOG_PAGE_SIZE)

#define line_number(intptr)\
    (((int) (intptr)) & PAGE_MASK)

#define N_FRAMES 5

static int frames[(N_FRAMES * PAGE_SIZE) + (PAGE_SIZE - 1)];

static int map[PAGE_MAP_SIZE];	/* page # -> frame # */

static int fjob[N_FRAMES];	/* <job> */
static int fpage[N_FRAMES];	/* page # within that job */
static int foffset[N_FRAMES];	/* address adjustment between jobs */
static int faccess[N_FRAMES];	/* access: */
				/* 0 => no page */
				/* 1 => read only */
				/* 2 => read/write */

static int clock;		/* for L.R.U. scheme */
static int ftime[N_FRAMES];	/* for L.R.U. scheme */

#define get_pointer_bound(addr)\
    (- (((int) ((int *) (addr))) | ~PAGE_MASK))

/* Given a job and an address within that job, return an (int *) pointing
 * to that location mapped into our own address space.  The access can be
 * specified as 1, for read only, or 2, for read/write.  If read/write is
 * requested, the page will be created within the job if it doesn't already
 * exist.
 */
static int *get_pointer(job, addr, access)
  int job, addr, access;
{
    int page, frame;

    if (addr < 020 || addr >= MEMORY_SIZE) return (int *) 0;

    if (fjob[frame = map[page = page_number(addr)]] == job
	    && fpage[frame] == page
	    && faccess[frame] >= access) {
	ftime[frame] = ++clock;
	return (int *) (foffset[frame] + addr);
    }

    {
	int i, val, frame_page;

	if (fjob[frame] != job || fpage[frame] != page) {
	    frame = 0;
	    for (i = 1; i < N_FRAMES; i++) {
		if (ftime[i] < ftime[frame]) frame = i;
	    }
	}

	frame_page = up_to_page_number(frames) + frame;

	val = SYSCALL5("corblk", access > 1 ? SC_IMM(_CBNDW) : SC_IMM(_CBNDR),
			SC_IMM(_JSELF), &frame_page, job, &page);

	if (val == _EROPG && access > 1) {
	    val = SYSCALL4("corblk", SC_IMM(_CBNDW),
			    job, &page, SC_IMM(_JSNEW));
	    if (!val) {
		val = SYSCALL5("corblk", SC_IMM(_CBNDW),
				SC_IMM(_JSELF), &frame_page, job, &page);
	    }
	}

	if (val) {
	    faccess[frame] = 0;
	    return (int *) 0;
	}
	
	map[page] = frame;
	fjob[frame] = job;
	fpage[frame] = page;
	faccess[frame] = access;
	ftime[frame] = ++clock;
	foffset[frame] = (frame_page - page) * PAGE_SIZE;
	return (int *) (foffset[frame] + addr);
    }
}

/* Why the hell isn't there a .CALL version of this? */
static void uclose(ch)
  int ch;
{
#asm
	HRLZ 1,-1(17)
	LSH 1,5
	IOR 1,[.UCLOSE 0,]
	XCT 1
#endasm
}

/* The best source of unique sixbit words */
static int gensym()
{
#asm
	.GENSYM 1,
#endasm
}

/* Damnit, I just want to do a simple BLT! */
static void do_blt(from, to, count)
  int *from, *to, count;
{
#asm
	HRLZ 6,-1(17)
	HRR 6,-2(17)
	MOVE 7,-3(17)
	ADDI 7,-1(6)
	BLT 6,(7)
#endasm
}

/* Creates an inferior, returns an FD or -1 if failure */
int j_create()
{
    int fd, ufx, jname, val;

    USYS_BEG();

    if ((fd = _uiofd()) == -1 || !(ufx = _uiofx()))
	USYS_RETERR(EMFILE);

    _uiobsize[ufx] = 9;
    _uioflgs[ufx] |= _UIO_HANDPACK;	/* Block mode channel */

    do {
	jname = gensym();
	val = SYSCALL5("open", SC_IMC(_BIO), _uioch[ufx],
		       SC_SIX("usr"), SC_IMM(0), &jname);
    } while (val == _ENSMD);	/* Keep trying names until unique */

    if (val) USYS_RETERR(ENOENT);

    _openufx(ufx, (O_WRONLY | O_CREAT | O_TRUNC | O_BSIZE_9));
    _uioufx[fd] = ufx;
    USYS_RET(fd);
}

/* Kills the specified inferior.  Just like close() except it actually
 * destroys the job.  Can only be applied to the last open FD.
 */
int j_kill(fd)
  int fd;
{
    int ufx, val;

    USYS_BEG();

    if (fd < 0 || fd >= OPEN_MAX
	  || !(ufx = _uioufx[fd])
	  || _uiotype[ufx] != _DVUSR	/* Better be a job */
	  || _uionopen[ufx] != 1)	/* This better be the only FD */
	USYS_RETERR(EBADF);

    uclose(_uioch[ufx]);	/* Kill it */
    _uiozcnt[ufx] = 0;		/* Channel now closed, so forget these */

    val = close(fd);		/* Shut down rest of I/O system */
    USYS_RET(val);		/* Pass on any errors from close() */
}

/* Devour the TTY.  Always returns 0.  Can't possibly fail! */
/* (I suppose there should be a .CALL version of this, but...) */
int j_dtty()
{
#asm
	.DTTY
	SETZI 1,
#endasm
}

/* Allow an inferior to make use of the TTY.  Returns 0 if it wins, -1
 * if failure.
 * Possible errors:
 *  - Bad FD.
 *  - Job isn't an inferior.
 */
int j_atty(fd)
  int fd;
{
    int ufx;

    USYS_BEG();

    if (fd < 0 || fd >= OPEN_MAX
	  || !(ufx = _uioufx[fd])
	  || _uiotype[ufx] != _DVUSR)
	USYS_RETERR(EBADF);

    if (SYSCALL1("atty", _uiodnum[ufx]))
	USYS_RETERR(EBADF);

    USYS_RET(0);
}

/* Read a user variable.  Returns 0 if it wins, -1 if failure.
 * VAR is a user variable specifier.  LOC is where to store the result.
 * Possible errors:
 *  - Bad FD.
 *  - No such user variable.
 */
int j_vread(fd, var, loc)
  int fd, var, *loc;
{
    int ufx;

    USYS_BEG();

    if (fd < 0 || fd >= OPEN_MAX
	  || !(ufx = _uioufx[fd])
	  || _uiotype[ufx] != _DVUSR)
	USYS_RETERR(EBADF);

    if (SYSCALL3("usrvar", _uiodnum[ufx], &var, SC_VAL(loc)))
	USYS_RETERR(EINVAL);

    USYS_RET(0);
}

/* Write a user variable.  Returns 0 if it wins, -1 if failure.
 * VAR is a user variable specifier.  VAL is the new value.
 * Possible errors:
 *  - Bad FD.
 *  - No such user variable.
 *  - Can't write into this job.
 */
int j_vwrite(fd, var, val)
  int fd, var, val;
{
    int ufx;

    USYS_BEG();

    if (fd < 0 || fd >= OPEN_MAX
	  || !(ufx = _uioufx[fd])
	  || _uiotype[ufx] != _DVUSR)
	USYS_RETERR(EBADF);

    if (SYSCALL3("usrvar", _uiodnum[ufx], &var, &val))
	USYS_RETERR(EINVAL);

    USYS_RET(0);
}

/* Copies COUNT words from BUF into the inferior starting at ADDR.
 * Creating memory if it doesn't exist.  Normally returns 0.  If error it
 * returns the number of words left to be written.
 * Possible errors:
 *  - Bad FD, negative count, negative or huge address.
 *  - System doesn't have enough virtual address space (temporary).
 *  - Can't write into a foreign job.
 */
int j_write(fd, addr, buf, count)
    int fd, addr, *buf, count;
{
    int ufx, *ptr, n;

    USYS_BEG();

    if (fd < 0 || fd >= OPEN_MAX
	    || !(ufx = _uioufx[fd])
	    || _uiotype[ufx] != _DVUSR) {
	errno = EBADF;
	USYS_RET(count);
    }

    if (count < 0 || addr < 0 || addr >= MEMORY_SIZE) {
	errno = EINVAL;
	USYS_RET(count);
    }

    while (addr < 020 && count > 0) {
	if (SYSCALL3("usrmem", _uiodnum[ufx], &addr, &buf[0])) {
	    errno = EACCES;
	    USYS_RET(count);
	}
	buf++;
	addr++;
	count--;
    }

    while (count > 0) {
	if (!(ptr = get_pointer(_uiodnum[ufx], addr, 2))) {
	    errno = EACCES;
	    USYS_RET(count);
	}
	n = get_pointer_bound(addr);
	if (n > count) n = count;
	do_blt(buf, ptr, n);
	buf += n;
	addr += n;
	count -= n;
    }

    USYS_RET(count);
}

/* Copies COUNT words into BUF from the inferior starting at ADDR.
 * Normally returns 0.  If error, it returns the number of words left to be
 * written.
 * Possible errors:
 *  - Bad FD, negative count, negative or huge address.
 *  - Tried to read nonexistent memory.
 */
int j_read(fd,  addr, buf, count)
    int fd, addr, *buf, count;
{
    int ufx, *ptr, n;

    USYS_BEG();

    if (fd < 0 || fd >= OPEN_MAX
	    || !(ufx = _uioufx[fd])
	    || _uiotype[ufx] != _DVUSR) {
	errno = EBADF;
	USYS_RET(count);
    }

    if (count < 0 || addr < 0 || addr >= MEMORY_SIZE) {
	errno = EINVAL;
	USYS_RET(count);
    }

    while (addr < 020 && count > 0) {
	if (SYSCALL3("usrmem", _uiodnum[ufx], &addr, SC_VAL(&buf[0]))) {
	    errno = EACCES;
	    USYS_RET(count);
	}
	buf++;
	addr++;
	count--;
    }

    while (count > 0) {
	if (!(ptr = get_pointer(_uiodnum[ufx], addr, 1))) {
	    errno = EACCES;
	    USYS_RET(count);
	}
	n = get_pointer_bound(addr);
	if (n > count) n = count;
	do_blt(ptr, buf, n);
	buf += n;
	addr += n;
	count -= n;
    }

    USYS_RET(count);
}

/* Recover file position for file UFX after LOAD or PDUMP system call */
static void correct_pos(ufx)
  int ufx;
{
    int syspos;

    if (SYSCALL2("rfpntr", _uioch[ufx], SC_VAL(&syspos))) return;
    _uiopos[ufx] = ((_uioflgs[ufx] & _UIO_HANDPACK) ?
		    (syspos * _uiobword[ufx]) : syspos);
    _uiozcnt[ufx] = 0;
    _uiocnt[ufx] = 0;
    _uioeof[ufx] = 0;
    return;
}

/* Writes a PDUMP file for the job on the freshly opened file.
 * Returns 0 if we win and -1 if we lose.
 * Possible errors:
 *  - Bad FD for job.
 *  - File FD isn't open to DSK.
 *  - DSK or directory full, etc.
 */
int j_dump(job_fd, file_fd)
    int job_fd, file_fd;
{
    int job_ufx, file_ufx, state = 0;

    USYS_BEG();

    if (job_fd < 0 || job_fd >= OPEN_MAX
	    || !(job_ufx = _uioufx[job_fd])
	    || _uiotype[job_ufx] != _DVUSR
	    || file_fd < 0 || file_fd >= OPEN_MAX
	    || !(file_ufx = _uioufx[file_fd]))
	USYS_RETERR(EBADF);

    if (SYSCALL3("pdump", _uiodnum[job_ufx], _uioch[file_ufx], &state))
	USYS_RETERR(EIO);

    correct_pos(file_ufx);

    USYS_RET(0);
}

/* Loads a PDUMP or SBLK file into the job from the freshly opened file.
 * Returns 0 if we win and -1 if we lose.
 * Possible errors:
 *  - Bad FD for job.
 *  - File FD isn't open to DSK.
 *  - File is in the wrong format.
 */
int j_load(job_fd, file_fd)
    int job_fd, file_fd;
{
    int job_ufx, file_ufx;

    USYS_BEG();

    if (job_fd < 0 || job_fd >= OPEN_MAX
	    || !(job_ufx = _uioufx[job_fd])
	    || _uiotype[job_ufx] != _DVUSR
	    || file_fd < 0 || file_fd >= OPEN_MAX
	    || !(file_ufx = _uioufx[file_fd]))
	USYS_RETERR(EBADF);

    if (SYSCALL2("load", _uiodnum[job_ufx], _uioch[file_ufx]))
	USYS_RETERR(EIO);

    correct_pos(file_ufx);

    USYS_RET(0);
}
