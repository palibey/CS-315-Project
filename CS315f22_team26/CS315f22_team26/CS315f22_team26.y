/* JAVA-- */

%token INTEGER
%token FLOAT
%token CHAR
%token COMMA LP RP DOT ASSIGNMENT_OP COMMENT NEWLINE
%token IF FOR WHILE DO ELSE
%token EQUALITY_OP NOT_EQ_OP LESS_THAN GREATER_THAN LESS_EQ GREATER_EQ
%token LEFT_BRACE RIGHT_BRACE PLUS MINUS STAR DIVISION NOT SEMICOLON SENSOR
%token FUNCTION_START SEND RECEIVE READ PRIVATE PROTECTED PUBLIC TEMPERATURE
%token HUMIDITY AIR_PRESSURE AIR_QUALITY LIGHT SOUND_LEVEL PROXIMITY GPS RADIO TIMER
%token SWITCH_1 SWITCH_2 SWITCH_3 SWITCH_4 SWITCH_5 SWITCH_6 SWITCH_7 SWITCH_8 SWITCH_9 SWITCH_10
%token URL VARIABLE_ID CHAR STRING RETURN AND OR TRUE FALSE CONNECTION MODULO INT FLO STR CH THEN
%%

start:   stmt_list {return 0; }


var_id: VARIABLE_ID

stmt: unmatched {printf("%s", " Valid Input ");}
| matched {printf("%s", " Valid Input ");}
| function_declaration {printf("%s", " Valid Input ");}
| error



unmatched: IF LP expr RP LEFT_BRACE stmt_list RIGHT_BRACE
| IF LP expr RP THEN LEFT_BRACE matched_list RIGHT_BRACE ELSE LEFT_BRACE unmatched_list RIGHT_BRACE


matched: IF LP expr RP THEN LEFT_BRACE matched_list RIGHT_BRACE ELSE LEFT_BRACE matched_list RIGHT_BRACE
| declaration_stmt
| assign_stmt
| for_stmt
| while_stmt
| do_while_stmt
| return_stmt
| function_call
| comment
| connection
| connection_state
| switch_state
| read

matched_list: matched
| matched matched_list


unmatched_list: unmatched
| unmatched unmatched_list


visibility: PRIVATE
| PUBLIC
| PROTECTED


arg_list: arg
| arg COMMA arg_list

arg: declaration_stmt


function_declaration: FUNCTION_START visibility type_id var_id LP arg_list RP LEFT_BRACE stmt_list RIGHT_BRACE





url_prefix: URL

switch_state: switch_list LP boolean_variable RP SEMICOLON


read: component LP var_id RP SEMICOLON


connection: send_int
| receive_int


connection_state: CONNECTION  LP url_prefix COMMA boolean_variable RP SEMICOLON


send_int: SEND LP url_prefix RP expr SEMICOLON


receive_int: RECEIVE LP url_prefix RP var_id SEMICOLON

component : sensor
| TIMER

sensor: TEMPERATURE
|HUMIDITY
|AIR_PRESSURE
|AIR_QUALITY
|LIGHT
|SOUND_LEVEL
|PROXIMITY
|GPS
|RADIO

switch_list : SWITCH_1
| SWITCH_2
| SWITCH_3
| SWITCH_4
| SWITCH_5
| SWITCH_6
| SWITCH_7
| SWITCH_8
| SWITCH_9
| SWITCH_10

function_call: var_id LP parameter RP SEMICOLON

parameter: var_id | var_id COMMA parameter

while_stmt : WHILE LP expr RP LEFT_BRACE stmt_list RIGHT_BRACE

return_stmt : RETURN expr SEMICOLON


for_stmt: FOR LP declaration_stmt expr SEMICOLON assign_stmt RP LEFT_BRACE stmt_list RIGHT_BRACE

do_while_stmt : DO LEFT_BRACE stmt_list RIGHT_BRACE WHILE LP expr RP SEMICOLON

boolean_variable: TRUE|FALSE

assign_stmt : var_id ASSIGNMENT_OP expr SEMICOLON
| var_id ASSIGNMENT_OP function_call

comment : COMMENT



expr: expr PLUS term
| expr OR term
| term

term: term STAR factor
| term MINUS factor
| term DIVISION factor
| term MODULO factor
| term AND factor
| term LESS_THAN factor
| term GREATER_THAN factor
| term EQUALITY_OP factor
| term NOT_EQ_OP factor
| term GREATER_EQ factor
| term LESS_EQ factor
| factor

factor: var_id
| int_const
| boolean_variable
| float
| string
| char

string: STRING

char: CHAR


int_const: INTEGER

float: FLOAT



stmt_list: stmt
| stmt stmt_list



type_id: INT
| FLO
| STR
| CH


declaration_stmt: type_id var_id SEMICOLON


%%
#include "lex.yy.c"
int lineno=0;
yyerror(char *s) {
                   printf("%s",s);
                   printf("%s", " at :")
                   printf("%d", lineno);
                   }
int main() {
    return yyparse();
}
