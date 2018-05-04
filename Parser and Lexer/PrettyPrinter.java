import syntaxtree.*;
import visitor.*;
import java_cup.runtime.Symbol;
import java.io.*;
public class PrettyPrinter {
	 public static void main(String[] args) {
		 String fileName = null;
		 
		 if (args.length < 1){
			 System.out.println("Please enter a text file with a valid MiniJava program");
			 System.exit(0);
		 }
		 else{
			 fileName = args[0];
		 }
		  Program ast = null;
		 try{
		 Reader r = new FileReader(fileName);
			 
		 MiniJavaLexer lexer = new MiniJavaLexer(r);
			 
		
			 
		 MiniJavaParser parser =  new MiniJavaParser(lexer);
		 try{
			 Symbol tree = parser.parse();
			 ast = (Program) tree.value;
		 } catch (Exception e){
			 e.printStackTrace();
			 System.exit(1);
		 }
		 }catch(Exception FileNotFoundException){
			 System.out.println("File not found");
			 System.exit(0);
		 }
		 PrettyPrintVisitor printer = new PrettyPrintVisitor();
		 printer.visit(ast);
	 }
}