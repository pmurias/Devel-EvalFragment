#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#if 1 /* bug #74006 not yet fixed */
# define lex_stuff_fixup() \
		SvCUR_set(PL_parser->linestr, \
			PL_parser->bufend - SvPVX(PL_parser->linestr))
# define lex_stuff_sv_(sv, flags) \
		(lex_stuff_sv((sv), (flags)), lex_stuff_fixup())
# define lex_stuff_pvn_(pv, len, flags) \
		(lex_stuff_pvn((pv), (len), (flags)), lex_stuff_fixup())
# define lex_stuff_pvs_(s, flags) \
		lex_stuff_pvn_((""s""), sizeof(""s"")-1, (flags))
#endif /* bug #74006 not yet fixed */


MODULE = Devel::EvalFragment PACKAGE = Devel:EvalFragment

void
stop_the_parse()
PROTOTYPE: 
CODE:
    lex_stuff_pvs_("__END__", 0);
