/* JAVA-- */
name [A-Za-z_$]+
float [+-]?[0-9]*(\.)[0-9]+
int [0-9]+
char ['][A-Za-z_$]|[0-9][']
string ["][.]["]
alphanumeric ({name}|{int})
%%
\+ return(PLUS);
\- return(MINUS);
{int}.{int}.{int}.{int} return(URL);
{int} { sscanf(yytext, "%d", &yylval);
return(INTEGER);
};
\n { extern int lineno; lineno++;

}

{float} return(FLOAT);
true return(TRUE);
false return(FALSE);
then return(THEN);
\, return(COMMA);
\( return(LP);
\) return(RP);
\. return(DOT);
\= return(ASSIGNMENT_OP);
\== return(EQUALITY_OP);
\!\= return(NOT_EQ_OP);
[\#].* return(COMMENT);
if return(IF);
else return(ELSE);
for return(FOR);
while return(WHILE);
do return(DO);
int return(INT);
string return(STR);
float return(FLO);
char return(CH);
\< return(LESS_THAN);
\> return(GREATER_THAN);
\<= return(LESS_EQ);
\>= return(GREATER_EQ);
\{ return(LEFT_BRACE);
\} return(RIGHT_BRACE);
\* return(STAR);
\/ return(DIVISION);
\% return(MODULO);
\! return(NOT);
\; return(SEMICOLON);
OR return(OR);
AND return(AND);
sensor return(SENSOR);
function return(FUNCTION_START);
send return(SEND);
receive return(RECEIVE);
read return(READ);
private return(PRIVATE);
protected return(PROTECTED);
public return(PUBLIC);
return return(RETURN);
temperature return(TEMPERATURE);
humidity return(HUMIDITY);
air_pressure return(AIR_PRESSURE);
air_quality return(AIR_QUALITY);
light return(LIGHT);
sound_level return(SOUND_LEVEL);
proximity return(PROXIMITY);
gps return(GPS);
radio return(RADIO);
timer return(TIMER);
connection return(CONNECTION);
s_1 return(SWITCH_1);
s_2 return(SWITCH_2);
s_3  return(SWITCH_3);
s_4  return(SWITCH_4);
s_5  return(SWITCH_5);
s_6  return(SWITCH_6);
s_7  return(SWITCH_7);
s_8 return(SWITCH_8);
s_9  return(SWITCH_9);
s_10  return(SWITCH_10);
[a-zA-Z_][a-zA-Z0-9_]* return(VARIABLE_ID);
{char} return(CHAR);
{string} return(STRING);
[ \t]             ;
%%
int yywrap() { return 1; }

