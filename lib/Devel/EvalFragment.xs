#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Devel::EvalFragment PACKAGE = Devel::EvalFragment

int
stop_the_parse()
PROTOTYPE: 
CODE:
    int count = 0;
    int c;
    while ((c = lex_read_unichar(0)) != -1)
    {
        /*printf("skip %c[%c]\n",c,c);*/
        count++;
    }
    RETVAL = count;
OUTPUT:
    RETVAL
