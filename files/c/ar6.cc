�r�A�  �   ?*     u#\=�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      FT   F        �|�H-@  Fe  F    �  �rsD@  G   "       %r*J@  G   &       <�|��P  G   P    �  ��|�G�@  G
 &    �  23t:K4@  G:~  P       $Q�|�n�t8  �  �          # include "cc.h"

/*

	C Compiler
	Phase E: Error Message Editor

	Copyright (c) 1977 by Alan Snyder

*/

/**********************************************************************

	global variables:

	cstore		holds identifiers
	fn_cstore	name of cstore file
	asgnop		table of =ops for printing operator tokens
	nodeop		table of node symbols
	sterm		table of terminal symbols
	snterm		table of nonterminal symbols
	sq		table of states

	externally defined routines used:

	copen		open file for input/output
	geti		read integer in internal format
	cputc		output character
	cclose		close file
	ceof		test for end-of-file
	cexit		terminate program
	cprint		formatted print
	rcstore		read CSTORE intermediate file

**********************************************************************/

char	cstore[cssiz], *fn_cstore, *getfmt();

char	*asgnop[]		/* for listing of =op's */
	{"=>>","=<<","=+","=-","=*","=/","=%","=&","=^","=|"};

# include "cnop.h"

char *sterm[] {
	"", "-|", "error", ";", "}", "{",
	"]", "[", ")", "(", ":", ",",
	".", "?", "~", "!", "&", "|",
	"^", "%", "/", "*", "-", "+",
	"=", "<", ">", "++", "--", "==",
	"!=", "<=", ">=", "<<", ">>", "->",
	"=op", "&&", "||", "c", "INT", "CHAR",
	"FLOAT", "DOUBLE", "STRUCT", "AUTO", "STATIC", "EXTERN",
	"RETURN", "GOTO", "IF", "ELSE", "SWITCH", "BREAK",
	"CONTINUE", "WHILE", "DO", "FOR", "DEFAULT", "CASE",
	"ENTRY", "REGISTER", "SIZEOF", "LONG", "SHORT", "UNSIGNED",
	"TYPEDEF", "l", "m", "n", "o", "p",
	"q", "r", "s", "identifier", "integer", "floatcon",
	"string", 0};

char *snterm[] {
	"", "$accept", "program", "external_definition", "function_definition", "function_specification",
	"function_body", "formal_declarations", "compound_statement", "init_declarator_list", "init_declarator", "initializer",
	"initial_value_expression_list", "initial_value", "initial_value_expression", "declaration_list", "declaration", "decl_specifiers",
	"type_specifier", "literal_type_specifier", "sc_specifier", "declarator_list", "declarator", "$declarator",
	"dclr", "function_declarator", "parameter_list", "formal_decl_list", "formal_declaration", "type_decl_list",
	"type_declaration", "$type_specifier", "statement_list", "statement", ".expression", "expression_list",
	"expression", "lexpression", "fterm", "type_identifier", "term", "cast_type",
	"null_decl", "while", "do", "for", "switch", "struct",
	"$identifier", "begin", "end", "constant", "c_term", 0};

int sq[] {
	0, 0, 4098, 9, 21, 40, 41, 42, 43, 44,
	45, 46, 47, 61, 63, 64, 65, 66, 75, 4099,
	4100, 4101, 4112, 4113, 4114, 4115, 4116, 4121, 4135, 4143,
	75, 4121, 4121, 40, 42, 40, 40, 9, 61, 75,
	4102, 4103, 4114, 4115, 4123, 4124, 4126, 4127, 9, 21,
	75, 4121, 10, 4105, 4106, 4118, 4119, 4120, 4116, 3,
	4114, 9, 7, 5, 75, 4144, 8, 8, 75, 4122,
	4126, 5, 4104, 4145, 4124, 9, 21, 75, 4117, 4118,
	4120, 75, 4120, 4120, 10, 9, 14, 15, 22, 76,
	4147, 4148, 11, 3, 5, 16, 22, 75, 76, 77,
	78, 4107, 4109, 9, 7, 8, 6, 4147, 4125, 4126,
	5, 8, 11, 75, 4111, 4112, 4113, 3, 9, 14,
	15, 16, 21, 22, 27, 28, 48, 49, 50, 52,
	53, 54, 55, 56, 57, 58, 59, 60, 62, 76,
	77, 78, 4104, 4128, 4129, 4132, 4134, 4136, 4139, 4140,
	4141, 4142, 75, 11, 3, 8, 4147, 4147, 4148, 4148,
	4148, 21, 20, 19, 23, 22, 33, 34, 25, 26,
	31, 32, 29, 30, 16, 18, 17, 37, 38, 13,
	4106, 4121, 22, 76, 4108, 4109, 4110, 4147, 75, 76,
	77, 8, 6, 4147, 6, 4, 4126, 4125, 75, 10,
	4128, 4112, 4115, 4137, 75, 4132, 4136, 4136, 4136, 4136,
	4136, 4136, 4136, 3, 4132, 75, 4132, 4133, 9, 3,
	3, 10, 4147, 75, 9, 4136, 4, 4146, 75, 4129,
	3, 21, 20, 19, 23, 22, 33, 34, 25, 26,
	31, 32, 29, 30, 16, 18, 17, 37, 38, 13,
	24, 36, 11, 9, 27, 28, 7, 12, 35, 9,
	4129, 9, 9, 4118, 8, 4147, 4147, 4147, 4147, 4147,
	4147, 4147, 4147, 4147, 4147, 4147, 4147, 4147, 4147, 4147,
	4147, 4147, 4147, 4147, 76, 4, 11, 6, 4, 4129,
	4146, 9, 21, 4138, 8, 8, 3, 3, 4132, 4129,
	10, 10, 4137, 4132, 4132, 4132, 4132, 4132, 4132, 4132,
	4132, 4132, 4132, 4132, 4132, 4132, 4132, 4132, 4132, 4132,
	4132, 4132, 4132, 4132, 4132, 4131, 4132, 8, 4132, 75,
	75, 4132, 55, 4130, 4132, 4132, 10, 4, 4110, 8,
	4138, 4138, 7, 4136, 8, 4129, 4129, 8, 10, 11,
	8, 6, 8, 9, 3, 8, 4147, 8, 6, 4147,
	4129, 4132, 4132, 4129, 4132, 4130, 4129, 9, 6, 51,
	8, 3, 8, 4129, 3, 4130, 8, 4129, -1};

/**********************************************************************

	ERROR MESSAGES

**********************************************************************/

char *m1000[] {

/* 1000 */	"INVALID CHARACTER",
/* 1001 */	"UNTERMINATED COMMENT",
/* 1002 */	"CHARACTER CONSTANT TOO LONG",
/* 1003 */	"UNTERMINATED CHARACTER CONSTANT",
/* 1004 */	"%t: BAD FUNCTION RETURN TYPE CHANGED TO POINTER",
/* 1005 */	"%t: INVALID USE OF FUNCTION TYPE CHANGED TO POINTER",
/* 1006 */	"UNUSED AUTOMATIC VARIABLE: %t",
/* 1007 */	0,
/* 1008 */	0,
/* 1009 */	0,
/* 1010 */	"INVALID RENAME CONTROL LINE",
/* 1011 */	"UNTERMINATED COMPILE-TIME CONDITIONAL",
/* 1012 */	"INVALID MANIFEST CONSTANT DEFINITION",
/* 1013 */	"INVALID COMPILER CONTROL LINE",
/* 1014 */	"INVALID INCLUDE CONTROL LINE",
/* 1015 */	0,
/* 1016 */	0,
/* 1017 */	"TOO FEW ARGUMENTS IN MACRO INVOCATION",
/* 1018 */	"AUTOMATIC EXTERNAL DEFINITIONS NOT ALLOWED",
/* 1019 */	"CLASS DECLARATIONS NOT ALLOWED FOR FUNCTIONS",
/* 1020 */	"INVALID IFDEF OR IFNDEF CONTROL LINE",
/* 1021 */	"%t: FUNCTIONS MUST BE EXTERNAL",
/* 1022 */	"%t: INVALID INITIALIZER TYPE",
/* 1023 */	"%t: TOO MANY INITIALIZERS",
/* 1024 */	"%t: INITIALIZATION OF AUTO VARIABLES NOT IMPLEMENTED",
/* 1025 */	0,
/* 1026 */	"%t: INITIALIZATION NOT ALLOWED",
/* 1027 */	"%t NOT A PARAMETER",
/* 1028 */	"EMITOP(C): NO MACRO FOR OP %o",
/* 1029 */	"CHOOSE(C): NO OPLOC FOR OP %o",
/* 1030 */	"INVALID UNDEFINE",
/* 1031 */	"%t: INVALID ARRAY SIZE SPECIFICATION",
/* 1032 */	"%t: BIT FIELD NOT IN STRUCTURE DEFINITION",
/* 1033 */	"%t: INVALID BIT FIELD WIDTH",
/* 1034 */	"%t: BIT FIELD MUST BE INT"
		};

char *m2000[] {

/* 2000 */	"LINE TOO LONG",
/* 2001 */	"UNTERMINATED STRING CONSTANT",
/* 2002 */	"NOTHING TO BREAK FROM",
/* 2003 */	"NOTHING TO CONTINUE",
/* 2004 */	"CASE NOT IN SWITCH",
/* 2005 */	"DEFAULT NOT IN SWITCH",
/* 2006 */	"%q DELETED",
/* 2007 */	"SYNTAX ERROR. PARSE SO FAR:     ",
/* 2008 */	" %q",
/* 2009 */	"TYPE OF EXPRESSION IN GOTO IS INVALID",
/* 2010 */	" |_ ",
/* 2011 */	" %t",
/* 2012 */	"DELETED:  ",
/* 2013 */	"SKIPPED:  ",
/* 2014 */	"DECLARATION OF %t TOO COMPLICATED",
/* 2015 */	"%t: TOO MANY DIMENSIONS",
/* 2016 */	"INVALID REDECLARATION OF %t",
/* 2017 */	"UNDEFINED LABEL: %t",
/* 2018 */	"INVALID REDEFINITION OF STRUCTURE %t",
/* 2019 */	"INVALID RECURSION IN STRUCTURE DEFINITION",
/* 2020 */	"DUPLICATE CASE IN SWITCH",
/* 2021 */	"MULTIPLE DEFAULT STATEMENTS IN SWITCH",
/* 2022 */	"TYPE OF OPERAND OF %n IS INVALID",
/* 2023 */	"LVALUE REQUIRED AS OPERAND OF %n",
/* 2024 */	"UNDEFINED STRUCTURE: %t",
/* 2025 */	"TYPES OF SUBTRACTED POINTERS MUST BE IDENTICAL",
/* 2026 */	"INVALID CONVERSION OF OPERAND OF %n",
/* 2027 */	"%t UNDEFINED",
/* 2028 */	"CALL OF NON-FUNCTION",
/* 2029 */	"%t NOT A MEMBER OF THE SPECIFIED STRUCTURE",
/* 2030 */	"STRUCTURE REQUIRED",
/* 2031 */	"TYPE CLASH IN CONDITIONAL",
/* 2032 */	"INVALID POINTER COMPARISON",
/* 2033 */	"COPYING OF STRUCTURES NOT IMPLEMENTED",
/* 2034 */	"INVALID POINTER SUBTRACTION",
/* 2035 */	"TEXPR(C): NO MATCH FOR OP %o",
/* 2036 */	"%t: INVALID TYPE OF PARAMETER",
/* 2037 */	"INVALID MACRO DEFINITION",
/* 2038 */	"%t: INITIALIZER MUST BE EXTERNAL OR STATIC",
/* 2039 */	"TOO MANY ARGUMENTS IN FUNCTION CALL",
/* 2040 */	"INVALID USE OF UNDEFINED STRUCTURE %t",
/* 2041 */	"%t IS NOT A TYPE",
/* 2042 */	"INVALID USE OF TYPE NAME %t"
		};

char *m4000[] {

/* 4000 */	"NAME TABLE OVERFLOW",
/* 4001 */	"FLOAT/NAME TABLE OVERFLOW",
/* 4002 */	"TOO MANY NESTED DO/WHILE/FOR/SWITCH GROUPS",
/* 4003 */	"PROGRAM TOO COMPLICATED. PARSER STACK OVERFLOW.",
/* 4004 */	"MANIFEST CONSTANT DEFINITION TABLE OVERFLOW",
/* 4005 */	"PROGRAM TOO LARGE: SYMBOL TABLE OVERFLOW",
/* 4006 */	"TYPE TABLE OVERFLOW.",
/* 4007 */	"DECLARATION TOO COMPLICATED",
/* 4008 */	0,
/* 4009 */	0,
/* 4010 */	"SWITCH TABLE OVERFLOW: TOO MANY CASES",
/* 4011 */	"EXPRESSION TOO COMPLICATED",
/* 4012 */	"I GIVE UP",
/* 4013 */	"FUNCTION TOO LARGE",
/* 4014 */	"TOO MANY MACRO ARGUMENTS",
/* 4015 */	"UNTERMINATED MACRO DEFINITION",
/* 4016 */	"MACRO ARGUMENTS TOO LONG",
/* 4017 */	"UNTERMINATED MACRO INVOCATION",
/* 4018 */	"TOO MANY NESTED MACRO INVOCATIONS",
/* 4019 */	"TOO MANY NESTED INCLUDE FILES"
		};

char *m6000[] {

/* 6000 */	"T(P): ATTEMPT TO REFERENCE T(%d)",
/* 6001 */	"TTEXPR(C): EMPTY REGISTER SET",
/* 6002 */	"POP(P): ATTEMPT TO POP EMPTY DCL STACK",
/* 6003 */	"ASTMT(C): OP %d IN CASE CHAIN",
/* 6004 */	"ICB_GET(M): NO MORE INPUT CONTROL BLOCKS",
/* 6005 */	"TP2O(P): BAD TYPE",
/* 6006 */	"TO2P(C): BAD TYPE",
/* 6007 */	"CGOP(C): RESULT IN INDETERMINATE MEMORY LOCATION",
/* 6008 */	"LEX(P): TOKEN BUFFER OVERFLOW",
/* 6009 */	"ATTRIB(P): INVALID CLASS",
/* 6010 */	"SETSP(P): BAD STACK POINTER",
/* 6011 */	0,
/* 6012 */	"CGMOVE(C): NON-TEMPORARY MEMORY LOCATION DEMANDED",
/* 6013 */	"FREEREG(C): BAD ARGUMENT",
/* 6014 */	"FIXTYPE(PC): BAD TYPE",
/* 6015 */	"FIXSTR(C): BAD CALL",
/* 6016 */	0,
/* 6017 */	"RESERVE(C): REGISTER %d NOT FREE",
/* 6018 */	"RESERVE(C): CONFLICTED REGISTER %d NOT FREE",
/* 6019 */	"CLEAR(C): BAD ARGUMENT %d",
/* 6020 */	"ERRCIDN(C): BAD CALL",
/* 6021 */	"CLEAR(C): REGISTER %d BAD UCODE",
/* 6022 */	"SAVE1(C): BAD ARGUMENT %d",
/* 6023 */	"SAVE(C): UNABLE TO FREE REGISTER %d",
/* 6024 */	"MMOVE(C): BAD CTYPE %d",
/* 6025 */	"ANAME(M): ADDRESSING ERROR",
/* 6026 */	"FUDGE(C): BAD ARGUMENT",
/* 6027 */	"READ_NODE(C): BAD OP %d AT LOC %d",
/* 6028 */	0,
/* 6029 */	"CGCALL(C): BAD RETURN REGISTER",
/* 6030 */	"CRETURN(C): BAD RETURN REGISTER",
/* 6031 */	"CHOOSE(C): NO ACCEPTABLE OPLOC FOR OP %o",
/* 6032 */	"LEX(P): INCONSISTENT TOKEN POINTERS",
/* 6033 */	"PARSE(P): ATTEMPT TO POP EMTPY PARSER STACK",
/* 6034 */	0,
/* 6035 */	"DP2O(P): BAD DICTIONARY POINTER",
/* 6036 */	0,
/* 6037 */	"RP2O(P): BAD RECORD POINTER",
/* 6038 */	"CGMOVE(C): UNABLE TO MOVE TO DESIRED LOCATION",
/* 6039 */	"CGMOVE(C): BAD LOC ARGUMENT [%d,%d]",
/* 6040 */	"GETREG(C): BAD ARGUMENT",
/* 6041 */	"INZ(P): BAD INITIALIZER",
/* 6042 */	"DEFCCL(L): COMPILER CONTROL LINE TABLE OVERFLOW",
/* 6043 */	"TOKGET(L): UNRECOGNIZED OPERATOR %d",
/* 6044 */	"MARK(C): REGISTER %d ALREADY MARKED",
/* 6045 */	"UNMARK(C): REGISTER %d NOT MARKED",
/* 6046 */	"CG_FARG(C): DOUBLE ARG IS SHARED",
/* 6047 */	"RO2P(C): BAD RECORD OFFSET"
		};

/**********************************************************************

	ERROR EDITOR PHASE - MAIN ROUTINE

**********************************************************************/

# ifndef CALL_ERROR

main (argc, argv)	int argc; char *argv[];

	{if (argc < 4)
		{cprint ("C7 Called With Too Few Arguments.\n");
		cexit (100);
		}

	cexit (perror (argv[2], argv[3]));
	}

# endif

/**********************************************************************

	PERROR - Error Editor Processing Routine

**********************************************************************/

perror (fner, fncs)

	{int f_error, lineno, i, p[5], errno, cst_read;
	char *f;

	fn_cstore = fncs;
	cst_read = FALSE;

	f_error = copen (fner, MREAD, BINARY);
	if (f_error == OPENLOSS) return (0);

	while (TRUE)
		{errno = geti (f_error);
		if (errno==0)
			{if (cst_read) eputc ('\n');
			cclose (f_error);
			return (0);
			}
		lineno = geti (f_error);
		if (!cst_read)
			{if (rcstore ()) return (0);
			cst_read = TRUE;
			}
		for (i=0;i<5;i++) p[i] = geti (f_error);
		if (lineno>0) eprint ("\n%d:  ", lineno);
		if (errno>=6000) eprint ("COMPILER ERROR.  ");

		if (errno < 2000)
			f = getfmt (errno-1000, m1000, sizeof m1000);
		else if (errno < 4000)
			f = getfmt (errno-2000, m2000, sizeof m2000);
		else if (errno < 6000)
			f = getfmt (errno-4000, m4000, sizeof m4000);
		else f = getfmt (errno-6000, m6000, sizeof m6000);

		if (f==0) {f = "ERROR %d"; p[0]=errno;}
		eprint (f, p[0], p[1], p[2], p[3], p[4]);
		}
	}

/**********************************************************************

	GETFMT - get format given
		N - relative error number
		T - error message table
		Z - size of error message table

**********************************************************************/

char *getfmt (n, t, z)
	char *t[];

	{int nm;

	nm = z / sizeof t[0];
	if (n < 0 || n >= nm) return (0);
	return (t[n]);
	}

/**********************************************************************

	EPRINT - Error PRINT Routine

**********************************************************************/

eprint (fmt,x1,x2,x3,x4,x5,x6,x7,x8,x9)	char fmt[];

	{int *argp, x, c;
	char *s;

	argp = &x1;	/* argument pointer */
	while (c = *fmt++)
		{if (c != '%') eputc (c);
		else
			{x = *argp++;
			switch (c = *fmt++) {

		case 'd':	/* decimal */
				if (x<0) {x= -x; eputc ('-');}
				eprd (x);
				break;

		case 'q':	/* parser state */
				x = sq[x];
				if (x<0) break;
				if (x<010000) eprint ("%s", sterm[x]);
				else eprint ("<%s>", snterm[x-010000]);
				break;

		case 's':	/* string */
				s = x;
				while (c = *s++) eputc (c);
				break;

		case 't':	/* token */
				dtoken (x, *argp++);
				break;

		case 'n':	/* node op */
				eprint ("%s", nodeop[x]);
				break;

		case 'm':	/* string in cstore */
				eprint ("%s", &cstore[x]);
				break;

		default:	eputc (c);
				argp--;
				}
			}
		}
	}

/**********************************************************************

	EPRD - Print Decimal

**********************************************************************/

eprd (n)

	{int a;
	if (a=n/10) eprd (a);
	eputc (n%10+'0');
	}

/**********************************************************************

	EPUTC - write a character onto standard output

	Break lines which exceed 60 characters.

**********************************************************************/

eputc (c)

	{static int column;
	extern int cout;

	if (column >= 59 && c == ' ') c = '\n';
	else if (column >= 80 && c != '\n')
		{cputc ('\n', cout);
		column = 0;
		}
	cputc (c, cout);
	if (c=='\n') column = 0;
	else ++column;
	}

/**********************************************************************

	DTOKEN - Print symbolic representation of token

**********************************************************************/

dtoken (tag, index)

	{if (tag >= TIDN) switch (tag) {

case TIDN:	if (index == UNDEF) {eprint ("unnamed"); break;}
		if (index >= cssiz)	/* structure type or member */
			index =- cssiz;

case TFLOATC: 	eprint ("%s", &cstore[index]);
		break;

case TINTCON:	eprint ("%d", index);
		break;

case TSTRING:	eprint ("\"\"");
		break;
		}

	else if (tag == TEQOP) eprint ("%s", asgnop[index]);
	else eprint ("%s", sterm[tag]);
	}

�   �          # include "cc.h"

/*

	C Compiler
	Routines common to phases M and E

	Copyright (c) 1977 by Alan Snyder

	rcstore

*/


/**********************************************************************

	RCSTORE - Read CSTORE routine

**********************************************************************/

int rcstore ()

	{extern char *fn_cstore, cstore[];
	char *cp, c, *ep;
	int f;

	f = copen (fn_cstore, MREAD, BINARY);
	if (f == OPENLOSS)
		{cprint ("Unable to open '%s'.\n", fn_cstore);
		return (TRUE);
		}
	cp = cstore;
	ep = &cstore[cssiz];

	while (cp < ep)
		{c = cgetc (f);
		if (c <= 0 && ceof (f)) break;
		*cp++ = c;
		}
	cclose (f);
	return (FALSE);
	}

�  !          # include "c.defs"

# define MERGE_LP 1
# define CALL_ERROR 1

/*

	C Compiler Command Routine
	Host machine: PDP-10 ITS


	Compiler Options

	-c	compile only
	-g	do not delete MIDAS file
	-k	do not delete intermediate files
	-s	produce symbol table listing
	-x	syntax check or symbol table listing only
	-b	for compiling big functions

	m=xxx	compile code for machine xxx

	t=abc	run TEST versions of phases a, b, c
	o=abc	run OLD versions of phases a, b, c
	n=abc	run NORMAL versions of phases a, b, c
	d=xxx	set compiler debugging argument to xxx

	Meaningful debugging arguments:

	a	debug code generator
	d	debug parser
	e	debug parser error recovery
	m	debug macro expander


*/

/*     renamings to allow long names     */

# define construct_output_file_names cnsofn
# define execute_phase execph
# define set_program_name setpn
# define set_target settrg
# define write_statistics wrstat
# define print_phase_time prphtm
# define perform_assembly perasm
# define process_options proopt
# define process_minus_option promin
# define process_equal_option proeq

# define phase_name phsnm
# define phase_prog phspr
# define phase_argc phsac
# define phase_argv phsav
# define phase_option phsop
# define phase_et phset
# define phase_pt phspt

# define argv_L avl
# define argv_LP avlp
# define argv_P avp
# define argv_C avc
# define argv_M avm
# define argv_E ave
# define argv_S avs

# define target_name tarnam
# define target_suffix tarsfx
# define target_LP_data tarlpd
# define target_obj tarobj

/*     intermediate file names     */

# define fncs "0.cs"
# define fner "0.er"
# define fnhm "0.hm"
# define fnma "0.ma"
# define fnno "0.no"
# define fnst "0.st"
# define fnsy "0.sy"
# define fnto "0.to"
# define fnty "0.ty"

/*     program file names     */

# ifdef AI
#   define normal_prefix "/dsk/clib/_"
#   define old_prefix "/dsk/clib/_"
#   define test_prefix "/dsk/clib/_"
#endif

# ifndef normal_prefix
#   define normal_prefix "/dsk/c/_"
#   define old_prefix "/dsk/c/_"
#   define test_prefix "/dsk/c/_"
# endif

# define normal_suffix ".bin"
# define old_suffix ".obin"
# define test_suffix ".tbin"

# define pdp10_suffix ""
# define pdp11_suffix "11"
# define his6000_suffix "60"
# define ibm360_suffix "360"
# define cmac_suffix "-CM"
# define unix_suffix "-UX"
# define new10_suffix "-10"

# define file_name_size 30

/*	options     */

char	debug[40];
char	idebug[40];
int	kflag, cflag, gflag, xflag, bflag, sflag;

/*     phase information     */

# define nphase 7

# define phase_L 0
# define phase_LP 1
# define phase_P 2
# define phase_C 3
# define phase_M 4
# define phase_E 5
# define phase_S 6

# define ARGC_LP 10	/* arg counts without optional args */
# define ARGC_P 8
# define ARGC_C 6

char	*argv_L[]	{debug, 0, fnto, fncs, fner, fnst};
char	*argv_LP[]	{debug, 0, fnno, fnty, fner, fnma, fncs, fnst, fnhm, fnsy, 0};
char	*argv_P[]	{debug, fnto, fnno, fnty, fner, fnma, fnhm, fnsy, 0};
char	*argv_C[]	{debug, fner, fnno, fnty, fnma, "3000"};
char	*argv_M[]	{debug, 0, fncs, fner, fnma, fnst, fnhm};
char	*argv_E[]	{debug, fner, fncs};
char	*argv_S[]	{fncs, fnty, fnsy, 0};

char	*phase_name[]	{"L", "LP", "P", "C", "M", "E", "S"};
char	phase_prog[nphase][file_name_size];
char	*phase_argc[]	{6, ARGC_LP, ARGC_P, ARGC_C, 7, 3, 4};
char	**phase_argv[]	{argv_L, argv_LP, argv_P, argv_C, argv_M,
			argv_E, argv_S};
int	phase_option[]	{'n', 'n', 'n', 'n', 'n', 'n', 'n'};
int	phase_et[]	{0, 0, 0, 0, 0, 0, 0};
int	phase_pt[]	{0, 0, 0, 0, 0, 0, 0};

/*     target machine information     */

# define n_target 7

# define pdp10 0
# define pdp11 1
# define his6000 2
# define ibm360 3
# define cmac 4
# define unix 5
# define new10 6

int	target	pdp10;

char	*target_name[] {
	"pdp10",
	"pdp11",
	"his6000",
	"ibm360",
	"cmac",
	"unix",
	"new10"
	};

char	*target_suffix[] {
	pdp10_suffix,
	pdp11_suffix,
	his6000_suffix,
	ibm360_suffix,
	cmac_suffix,
	unix_suffix,
	new10_suffix
	};

char	*target_LP_data[] {
	"",
	"",
	"",
	"",
	"",
	"",
	""
	};

char	*target_obj[] {
	"MIDAS",
	"PALX",
	"GMAP",
	"BAL",
	"CMAC",
	"UNIX",
	"NMIDAS"
	};

/**********************************************************************

	DESCRIPTION OF EXTERNALLY DEFINED ROUTINES

	part of C compiler:

		perror - error message processor

	standard C library:

		copen - open file for input/output
		cprint - formatted output
		cputc - output character
		cclose - close file
		istty - is file a terminal?

	reasonably machine-independent:

		stcpy - copy string
		stcmp - compare strings
		lower - convert char to lower case
		execv - execute program passing vector of args
		delete - delete file
		now - get current date and time
		prcal - print date and time
		pr60th - print time given in 1/60 second units

	grossly ITS dependent:

		fopen - open file
		fillen - determine file length
		close - close file
		fparse - parse file name
		prfile - convert file specification to string
		runame - return user name
		etime - return an elapsed time
		c6tos - convert sixbit to ASCII string
		csto6 - convert ASCII to sixbit string
		execs - execute program passing string command line

*/

char *sconcat();

/**********************************************************************

	THE MAIN PROGRAM

**********************************************************************/

main (argc, argv)	int argc; char *argv[];

	{extern int cout;
	int snum, cc, f, i, ttyflag;
	cal start_time;
	char *s, *source, *fargv[50], buffer[2000];
	char obj_name[file_name_size],
		rel_name[file_name_size],
		sym_name[file_name_size];

	--argc;
	++argv;
	argc = process_options (argc, argv);
	argc = exparg (argc, argv, fargv, buffer);
	argv = fargv;

# ifdef MERGE_LP

	s = target_LP_data[target];
	if (*s)
		{phase_argc[phase_LP] = ARGC_LP+1;
		argv_LP[ARGC_LP] = s;
		}
	else phase_argc[phase_LP] = ARGC_LP;

# endif

# ifndef MERGE_LP

	s = target_LP_data[target];
	if (*s)
		{phase_argc[phase_P] = ARGC_P+1;
		argv_P[ARGC_P] = s;
		}
	else phase_argc[phase_P] = ARGC_P;

# endif
	ttyflag = istty (cout);

	for (snum = 0; snum < argc; ++snum)
		{source = argv[snum];

	/*	check that source file exists		*/

		if ((f = copen (source, 'r')) == OPENLOSS)
			{cprint ("Can't Find '%s'.\n", source);
			continue;
			}
		cclose (f);

		if (!ttyflag || argc>1) cprint ("%s:\n", source);
		now (&start_time);

	/*	fix debug arg	*/

		if (sflag) sconcat (debug, 2, idebug, "s");
		else if (xflag) sconcat (debug, 2, idebug, "x");
		else stcpy (idebug, debug);

	/*	construct output file names from source file name	*/

		construct_output_file_names (source, obj_name,
			rel_name, sym_name);

		cclose (copen (fner, 'w', "b"));

		for (i=0;i<nphase;++i) phase_pt[i] = -1;
		argv_M[1] = obj_name;
		argv_S[3] = sym_name;

# ifdef MERGE_LP

		argv_LP[1] = source;
		cc = execute_phase (phase_LP);

# endif

# ifndef MERGE_LP

		argv_L[1] = source;
		cc = execute_phase (phase_L);
		if (!cc) cc = execute_phase (phase_P);

# endif

		if (!cc && !xflag) cc = execute_phase (phase_C);
		if (!cc && !xflag) cc = execute_phase (phase_M);

# ifdef CALL_ERROR

		perror (fner, fncs);

# endif

# ifndef CALL_ERROR

		execute_phase (phase_E);

# endif

		if (!kflag)
			{delete (fnto);
			delete (fner);
			delete (fnno);
			delete (fnma);
			delete (fnhm);
			delete (fnst);
			}

		if (sflag) execute_phase (phase_S);

		if (!kflag)
			{delete (fncs);
			delete (fnsy);
			delete (fnty);
			}

		write_statistics (source, &start_time);

		if (!cc && !xflag && !cflag &&
		    (target==pdp10 || target==new10))
			{cc = perform_assembly (obj_name, rel_name);
			if (!gflag && !cc) delete (obj_name);
			}
		}
	}

/**********************************************************************

	PROCESS_OPTIONS - Process options in command arguments
		and remove options from argument list.

**********************************************************************/

int process_options (argc, argv)
	char *argv[];

	{char *s, **ss, **dd;
	int n, opt;

	kflag = cflag = gflag = xflag = bflag = sflag = FALSE;

	dd = ss = argv;
	n = 0;
	while (--argc >= 0)
		{s = *ss++;
		if (s[0] == '-') process_minus_option (s+1);
		else if ((opt = s[0]) && s[1] == '=')
			process_equal_option (opt, s+2);
		else
			{*dd++ = s;
			++n;
			}
		}
	return (n);
	}

/**********************************************************************

	PROCESS_MINUS_OPTION

**********************************************************************/

process_minus_option (s)
	char *s;

	{int c;

	while (c = *s)
		{*s++ = c = lower (c);
		switch (c) {
	case 'k':	kflag = TRUE; break;
	case 'c':	cflag = TRUE; break;
	case 'g':	gflag = TRUE; break;
	case 's':	sflag = TRUE; break;
	case 'x':	xflag = TRUE; break;
	case 'b':	bflag = TRUE;
			argv_C[5] = "10000";
			break;
	default:	cprint ("Unrecognized option: -%c\n", c);
			break;
			}
		}
	}

/**********************************************************************

	PROCESS_EQUAL_OPTION

**********************************************************************/

process_equal_option (opt, s)
	char *s;

	{char *r;
	int c;

	switch (opt = lower (opt)) {
	case 'd':	r = idebug;
			while (c = *s++) *r++ = lower (c);
			*r = 0;
			return;
	case 'n':
	case 'o':
	case 't':	while (c = *s++) set_phase_option (c, opt);
			return;

	case 'm':	set_target (s);
			return;

	default:	cprint ("Unrecognized option: %c=%s\n", opt, s);
			}
	}

/**********************************************************************

	CONSTRUCT_OUTPUT_FILE_NAMES

	Construct assembler, relocatable, and symbol table listing
	file names from source file name.  For the ITS version, 
	output file names are formed by changing the FNAME2 and
	setting the DEVICE to DSK.

**********************************************************************/

construct_output_file_names (source, obj_name, rel_name, sym_name)
	char *source, *obj_name, *rel_name;

	{filespec f;

	fparse (source, &f);
	f.dev = csto6 ("DSK");
	f.fn2 = csto6 (target_obj[target]);
	prfile (&f, obj_name);
	if (target==new10) f.fn2 = csto6 ("NSTK");
	else f.fn2 = csto6 ("STK");
	prfile (&f, rel_name);
	f.fn2 = csto6 ("SYMTAB");
	prfile (&f, sym_name);
	}

/**********************************************************************

	EXECUTE PHASE

**********************************************************************/

execute_phase (n)	int n;

	{extern	int exctime, exccode;
	int	t;

	set_program_name (n);
	t = etime ();
	if (execv (phase_prog[n], phase_argc[n], phase_argv[n]))
		{cprint ("Unable to execute phase %s\n", phase_name[n]);
		return (-1);
		}
	phase_et[n] = etime () - t;
	phase_pt[n] = exctime;
	return (exccode);
	}

/**********************************************************************

	SET_PHASE_OPTION

	Set phase option for phase PC to be OC.

**********************************************************************/

set_phase_option (pc, oc)

	{int n;

	pc = lower (pc);
	switch (pc) {

# ifdef MERGE_LP

		case 'l':
		case 'p':	n = phase_LP; break;

# endif

# ifndef MERGE_LP

		case 'l':	n = phase_L; break;
		case 'p':	n = phase_P; break;

# endif

		case 'c':	n = phase_C; break;
		case 'm':	n = phase_M; break;
		case 'e':	n = phase_E; break;
		case 's':	n = phase_S; break;
		default:	cprint ("Unrecognized Phase Designation: %c\n", pc);
				return;
		}
	phase_option[n] = lower (oc);
	}

/**********************************************************************

	SET_PROGRAM_NAME

	Construct the file name of program for the given phase.

**********************************************************************/

set_program_name (n)	int n;

	{char *r, *s, *t;

	switch (phase_option[n]) {
		case 'o':	r = old_prefix; s = old_suffix;
				break;
		case 't':	r = test_prefix; s = test_suffix;
				break;
		default:	cprint ("Unrecognized Phase Option: %c\n",
					phase_option[n]);
		case 'n':	r = normal_prefix; s = normal_suffix;
				break;
		}
	t = target_suffix[target];
	if (n == phase_E || n == phase_S) t = "";
	sconcat (phase_prog[n], 4, r, phase_name[n], t, s);
	}

/**********************************************************************

	SET_TARGET - Set Target Machine

**********************************************************************/

set_target (s)
	char *s;

	{int c, i;
	char *p;

	p = s;
	while (c = *p) *p++ = lower (c);
	for (i=0; i<n_target; ++i)
		{if (stcmp (s, target_name[i]))
			{target = i;
			return;
			}
		}
	cprint ("Unrecognized target machine: %s\n", s);
	}

/**********************************************************************

	WRITE_STATISTICS

**********************************************************************/

write_statistics (source, st)
	char *source;
	cal *st;

	{int f, flag, i;
	char temp[10];
	filespec fs;

	fparse (source, &fs);
	if (fs.dir == 0) fs.dir = rsname ();
	flag = TRUE;
	f = copen ("/dsk/clib/c.stat", 'a');
	if (f == OPENLOSS) f = copen ("/dsk/common/c.stat", 'a');
	if (f == OPENLOSS) return;
	cputc ('\n', f);
	c6tos (runame (), temp);
	cprint (f, "%s - ", temp);
	prcal (st, f);
	c6tos (fs.dir, temp);
	slower (temp);
	cprint (f, " - %s", temp);
	c6tos (fs.fn1, temp);
	slower (temp);
	cprint (f, "/%s", temp);

# define hackery if (flag) {cprint (f, " ("); flag=FALSE;} else cputc (' ', f)

	if (cflag || gflag || kflag || xflag || bflag || sflag)
		{hackery;
		if (cflag) cputc ('c', f);
		if (gflag) cputc ('g', f);
		if (kflag) cputc ('k', f);
		if (xflag) cputc ('x', f);
		if (bflag) cputc ('b', f);
		if (sflag) cputc ('s', f);
		}

	if (*idebug)
		{hackery;
		cprint (f, "d=%s", idebug);
		}
	if (target)
		{hackery;
		cprint (f, "m=%s", target_name[target]);
		}
	if (!flag) cputc (')', f);

	cprint (f, "\n\n");
	for (i=0;i<nphase;++i) print_phase_time (i, f);
	cclose (f);
	}

/**********************************************************************

	PRINT_PHASE_TIME - As Part Of Statistics

**********************************************************************/

print_phase_time (n, f)

	{if (phase_pt[n] != -1)
		{cprint (f, phase_name[n]);
		if (!phase_name[n][1]) cputc (' ', f);
		cprint (f, " P=");
		pr60th (phase_pt[n], f);
		cprint (f, " E=");
		pr60th (phase_et[n], f);
		cputc ('\n', f);
		}
	}

/**********************************************************************

	PERFORM_ASSEMBLY - Create the relocatable file
	from the assembler file

	return TRUE iff an error occurred

**********************************************************************/

int perform_assembly (obj_name, rel_name)
	char *obj_name, *rel_name;

	{char *s, temp[100];
	int f;

	/* construct Assembler command line */

	s = stcpy (rel_name, temp);
	s = stcpy (" _ ", s);
	s = stcpy (obj_name, s);
	s = stcpy (" (w)", s);

	/* execute Assembler */

	if (execs ("/dsk/clib/ts.midas", temp))
		{cprint ("Unable to Assemble.\n");
		return (TRUE);
		}

	/* construct Assembler record file name */

	s = stcpy (rel_name, temp);
	s = stcpy ("ERR", s-(target==pdp10 ? 3 : 4));

	/* examine Assembler record file */

	f = copen (temp, 'r');
	if (f != OPENLOSS)	/* look for '-' <digit>+ '\t' */
		{register int c;
		while ((c = cgetc (f)) > 0)
			{if (c == '-')
				{c = cgetc (f);
				if (!digit (c)) continue;
				while (digit (c)) c = cgetc (f);
				if (c != '\t') continue;
				cprint ("Assembler Errors.\n");
				cclose (f);
				return (TRUE);
				}
			}
		cclose (f);
		delete (temp);
		}
	return (FALSE);
	}

int digit (c)
	{return (c>='0' && c<='9');}

/**********************************************************************

	SCONCAT - String Concatenate

	concatenate strings S1 ... Sn into buffer B
	return B

**********************************************************************/

char *sconcat (b, n, s1, s2, s3, s4, s5, s6, s7, s8)
	char *b, *s1, *s2, *s3, *s4, *s5, *s6, *s7, *s8;

	{char **s, *p, *q;
	int c;

	q = b;
	s = &s1;

	while (--n >= 0)
		{p = *s++;
		while (c = *p++) *q++ = c;
		}

	*q = 0;
	return (b);
	}

/**********************************************************************

	SLOWER - Convert String To Lower Case

**********************************************************************/

slower (s) char *s;

	{int c;
	while (c = *s) *s++ = lower (c);
	}
�  	          /*

	C Compiler
	Manifest Constants Include File

*/


/*	configuration selectors

	To select the indicated option, uncomment
	the corresponding #define.

	To not select the indicated option, enclose
	the corresponding #define in comments.

*/

# define MERGE_LP 1
			/* are phases L and P merged?
			   affects C1.C and C21.C only	*/
# define CALL_ERROR 1
			/* is error phase called directly by control
			   routine?  affects C5.C only */

# define BOTHCASE 1
			/* distinct upper/lower case in idns */

/*	various values		*/

# define MREAD 'r'	/* read mode */
# define MWRITE 'w'	/* write mode */
# define MAPPEND 'a'	/* append mode */
# define TEXT "t"	/* text file */
# define BINARY "b"	/* binary file */
# define LEXEOF 0	/* lexget end of file indicator */

# define TRUE 1
# define FALSE 0
# define NULL 0
# define UNDEF -1
# define OPENLOSS -1	/* value returned for unsuccessful open */

/*	table sizes	*/

# define maxfarg 30	/* maximum number of function arguments */
# define maxreg 16	/* maximum number of abstract machine registers */
# define MAXDIMS 8	/* maximum number of dimensions in a type */
# define maxccl 10	/* size of compiler control line table */
# define maxargs 10	/* maximum number of args to input macro */
# define maxdepth 5	/* maximum depth of input macro expansion */
# define maxicb 3	/* maximum nesting of included files */
# define margbsz 200	/* size of table holding macro arg tokens */
# define mhsize 0400	/* size of macro hash table */
# define mhmask 0377	/* mask for accessing macro hash table */
# define hshsize 1999	/* size of hash table (prefer prime) */
# define icb_size 10	/* macro definition level */
# define cssiz 10000	/* size of character store */
# define stsize 300	/* size of symbol table (dict) */
# define mcdsz 3000	/* manifest constant definition table size */
# define coresz 6600	/* size of core array for function tree */
# define acoresz 150	/* size of array for expression tree */
# define pssize 300	/* size of parser stack */
# define tbsize 30	/* size of parser token buffer */
# define TTSIZE 600	/* type table size */
# define GSSIZE 20	/* group stack size */

/*	character types		*/

# define _LETTER 0	/* identifier or keyword */
# define _DIGIT 1	/* constant or identifier */
# define _QUOTE 2	/* character string */
# define _MCOP 3	/* possible beginning of multi-character op */
# define _EOL 4		/* carriage return or newline */
# define _BLANK 5	/* blank or tab */
# define _INVALID 6	/* invalid character */
# define _SQUOTE 7	/* character constant */
# define _PERIOD 8	/* operator or beginning of float constant */
# define _ESCAPE 9	/* escape character */
# define _CONTROL 10	/* compiler control line indicator */
# define _NAME		ttype<2

/*	token tags	*/

# define TEOF 1		/* end of file */
# define TCONTROL 2	/* beginning of control line (internal) */
# define TEQOP 36	/* =op's */
# define TIDN 75	/* identifiers */
# define TINTCON 76	/* integer constants */
# define TFLOATC 77	/* float constants */
# define TSTRING 78	/* string constants */
# define TLINENO 79	/* line number */
# define TMARG 80	/* macro argument (internal) */

/*	type tags	*/

# define TTCHAR 0	/* the first four values may not be changed */
# define TTINT 1
# define TTFLOAT 2
# define TTDOUBLE 3
# define TTLONG 4
# define TTUNSIGNED 5
# define TTUNDEF 6
# define TTCFIELD 7
# define TTIFIELD 8
# define TTPTR 9
# define TTFUNC 10
# define TTARRAY 11
# define TTSTRUCT 12
# define TTDUMMY 13

/*	type modifier indicators	*/

# define MPTR 1
# define MFUNC 2
# define MARRAY 3

/*	storage classes	*/

# define c_register 0		/* register */
# define c_temp 1		/* temporary */
# define c_auto 1		/* automatic */
# define c_extdef 2		/* external definition */
# define c_static 3		/* static */
# define c_param 4		/* parameter */
# define c_label 5		/* label */
# define c_integer 6		/* integer literal */
# define c_float 7		/* floating-point literal */
# define c_string 8		/* string literal */
# define c_indirect 9		/* indirection through reg #0 ... */
# define c_extern 50		/* external */
# define c_struct 51		/* structure type */
# define c_mos 52		/* member of structure */
# define c_typedef 53		/* type defintion */
# define c_ustruct 54		/* undefined structure type */
# define c_ulabel 55		/* undefined label */
# define c_uauto 56		/* unused auto variable */

/*	condition codes		*/

# define cc_eq0	0
# define cc_ne0	1
# define cc_lt0	2
# define cc_gt0	3
# define cc_le0	4
# define cc_ge0	5

/*	ctypes		*/

# define ct_bad 0
# define ct_struct 1
# define ct_char 2
# define ct_int 3
# define ct_float 4
# define ct_double 5
# define ct_p0 6
# define ct_p1 7
# define ct_p2 8
# define ct_p3 9

/*	loc flags	*/

# define l_label 0
# define l_reg 1
# define l_mem 2
# define l_any 3

/*	nodes		*/

# define n_idn		2
# define n_int		3
# define n_float	4
# define n_string	5
# define n_call		6
# define n_qmark	7
# define n_incb		8
# define n_inca		9
# define n_decb		10
# define n_deca		11
# define n_star		12
# define n_addr		13
# define n_uminus	14
# define n_bnot		15
# define n_tvnot	16
# define n_band		17
# define n_bior		18
# define n_bxor		19
# define n_mod		20
# define n_div		21
# define n_times	22
# define n_minus	23
# define n_plus		24
# define n_assign	25
# define n_eq		26
# define n_ne		27
# define n_lt		28
# define n_gt		29
# define n_le		30
# define n_ge		31
# define n_ls		32
# define n_rs		33
# define n_ars		34
# define n_als		35
# define n_aplus	36
# define n_aminus	37
# define n_atimes	38
# define n_adiv		39
# define n_amod		40
# define n_aand		41
# define n_axor		42
# define n_aior		43
# define n_tv_and	44
# define n_tv_or	45
# define n_dot		46
# define n_colon	47
# define n_comma	48
# define n_sizeof	49
# define n_if		80
# define n_goto		81
# define n_branch	82
# define n_label	83
# define n_stmtl	84
# define n_switch	85
# define n_case		86
# define n_def		87
# define n_return	88
# define n_prog		89
# define n_exprs	90
# define n_elist	91

/*	initializer types	*/

# define i_int 1
# define i_float 2
# define i_negfloat 3
# define i_string 4
# define i_idn 5

/*	enodes		*/

# define e_iminus 0000
# define e_dminus 0001
# define e_incbi 0002
# define e_bnot 0006
# define e_not 0007
# define e_lseq 0010
# define e_sw 0012
# define e_incbc 0013
# define e_a0 0017
# define e_a3 0022
# define e_ind 0023
# define e_jz0 0024
# define e_jz3 0027
# define e_jn0 0030
# define e_jn3 0033
# define e_addi 0100
# define e_eaddi 0101
# define e_subi 0104
# define e_esubi 0105
# define e_muli 0110
# define e_divi 0114
# define e_mod 0120
# define e_ls 0122
# define e_els 0123
# define e_rs 0124
# define e_ers 0125
# define e_band 0126
# define e_eand 0127
# define e_xor 0130
# define e_exor 0131
# define e_bor 0132
# define e_eor 0133
# define e_and 0134
# define e_or 0135
# define e_p0sub 0136
# define e_assign 0137
# define e_argi 0140
# define e_argd 0141
# define e_arg0 0142
# define e_add0 0146
# define e_add3 0151
# define e_sub0 0152
# define e_sub3 0155
# define e_movec 0160
# define e_comma 0170
# define e_idn 0177
# define e_int 0176
# define e_string 0175
# define e_float 0174
# define e_call 0173
# define e_colon 0172
# define e_qmark 0171
# define e_eqi 0200
# define e_eqd 0206
# define e_eqp0 0214
# define e_gep3 0243
# define e_incbf 0250
# define e_incbd 0254
# define e_incb0 0260

/*	object_modes		*/

# define o_pure 0	/* pure - instructions only */
# define o_impure 1	/* impure - uninitialized data areas */
# define o_data 2	/* data - initialized data areas */
# define o_pdata 3	/* pure data - constants */

# define pure	if (objmode != o_pure) mpure()
# define impure	if (objmode != o_impure) mimpure()
# define data	if (objmode != o_data) mdata()
# define pdata	if (objmode != o_pdata) mpdata()

/*	structure definitions		*/

# define typedesc struct _typedesc
# define type struct _typedesc *
# define field struct _fielddesc
struct _typedesc {
	int	tag;	/* the basic type or type modifier */
	int	size;	/* the size of objects of the type
			   -1 => size undefined */
	int	align;	/* the alignment class of objects of the type */
	type	val;	/* first additional value */
	int	nelem;	/* number of elements in an array */
	};
struct _fielddesc {
	int	name;	/* UNDEF => end of list */
	type	dtype;	/* field type */
	int	offset;	/* offset in structure */
	};
struct _token {int tag, index, line;};
struct _cclent {int cname; int (*cproc)();};

# define token struct _token
# define cclent struct _cclent

/* machine dependencies of the machine on which the compiler is running */

# define WORDMASK 077777777777		/* mask all but high 3 bits */
# define SMALLEST "-34359738368"	/* smallest integer as string */
    J          char	*nodeop [] {
	"",
	"end-file",
	"idn",
	"integer",
	"float",
	"string",
	"call",
	"?",
	"++(pre)",
	"++(post)",
	"--(pre)",
	"--(post)",
	"* (un)",
	"& (un)",
	"- (un)",
	"~ (un)",
	"! (un)",
	"& (bin)",
	"|",
	"^",
	"%",
	"/",
	"* (bin)",
	"- (bin)",
	"+",
	"=",
	"<",
	">",
	"==",
	"!=",
	"<=",
	">=",
	"<<",
	">>",
	"=>>",
	"=<<",
	"=+",
	"=-",
	"=*",
	"=/",
	"=%",
	"=&",
	"=^",
	"=|",
	"&&",
	"||",
	".",
	":",
	",",
	"sizeof",
	"","","","","","","","","","","","",
	"","","","","","","","","","","","","","","","","","",
	"if",
	"goto",
	"branch",
	"label",
	"stmtl",
	"switch",
	"case",
	"default",
	"return",
	"program",
	"exprstmt",
	"elist"};
�  �          # include "c.defs"

# define MERGE_LP 1
# define CALL_ERROR 1

/*

	C Compiler Command Routine
	Host machine: PDP-10 ITS


	Compiler Options

	-c	compile only
	-g	do not delete MIDAS file
	-k	do not delete intermediate files
	-s	produce symbol table listing
	-x	syntax check or symbol table listing only
	-b	for compiling big functions

	m=xxx	compile code for machine xxx

	t=abc	run TEST versions of phases a, b, c
	o=abc	run OLD versions of phases a, b, c
	n=abc	run NORMAL versions of phases a, b, c
	d=xxx	set compiler debugging argument to xxx

	Meaningful debugging arguments:

	a	debug code generator
	d	debug parser
	e	debug parser error recovery
	m	debug macro expander


*/

/*     renamings to allow long names     */

# define construct_output_file_names cnsofn
# define execute_phase execph
# define set_program_name setpn
# define set_target settrg
# define write_statistics wrstat
# define print_phase_time prphtm
# define perform_assembly perasm
# define process_options proopt
# define process_minus_option promin
# define process_equal_option proeq

# define phase_name phsnm
# define phase_prog phspr
# define phase_argc phsac
# define phase_argv phsav
# define phase_option phsop
# define phase_et phset
# define phase_pt phspt

# define argv_L avl
# define argv_LP avlp
# define argv_P avp
# define argv_C avc
# define argv_M avm
# define argv_E ave
# define argv_S avs

# define target_name tarnam
# define target_suffix tarsfx
# define target_LP_data tarlpd
# define target_obj tarobj

/*     intermediate file names     */

# define fncs "0.cs"
# define fner "0.er"
# define fnhm "0.hm"
# define fnma "0.ma"
# define fnno "0.no"
# define fnst "0.st"
# define fnsy "0.sy"
# define fnto "0.to"
# define fnty "0.ty"

/*     program file names     */

# define normal_prefix "/dsk/c/_"
# define old_prefix "/dsk/c/_"
# define test_prefix "/dsk/c/_"

# define normal_suffix ".bin"
# define old_suffix ".obin"
# define test_suffix ".tbin"

# define pdp10_suffix ""
# define pdp11_suffix "11"
# define his6000_suffix "60"
# define ibm360_suffix "360"
# define cmac_suffix "-CM"
# define unix_suffix "-UX"
# define new10_suffix "-10"

# define file_name_size 30

/*	options     */

char	debug[40];
char	idebug[40];
int	kflag, cflag, gflag, xflag, bflag, sflag;

/*     phase information     */

# define nphase 7

# define phase_L 0
# define phase_LP 1
# define phase_P 2
# define phase_C 3
# define phase_M 4
# define phase_E 5
# define phase_S 6

# define ARGC_LP 10	/* arg counts without optional args */
# define ARGC_P 8
# define ARGC_C 6

char	*argv_L[]	{debug, 0, fnto, fncs, fner, fnst};
char	*argv_LP[]	{debug, 0, fnno, fnty, fner, fnma, fncs, fnst, fnhm, fnsy, 0};
char	*argv_P[]	{debug, fnto, fnno, fnty, fner, fnma, fnhm, fnsy, 0};
char	*argv_C[]	{debug, fner, fnno, fnty, fnma, "3000"};
char	*argv_M[]	{debug, 0, fncs, fner, fnma, fnst, fnhm};
char	*argv_E[]	{debug, fner, fncs};
char	*argv_S[]	{fncs, fnty, fnsy, 0};

char	*phase_name[]	{"L", "LP", "P", "C", "M", "E", "S"};
char	phase_prog[nphase][file_name_size];
char	*phase_argc[]	{6, ARGC_LP, ARGC_P, ARGC_C, 7, 3, 4};
char	**phase_argv[]	{argv_L, argv_LP, argv_P, argv_C, argv_M,
			argv_E, argv_S};
int	phase_option[]	{'n', 'n', 'n', 'n', 'n', 'n', 'n'};
int	phase_et[]	{0, 0, 0, 0, 0, 0, 0};
int	phase_pt[]	{0, 0, 0, 0, 0, 0, 0};

/*     target machine information     */

# define n_target 7

# define pdp10 0
# define pdp11 1
# define his6000 2
# define ibm360 3
# define cmac 4
# define unix 5
# define new10 6

int	target	pdp10;

char	*target_name[] {
	"pdp10",
	"pdp11",
	"his6000",
	"ibm360",
	"cmac",
	"unix",
	"new10"
	};

char	*target_suffix[] {
	pdp10_suffix,
	pdp11_suffix,
	his6000_suffix,
	ibm360_suffix,
	cmac_suffix,
	unix_suffix,
	new10_suffix
	};

char	*target_LP_data[] {
	"",
	"",
	"",
	"",
	"",
	"",
	""
	};

char	*target_obj[] {
	"MIDAS",
	"PALX",
	"GMAP",
	"BAL",
	"CMAC",
	"UNIX",
	"NMIDAS"
	};

/**********************************************************************

	DESCRIPTION OF EXTERNALLY DEFINED ROUTINES

	part of C compiler:

		perror - error message processor

	standard C library:

		copen - open file for input/output
		cprint - formatted output
		cputc - output character
		cclose - close file
		istty - is file a terminal?

	reasonably machine-independent:

		stcpy - copy string
		stcmp - compare strings
		lower - convert char to lower case
		execv - execute program passing vector of args
		delete - delete file
		now - get current date and time
		prcal - print date and time
		pr60th - print time given in 1/60 second units

	grossly ITS dependent:

		fopen - open file
		fillen - determine file length
		close - close file
		fparse - parse file name
		prfile - convert file specification to string
		runame - return user name
		etime - return an elapsed time
		c6tos - convert sixbit to ASCII string
		csto6 - convert ASCII to sixbit string
		execs - execute program passing string command line

*/

char *sconcat();

/**********************************************************************

	THE MAIN PROGRAM

**********************************************************************/

main (argc, argv)	int argc; char *argv[];

	{extern int cout;
	int snum, cc, f, i, ttyflag;
	cal start_time;
	char *s, *source, *fargv[50], buffer[2000];
	char obj_name[file_name_size],
		rel_name[file_name_size],
		sym_name[file_name_size];

	--argc;
	++argv;
	argc = process_options (argc, argv);
	argc = exparg (argc, argv, fargv, buffer);
	argv = fargv;

# ifdef MERGE_LP

	s = target_LP_data[target];
	if (*s)
		{phase_argc[phase_LP] = ARGC_LP+1;
		argv_LP[ARGC_LP] = s;
		}
	else phase_argc[phase_LP] = ARGC_LP;

# endif

# ifndef MERGE_LP

	s = target_LP_data[target];
	if (*s)
		{phase_argc[phase_P] = ARGC_P+1;
		argv_P[ARGC_P] = s;
		}
	else phase_argc[phase_P] = ARGC_P;

# endif
	ttyflag = istty (cout);

	for (snum = 0; snum < argc; ++snum)
		{source = argv[snum];

	/*	check that source file exists		*/

		if ((f = copen (source, 'r')) == OPENLOSS)
			{cprint ("Can't Find '%s'.\n", source);
			continue;
			}
		cclose (f);

		if (!ttyflag || argc>1) cprint ("%s:\n", source);
		now (&start_time);

	/*	fix debug arg	*/

		if (sflag) sconcat (debug, 2, idebug, "s");
		else if (xflag) sconcat (debug, 2, idebug, "x");
		else stcpy (idebug, debug);

	/*	construct output file names from source file name	*/

		construct_output_file_names (source, obj_name,
			rel_name, sym_name);

		cclose (copen (fner, 'w', "b"));

		for (i=0;i<nphase;++i) phase_pt[i] = -1;
		argv_M[1] = obj_name;
		argv_S[3] = sym_name;

# ifdef MERGE_LP

		argv_LP[1] = source;
		cc = execute_phase (phase_LP);

# endif

# ifndef MERGE_LP

		argv_L[1] = source;
		cc = execute_phase (phase_L);
		if (!cc) cc = execute_phase (phase_P);

# endif

		if (!cc && !xflag) cc = execute_phase (phase_C);
		if (!cc && !xflag) cc = execute_phase (phase_M);

# ifdef CALL_ERROR

		perror (fner, fncs);

# endif

# ifndef CALL_ERROR

		execute_phase (phase_E);

# endif

		if (!kflag)
			{delete (fnto);
			delete (fner);
			delete (fnno);
			delete (fnma);
			delete (fnhm);
			delete (fnst);
			}

		if (sflag) execute_phase (phase_S);

		if (!kflag)
			{delete (fncs);
			delete (fnsy);
			delete (fnty);
			}

		write_statistics (source, &start_time);

		if (!cc && !xflag && !cflag &&
		    (target==pdp10 || target==new10))
			{cc = perform_assembly (obj_name, rel_name);
			if (!gflag && !cc) delete (obj_name);
			}
		}
	}

/**********************************************************************

	PROCESS_OPTIONS - Process options in command arguments
		and remove options from argument list.

**********************************************************************/

int process_options (argc, argv)
	char *argv[];

	{char *s, **ss, **dd;
	int n, opt;

	kflag = cflag = gflag = xflag = bflag = sflag = FALSE;

	dd = ss = argv;
	n = 0;
	while (--argc >= 0)
		{s = *ss++;
		if (s[0] == '-') process_minus_option (s+1);
		else if ((opt = s[0]) && s[1] == '=')
			process_equal_option (opt, s+2);
		else
			{*dd++ = s;
			++n;
			}
		}
	return (n);
	}

/**********************************************************************

	PROCESS_MINUS_OPTION

**********************************************************************/

process_minus_option (s)
	char *s;

	{int c;

	while (c = *s)
		{*s++ = c = lower (c);
		switch (c) {
	case 'k':	kflag = TRUE; break;
	case 'c':	cflag = TRUE; break;
	case 'g':	gflag = TRUE; break;
	case 's':	sflag = TRUE; break;
	case 'x':	xflag = TRUE; break;
	case 'b':	bflag = TRUE;
			argv_C[5] = "10000";
			break;
	default:	cprint ("Unrecognized option: -%c\n", c);
			break;
			}
		}
	}

/**********************************************************************

	PROCESS_EQUAL_OPTION

**********************************************************************/

process_equal_option (opt, s)
	char *s;

	{char *r;
	int c;

	switch (opt = lower (opt)) {
	case 'd':	r = idebug;
			while (c = *s++) *r++ = lower (c);
			*r = 0;
			return;
	case 'n':
	case 'o':
	case 't':	while (c = *s++) set_phase_option (c, opt);
			return;

	case 'm':	set_target (s);
			return;

	default:	cprint ("Unrecognized option: %c=%s\n", opt, s);
			}
	}

/**********************************************************************

	CONSTRUCT_OUTPUT_FILE_NAMES

	Construct assembler, relocatable, and symbol table listing
	file names from source file name.  For the ITS version, 
	output file names are formed by changing the FNAME2 and
	setting the DEVICE to DSK.

**********************************************************************/

construct_output_file_names (source, obj_name, rel_name, sym_name)
	char *source, *obj_name, *rel_name;

	{filespec f;

	fparse (source, &f);
	f.dev = csto6 ("DSK");
	f.fn2 = csto6 (target_obj[target]);
	prfile (&f, obj_name);
	if (target==new10) f.fn2 = csto6 ("NSTK");
	else f.fn2 = csto6 ("STK");
	prfile (&f, rel_name);
	f.fn2 = csto6 ("SYMTAB");
	prfile (&f, sym_name);
	}

/**********************************************************************

	EXECUTE PHASE

**********************************************************************/

execute_phase (n)	int n;

	{extern	int exctime, exccode;
	int	t;

	set_program_name (n);
	t = etime ();
	if (execv (phase_prog[n], phase_argc[n], phase_argv[n]))
		{cprint ("Unable to execute phase %s\n", phase_name[n]);
		return (-1);
		}
	phase_et[n] = etime () - t;
	phase_pt[n] = exctime;
	return (exccode);
	}

/**********************************************************************

	SET_PHASE_OPTION

	Set phase option for phase PC to be OC.

**********************************************************************/

set_phase_option (pc, oc)

	{int n;

	pc = lower (pc);
	switch (pc) {

# ifdef MERGE_LP

		case 'l':
		case 'p':	n = phase_LP; break;

# endif

# ifndef MERGE_LP

		case 'l':	n = phase_L; break;
		case 'p':	n = phase_P; break;

# endif

		case 'c':	n = phase_C; break;
		case 'm':	n = phase_M; break;
		case 'e':	n = phase_E; break;
		case 's':	n = phase_S; break;
		default:	cprint ("Unrecognized Phase Designation: %c\n", pc);
				return;
		}
	phase_option[n] = lower (oc);
	}

/**********************************************************************

	SET_PROGRAM_NAME

	Construct the file name of program for the given phase.

**********************************************************************/

set_program_name (n)	int n;

	{char *r, *s, *t;

	switch (phase_option[n]) {
		case 'o':	r = old_prefix; s = old_suffix;
				break;
		case 't':	r = test_prefix; s = test_suffix;
				break;
		default:	cprint ("Unrecognized Phase Option: %c\n",
					phase_option[n]);
		case 'n':	r = normal_prefix; s = normal_suffix;
				break;
		}
	t = target_suffix[target];
	if (n == phase_E || n == phase_S) t = "";
	sconcat (phase_prog[n], 4, r, phase_name[n], t, s);
	}

/**********************************************************************

	SET_TARGET - Set Target Machine

**********************************************************************/

set_target (s)
	char *s;

	{int c, i;
	char *p;

	p = s;
	while (c = *p) *p++ = lower (c);
	for (i=0; i<n_target; ++i)
		{if (stcmp (s, target_name[i]))
			{target = i;
			return;
			}
		}
	cprint ("Unrecognized target machine: %s\n", s);
	}

/**********************************************************************

	WRITE_STATISTICS

**********************************************************************/

write_statistics (source, st)
	char *source;
	cal *st;

	{int f, flag, i;
	char temp[10];
	filespec fs;

	fparse (source, &fs);
	if (fs.dir == 0) fs.dir = rsname ();
	flag = TRUE;
	f = copen ("/dsk/c/c.stat", 'a');
	if (f == OPENLOSS) f = copen ("/dsk/common/c.stat", 'a');
	if (f == OPENLOSS) return;
	cputc ('\n', f);
	c6tos (runame (), temp);
	cprint (f, "%s - ", temp);
	prcal (st, f);
	c6tos (fs.dir, temp);
	slower (temp);
	cprint (f, " - %s", temp);
	c6tos (fs.fn1, temp);
	slower (temp);
	cprint (f, "/%s", temp);

# define hackery if (flag) {cprint (f, " ("); flag=FALSE;} else cputc (' ', f)

	if (cflag || gflag || kflag || xflag || bflag || sflag)
		{hackery;
		if (cflag) cputc ('c', f);
		if (gflag) cputc ('g', f);
		if (kflag) cputc ('k', f);
		if (xflag) cputc ('x', f);
		if (bflag) cputc ('b', f);
		if (sflag) cputc ('s', f);
		}

	if (*idebug)
		{hackery;
		cprint (f, "d=%s", idebug);
		}
	if (target)
		{hackery;
		cprint (f, "m=%s", target_name[target]);
		}
	if (!flag) cputc (')', f);

	cprint (f, "\n\n");
	for (i=0;i<nphase;++i) print_phase_time (i, f);
	cclose (f);
	}

/**********************************************************************

	PRINT_PHASE_TIME - As Part Of Statistics

**********************************************************************/

print_phase_time (n, f)

	{if (phase_pt[n] != -1)
		{cprint (f, phase_name[n]);
		if (!phase_name[n][1]) cputc (' ', f);
		cprint (f, " P=");
		pr60th (phase_pt[n], f);
		cprint (f, " E=");
		pr60th (phase_et[n], f);
		cputc ('\n', f);
		}
	}

/**********************************************************************

	PERFORM_ASSEMBLY - Create the relocatable file
	from the assembler file

	return TRUE iff an error occurred

**********************************************************************/

int perform_assembly (obj_name, rel_name)
	char *obj_name, *rel_name;

	{char *s, temp[100];
	int f;

	/* construct Assembler command line */

	s = stcpy (rel_name, temp);
	s = stcpy (" _ ", s);
	s = stcpy (obj_name, s);
	s = stcpy (" (w)", s);

	/* execute Assembler */

	if (execs ("/dsk/c/ts.midas", temp))
		{cprint ("Unable to Assemble.\n");
		return (TRUE);
		}

	/* construct Assembler record file name */

	s = stcpy (rel_name, temp);
	s = stcpy ("ERR", s-(target==pdp10 ? 3 : 4));

	/* examine Assembler record file */

	f = copen (temp, 'r');
	if (f != OPENLOSS)	/* look for '-' <digit>+ '\t' */
		{register int c;
		while ((c = cgetc (f)) > 0)
			{if (c == '-')
				{c = cgetc (f);
				if (!digit (c)) continue;
				while (digit (c)) c = cgetc (f);
				if (c != '\t') continue;
				cprint ("Assembler Errors.\n");
				cclose (f);
				return (TRUE);
				}
			}
		cclose (f);
		delete (temp);
		}
	return (FALSE);
	}

int digit (c)
	{return (c>='0' && c<='9');}

/**********************************************************************

	SCONCAT - String Concatenate

	concatenate strings S1 ... Sn into buffer B
	return B

**********************************************************************/

char *sconcat (b, n, s1, s2, s3, s4, s5, s6, s7, s8)
	char *b, *s1, *s2, *s3, *s4, *s5, *s6, *s7, *s8;

	{char **s, *p, *q;
	int c;

	q = b;
	s = &s1;

	while (--n >= 0)
		{p = *s++;
		while (c = *p++) *q++ = c;
		}

	*q = 0;
	return (b);
	}

/**********************************************************************

	SLOWER - Convert String To Lower Case

**********************************************************************/

slower (s) char *s;

	{int c;
	while (c = *s) *s++ = lower (c);
	}
�  !          # include "c.defs"

# define MERGE_LP 1
# define CALL_ERROR 1

/*

	C Compiler Command Routine
	Host machine: PDP-10 ITS


	Compiler Options

	-c	compile only
	-g	do not delete MIDAS file
	-k	do not delete intermediate files
	-s	produce symbol table listing
	-x	syntax check or symbol table listing only
	-b	for compiling big functions

	m=xxx	compile code for machine xxx

	t=abc	run TEST versions of phases a, b, c
	o=abc	run OLD versions of phases a, b, c
	n=abc	run NORMAL versions of phases a, b, c
	d=xxx	set compiler debugging argument to xxx

	Meaningful debugging arguments:

	a	debug code generator
	d	debug parser
	e	debug parser error recovery
	m	debug macro expander


*/

/*     renamings to allow long names     */

# define construct_output_file_names cnsofn
# define execute_phase execph
# define set_program_name setpn
# define set_target settrg
# define write_statistics wrstat
# define print_phase_time prphtm
# define perform_assembly perasm
# define process_options proopt
# define process_minus_option promin
# define process_equal_option proeq

# define phase_name phsnm
# define phase_prog phspr
# define phase_argc phsac
# define phase_argv phsav
# define phase_option phsop
# define phase_et phset
# define phase_pt phspt

# define argv_L avl
# define argv_LP avlp
# define argv_P avp
# define argv_C avc
# define argv_M avm
# define argv_E ave
# define argv_S avs

# define target_name tarnam
# define target_suffix tarsfx
# define target_LP_data tarlpd
# define target_obj tarobj

/*     intermediate file names     */

# define fncs "0.cs"
# define fner "0.er"
# define fnhm "0.hm"
# define fnma "0.ma"
# define fnno "0.no"
# define fnst "0.st"
# define fnsy "0.sy"
# define fnto "0.to"
# define fnty "0.ty"

/*     program file names     */

# ifdef AI
#   define normal_prefix "/dsk/clib/_"
#   define old_prefix "/dsk/clib/_"
#   define test_prefix "/dsk/clib/_"
#endif

# ifndef normal_prefix
#   define normal_prefix "/dsk/c/_"
#   define old_prefix "/dsk/c/_"
#   define test_prefix "/dsk/c/_"
# endif

# define normal_suffix ".bin"
# define old_suffix ".obin"
# define test_suffix ".tbin"

# define pdp10_suffix ""
# define pdp11_suffix "11"
# define his6000_suffix "60"
# define ibm360_suffix "360"
# define cmac_suffix "-CM"
# define unix_suffix "-UX"
# define new10_suffix "-10"

# define file_name_size 30

/*	options     */

char	debug[40];
char	idebug[40];
int	kflag, cflag, gflag, xflag, bflag, sflag;

/*     phase information     */

# define nphase 7

# define phase_L 0
# define phase_LP 1
# define phase_P 2
# define phase_C 3
# define phase_M 4
# define phase_E 5
# define phase_S 6

# define ARGC_LP 10	/* arg counts without optional args */
# define ARGC_P 8
# define ARGC_C 6

char	*argv_L[]	{debug, 0, fnto, fncs, fner, fnst};
char	*argv_LP[]	{debug, 0, fnno, fnty, fner, fnma, fncs, fnst, fnhm, fnsy, 0};
char	*argv_P[]	{debug, fnto, fnno, fnty, fner, fnma, fnhm, fnsy, 0};
char	*argv_C[]	{debug, fner, fnno, fnty, fnma, "3000"};
char	*argv_M[]	{debug, 0, fncs, fner, fnma, fnst, fnhm};
char	*argv_E[]	{debug, fner, fncs};
char	*argv_S[]	{fncs, fnty, fnsy, 0};

char	*phase_name[]	{"L", "LP", "P", "C", "M", "E", "S"};
char	phase_prog[nphase][file_name_size];
char	*phase_argc[]	{6, ARGC_LP, ARGC_P, ARGC_C, 7, 3, 4};
char	**phase_argv[]	{argv_L, argv_LP, argv_P, argv_C, argv_M,
			argv_E, argv_S};
int	phase_option[]	{'n', 'n', 'n', 'n', 'n', 'n', 'n'};
int	phase_et[]	{0, 0, 0, 0, 0, 0, 0};
int	phase_pt[]	{0, 0, 0, 0, 0, 0, 0};

/*     target machine information     */

# define n_target 7

# define pdp10 0
# define pdp11 1
# define his6000 2
# define ibm360 3
# define cmac 4
# define unix 5
# define new10 6

int	target	pdp11;

char	*target_name[] {
	"pdp10",
	"pdp11",
	"his6000",
	"ibm360",
	"cmac",
	"unix",
	"new10"
	};

char	*target_suffix[] {
	pdp10_suffix,
	pdp11_suffix,
	his6000_suffix,
	ibm360_suffix,
	cmac_suffix,
	unix_suffix,
	new10_suffix
	};

char	*target_LP_data[] {
	"",
	"",
	"",
	"",
	"",
	"",
	""
	};

char	*target_obj[] {
	"MIDAS",
	"PALX",
	"GMAP",
	"BAL",
	"CMAC",
	"UNIX",
	"NMIDAS"
	};

/**********************************************************************

	DESCRIPTION OF EXTERNALLY DEFINED ROUTINES

	part of C compiler:

		perror - error message processor

	standard C library:

		copen - open file for input/output
		cprint - formatted output
		cputc - output character
		cclose - close file
		istty - is file a terminal?

	reasonably machine-independent:

		stcpy - copy string
		stcmp - compare strings
		lower - convert char to lower case
		execv - execute program passing vector of args
		delete - delete file
		now - get current date and time
		prcal - print date and time
		pr60th - print time given in 1/60 second units

	grossly ITS dependent:

		fopen - open file
		fillen - determine file length
		close - close file
		fparse - parse file name
		prfile - convert file specification to string
		runame - return user name
		etime - return an elapsed time
		c6tos - convert sixbit to ASCII string
		csto6 - convert ASCII to sixbit string
		execs - execute program passing string command line

*/

char *sconcat();

/**********************************************************************

	THE MAIN PROGRAM

**********************************************************************/

main (argc, argv)	int argc; char *argv[];

	{extern int cout;
	int snum, cc, f, i, ttyflag;
	cal start_time;
	char *s, *source, *fargv[50], buffer[2000];
	char obj_name[file_name_size],
		rel_name[file_name_size],
		sym_name[file_name_size];

	--argc;
	++argv;
	argc = process_options (argc, argv);
	argc = exparg (argc, argv, fargv, buffer);
	argv = fargv;

# ifdef MERGE_LP

	s = target_LP_data[target];
	if (*s)
		{phase_argc[phase_LP] = ARGC_LP+1;
		argv_LP[ARGC_LP] = s;
		}
	else phase_argc[phase_LP] = ARGC_LP;

# endif

# ifndef MERGE_LP

	s = target_LP_data[target];
	if (*s)
		{phase_argc[phase_P] = ARGC_P+1;
		argv_P[ARGC_P] = s;
		}
	else phase_argc[phase_P] = ARGC_P;

# endif
	ttyflag = istty (cout);

	for (snum = 0; snum < argc; ++snum)
		{source = argv[snum];

	/*	check that source file exists		*/

		if ((f = copen (source, 'r')) == OPENLOSS)
			{cprint ("Can't Find '%s'.\n", source);
			continue;
			}
		cclose (f);

		if (!ttyflag || argc>1) cprint ("%s:\n", source);
		now (&start_time);

	/*	fix debug arg	*/

		if (sflag) sconcat (debug, 2, idebug, "s");
		else if (xflag) sconcat (debug, 2, idebug, "x");
		else stcpy (idebug, debug);

	/*	construct output file names from source file name	*/

		construct_output_file_names (source, obj_name,
			rel_name, sym_name);

		cclose (copen (fner, 'w', "b"));

		for (i=0;i<nphase;++i) phase_pt[i] = -1;
		argv_M[1] = obj_name;
		argv_S[3] = sym_name;

# ifdef MERGE_LP

		argv_LP[1] = source;
		cc = execute_phase (phase_LP);

# endif

# ifndef MERGE_LP

		argv_L[1] = source;
		cc = execute_phase (phase_L);
		if (!cc) cc = execute_phase (phase_P);

# endif

		if (!cc && !xflag) cc = execute_phase (phase_C);
		if (!cc && !xflag) cc = execute_phase (phase_M);

# ifdef CALL_ERROR

		perror (fner, fncs);

# endif

# ifndef CALL_ERROR

		execute_phase (phase_E);

# endif

		if (!kflag)
			{delete (fnto);
			delete (fner);
			delete (fnno);
			delete (fnma);
			delete (fnhm);
			delete (fnst);
			}

		if (sflag) execute_phase (phase_S);

		if (!kflag)
			{delete (fncs);
			delete (fnsy);
			delete (fnty);
			}

		write_statistics (source, &start_time);

		if (!cc && !xflag && !cflag &&
		    (target==pdp10 || target==new10))
			{cc = perform_assembly (obj_name, rel_name);
			if (!gflag && !cc) delete (obj_name);
			}
		}
	}

/**********************************************************************

	PROCESS_OPTIONS - Process options in command arguments
		and remove options from argument list.

**********************************************************************/

int process_options (argc, argv)
	char *argv[];

	{char *s, **ss, **dd;
	int n, opt;

	kflag = cflag = gflag = xflag = bflag = sflag = FALSE;

	dd = ss = argv;
	n = 0;
	while (--argc >= 0)
		{s = *ss++;
		if (s[0] == '-') process_minus_option (s+1);
		else if ((opt = s[0]) && s[1] == '=')
			process_equal_option (opt, s+2);
		else
			{*dd++ = s;
			++n;
			}
		}
	return (n);
	}

/**********************************************************************

	PROCESS_MINUS_OPTION

**********************************************************************/

process_minus_option (s)
	char *s;

	{int c;

	while (c = *s)
		{*s++ = c = lower (c);
		switch (c) {
	case 'k':	kflag = TRUE; break;
	case 'c':	cflag = TRUE; break;
	case 'g':	gflag = TRUE; break;
	case 's':	sflag = TRUE; break;
	case 'x':	xflag = TRUE; break;
	case 'b':	bflag = TRUE;
			argv_C[5] = "10000";
			break;
	default:	cprint ("Unrecognized option: -%c\n", c);
			break;
			}
		}
	}

/**********************************************************************

	PROCESS_EQUAL_OPTION

**********************************************************************/

process_equal_option (opt, s)
	char *s;

	{char *r;
	int c;

	switch (opt = lower (opt)) {
	case 'd':	r = idebug;
			while (c = *s++) *r++ = lower (c);
			*r = 0;
			return;
	case 'n':
	case 'o':
	case 't':	while (c = *s++) set_phase_option (c, opt);
			return;

	case 'm':	set_target (s);
			return;

	default:	cprint ("Unrecognized option: %c=%s\n", opt, s);
			}
	}

/**********************************************************************

	CONSTRUCT_OUTPUT_FILE_NAMES

	Construct assembler, relocatable, and symbol table listing
	file names from source file name.  For the ITS version, 
	output file names are formed by changing the FNAME2 and
	setting the DEVICE to DSK.

**********************************************************************/

construct_output_file_names (source, obj_name, rel_name, sym_name)
	char *source, *obj_name, *rel_name;

	{filespec f;

	fparse (source, &f);
	f.dev = csto6 ("DSK");
	f.fn2 = csto6 (target_obj[target]);
	prfile (&f, obj_name);
	if (target==new10) f.fn2 = csto6 ("NSTK");
	else f.fn2 = csto6 ("STK");
	prfile (&f, rel_name);
	f.fn2 = csto6 ("SYMTAB");
	prfile (&f, sym_name);
	}

/**********************************************************************

	EXECUTE PHASE

**********************************************************************/

execute_phase (n)	int n;

	{extern	int exctime, exccode;
	int	t;

	set_program_name (n);
	t = etime ();
	if (execv (phase_prog[n], phase_argc[n], phase_argv[n]))
		{cprint ("Unable to execute phase %s\n", phase_name[n]);
		return (-1);
		}
	phase_et[n] = etime () - t;
	phase_pt[n] = exctime;
	return (exccode);
	}

/**********************************************************************

	SET_PHASE_OPTION

	Set phase option for phase PC to be OC.

**********************************************************************/

set_phase_option (pc, oc)

	{int n;

	pc = lower (pc);
	switch (pc) {

# ifdef MERGE_LP

		case 'l':
		case 'p':	n = phase_LP; break;

# endif

# ifndef MERGE_LP

		case 'l':	n = phase_L; break;
		case 'p':	n = phase_P; break;

# endif

		case 'c':	n = phase_C; break;
		case 'm':	n = phase_M; break;
		case 'e':	n = phase_E; break;
		case 's':	n = phase_S; break;
		default:	cprint ("Unrecognized Phase Designation: %c\n", pc);
				return;
		}
	phase_option[n] = lower (oc);
	}

/**********************************************************************

	SET_PROGRAM_NAME

	Construct the file name of program for the given phase.

**********************************************************************/

set_program_name (n)	int n;

	{char *r, *s, *t;

	switch (phase_option[n]) {
		case 'o':	r = old_prefix; s = old_suffix;
				break;
		case 't':	r = test_prefix; s = test_suffix;
				break;
		default:	cprint ("Unrecognized Phase Option: %c\n",
					phase_option[n]);
		case 'n':	r = normal_prefix; s = normal_suffix;
				break;
		}
	t = target_suffix[target];
	if (n == phase_E || n == phase_S) t = "";
	sconcat (phase_prog[n], 4, r, phase_name[n], t, s);
	}

/**********************************************************************

	SET_TARGET - Set Target Machine

**********************************************************************/

set_target (s)
	char *s;

	{int c, i;
	char *p;

	p = s;
	while (c = *p) *p++ = lower (c);
	for (i=0; i<n_target; ++i)
		{if (stcmp (s, target_name[i]))
			{target = i;
			return;
			}
		}
	cprint ("Unrecognized target machine: %s\n", s);
	}

/**********************************************************************

	WRITE_STATISTICS

**********************************************************************/

write_statistics (source, st)
	char *source;
	cal *st;

	{int f, flag, i;
	char temp[10];
	filespec fs;

	fparse (source, &fs);
	if (fs.dir == 0) fs.dir = rsname ();
	flag = TRUE;
	f = copen ("/dsk/clib/c.stat", 'a');
	if (f == OPENLOSS) f = copen ("/dsk/common/c.stat", 'a');
	if (f == OPENLOSS) return;
	cputc ('\n', f);
	c6tos (runame (), temp);
	cprint (f, "%s - ", temp);
	prcal (st, f);
	c6tos (fs.dir, temp);
	slower (temp);
	cprint (f, " - %s", temp);
	c6tos (fs.fn1, temp);
	slower (temp);
	cprint (f, "/%s", temp);

# define hackery if (flag) {cprint (f, " ("); flag=FALSE;} else cputc (' ', f)

	if (cflag || gflag || kflag || xflag || bflag || sflag)
		{hackery;
		if (cflag) cputc ('c', f);
		if (gflag) cputc ('g', f);
		if (kflag) cputc ('k', f);
		if (xflag) cputc ('x', f);
		if (bflag) cputc ('b', f);
		if (sflag) cputc ('s', f);
		}

	if (*idebug)
		{hackery;
		cprint (f, "d=%s", idebug);
		}
	if (target)
		{hackery;
		cprint (f, "m=%s", target_name[target]);
		}
	if (!flag) cputc (')', f);

	cprint (f, "\n\n");
	for (i=0;i<nphase;++i) print_phase_time (i, f);
	cclose (f);
	}

/**********************************************************************

	PRINT_PHASE_TIME - As Part Of Statistics

**********************************************************************/

print_phase_time (n, f)

	{if (phase_pt[n] != -1)
		{cprint (f, phase_name[n]);
		if (!phase_name[n][1]) cputc (' ', f);
		cprint (f, " P=");
		pr60th (phase_pt[n], f);
		cprint (f, " E=");
		pr60th (phase_et[n], f);
		cputc ('\n', f);
		}
	}

/**********************************************************************

	PERFORM_ASSEMBLY - Create the relocatable file
	from the assembler file

	return TRUE iff an error occurred

**********************************************************************/

int perform_assembly (obj_name, rel_name)
	char *obj_name, *rel_name;

	{char *s, temp[100];
	int f;

	/* construct Assembler command line */

	s = stcpy (rel_name, temp);
	s = stcpy (" _ ", s);
	s = stcpy (obj_name, s);
	s = stcpy (" (w)", s);

	/* execute Assembler */

	if (execs ("/dsk/clib/ts.midas", temp))
		{cprint ("Unable to Assemble.\n");
		return (TRUE);
		}

	/* construct Assembler record file name */

	s = stcpy (rel_name, temp);
	s = stcpy ("ERR", s-(target==pdp10 ? 3 : 4));

	/* examine Assembler record file */

	f = copen (temp, 'r');
	if (f != OPENLOSS)	/* look for '-' <digit>+ '\t' */
		{register int c;
		while ((c = cgetc (f)) > 0)
			{if (c == '-')
				{c = cgetc (f);
				if (!digit (c)) continue;
				while (digit (c)) c = cgetc (f);
				if (c != '\t') continue;
				cprint ("Assembler Errors.\n");
				cclose (f);
				return (TRUE);
				}
			}
		cclose (f);
		delete (temp);
		}
	return (FALSE);
	}

int digit (c)
	{return (c>='0' && c<='9');}

/**********************************************************************

	SCONCAT - String Concatenate

	concatenate strings S1 ... Sn into buffer B
	return B

**********************************************************************/

char *sconcat (b, n, s1, s2, s3, s4, s5, s6, s7, s8)
	char *b, *s1, *s2, *s3, *s4, *s5, *s6, *s7, *s8;

	{char **s, *p, *q;
	int c;

	q = b;
	s = &s1;

	while (--n >= 0)
		{p = *s++;
		while (c = *p++) *q++ = c;
		}

	*q = 0;
	return (b);
	}

/**********************************************************************

	SLOWER - Convert String To Lower Case

**********************************************************************/

slower (s) char *s;

	{int c;
	while (c = *s) *s++ = lower (c);
	}
