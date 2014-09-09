package com.rms.ral;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;

public class RALVisitorTest {

    public static void main(String args[]) {

        RALLexer lexer = new RALLexer(new ANTLRInputStream(args[0]));
        RALParser parser = new RALParser(new CommonTokenStream(lexer));
        RALVisitor visitor = new PrintVisitor();
        visitor.visitCreate_entity(parser.create_entity());
    }

}
