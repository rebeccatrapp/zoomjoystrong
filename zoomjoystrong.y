%{
#include "zoomjoystrong.h"
#include <stdio.h>

void yyerror(const char* msg);
%}

%union {
	double fVal;
}

%token END
%token EOS
%token POINT
%token LINE
%token CIRCLE
%token RECT
%token SETCOLOR
%token NUMBER
%token FLOAT
%type<fVal> NUMBER

%%

list: command EOS 
    |
	command EOS list
    ;

command:	
       |
       	LINE NUMBER NUMBER NUMBER NUMBER EOS
	 {
		line($2, $3, $4, $5);
	 }
	 |
	POINT NUMBER NUMBER EOS
	 {
		point($2, $3);
	 }
	 |
	CIRCLE NUMBER NUMBER NUMBER EOS
	 {
		circle($2,$3,$4);
	 }
	 |
	RECT NUMBER NUMBER NUMBER NUMBER EOS 
	 {
		rectangle($2,$3,$4,$5);
	 }
	 |
	SETCOLOR NUMBER NUMBER NUMBER EOS
	 {
		set_color($2,$3,$4);
	 }
	 ;
%%

int main(int argc, char** argv)
{
  setup();
  yyparse();
  finish();
}

yywrap()
{
  return(1);
}

void yyerror(const char* msg){
	fprintf(stderr, "%s", msg);
}
