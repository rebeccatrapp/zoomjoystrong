%{
#include <stdio.h>
#include <stdlib.h>
#include "zoomjoystrong.tab.h"
int c;
%}

%%
end			      { return YYEOF; }
;                             { return ; }
point                         { return POINT; }
line                          { return LINE; }
circle                        { return CIRCLE; }
rectangle                     { return RECT;}
set_color                     { return SETCOLOR; }
[0-9]+                        { 
				c = yytext[0];
				yylval.a = c - '0';
				return(NUMBER);
			       }
[0-9].[0-9]+                   { 
				c = yytext[0]; 
				yylval.a = c - '0.0'
				return(FLOAT);
			       }
[\s]                           {/* ignore whitespace */ }


%%

