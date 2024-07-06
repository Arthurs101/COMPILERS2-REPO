%{
#include <cstdlib>
#include <string>
#include "y.tab.h"
%}

%%

[a-zA-Z][a-zA-Z0-9]*    { yylval.str = new std::string(yytext);  return ID; }
[0-9]+                  { yylval.num = strtol(yytext, NULL, 10); return NUMBER; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"="                     { return '='; }
":"                     { return ':'; }
[ \t]                   ;  // skip whitespace
\n                      {return '\n'; } //new lines
.                        { printf("ERROR: '%s' is not valid in this language \n",yytext) ;} 

%%

int yywrap() {
    return 1;
}