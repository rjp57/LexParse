# MiniJava Lexical Analyzer and Parser 

This repo contains a lexer and parser that perform syntactical analysis on a subset of Java called "MiniJava".

They will determine whether a given text file is syntactically valid MiniJava. The given driver also "pretty prints" the program to the console if it is valid.

This is done in Java using the tools JFlex and JavaCUP to generate the lexer and parser respectively.

The "syntaxtree" and "visitor" packages are provided by the textbook "Andrew W. Appel and Jens Palsberg. Modern Compiler Implementation in Java, 2nd edition. Cambridge University Press, October 2002."

## Setup
How to run the project: 

java -jar java-cup-11a.jar -parser MiniJavaParser parser.cup (This will build the Parser)

javac -cp java-cup-11a.jar;. PrettyPrinter.java (This will compile everything)

java -cp java-cup-11a.jar;. PrettyPrinter example.txt (This will run the program on a given text file)


I have included the Java file created by jflex, but if you want to run jflex just use it on lexer.flex

