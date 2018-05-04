import java_cup.runtime.*;
import syntaxtree.*;

%%

%cup
%public
%class MiniJavaLexer
%line
%column
%unicode

%{

  private Symbol symbol(int type, Object value) {
        return new Symbol(type,yyline,yycolumn ,value);
  }

  private Symbol symbol(int type) {
        return new Symbol(type,yyline,yycolumn);
  }
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]
Identifier = [:jletter:] [:jletterdigit:]*

IntegerLiteral = 0 | [1-9][0-9]*

Comment =   "//" {InputCharacter}* {LineTerminator}?

openBrace	= \{
closeBrace	= \}

openParen	= \(
closeParen	= \)

openBracket	= \[
closeBracket	= \]

comma	= \,
period	= \.
not =	\!

%%

	<YYINITIAL> {
		/* keywords */
		
		"public"				{return symbol(sym.PUBLIC, yytext());}
		"static"				{return symbol(sym.STATIC, yytext());}
		"void"					{return symbol(sym.VOID, yytext());}
		"main"					{return symbol(sym.MAIN, yytext());}
		"String"				{return symbol(sym.STRING, yytext());}
		"class"					{return symbol(sym.CLASS, yytext());}
		"extends"				{return symbol(sym.EXTENDS, yytext());}
		";"						{return symbol(sym.SEMICOLON, yytext());}
		"int"					{return symbol(sym.INT, yytext());}
		"boolean"				{return symbol(sym.BOOLEAN, yytext());}
		"if"					{return symbol(sym.IF, yytext());}
		"while"					{return symbol(sym.WHILE, yytext());}
		"else"					{return symbol(sym.ELSE, yytext());}
		"System.out.println"	{return symbol(sym.PRINT, yytext());}
		"true"					{return symbol(sym.TRUE, yytext());}
		"false"					{return symbol(sym.FALSE, yytext());}
		"length"				{return symbol(sym.LENGTH, yytext());}
		"this"					{return symbol(sym.THIS, yytext());}
		"new"					{return symbol(sym.NEW, yytext());}
		"return"				{return symbol(sym.RETURN, yytext());}
		{IntegerLiteral}		{return symbol(sym.INTEGERLITERAL, Integer.parseInt(yytext()));}
		
		/* operators */
		
		"="						{return symbol(sym.EQUALS, yytext());}
		"+"						{return symbol(sym.PLUS, yytext());}
		"-"						{return symbol(sym.MINUS, yytext());}
		"*"						{return symbol(sym.TIMES, yytext());}
		"<"						{return symbol(sym.LESSTHAN, yytext());}
		"&&"					{return symbol(sym.AND, yytext());}
		{period}				{return symbol(sym.DOT, ".");}
		{not}					{return symbol(sym.NOT, "!");}
		{comma}					{return symbol(sym.COMMA, ",");}
		
		/* grouping symbols */
		
		{closeBrace}			{return symbol(sym.CLOSEBRACE, yytext());}
		{openBrace}				{return symbol(sym.OPENBRACE, yytext());}
		{closeParen}			{return symbol(sym.CLOSEPAREN, ")");}
		{openParen}				{return symbol(sym.OPENPAREN, "(");}
		{closeBracket}			{return symbol(sym.CLOSEBRACKET, "]");}
		{openBracket}			{return symbol(sym.OPENBRACKET, "[");}
		
		/* identifier needs to be last so the other words aren't caught by this rule */
		
		{Identifier}			{return symbol(sym.IDENTIFIER, new Identifier(yytext()));}
		
		/* comments and white space */
		
		{Comment}				{/* Ignore */}
		{WhiteSpace}			{/* Ignore */}
		
		/* error */
		
		
	}
