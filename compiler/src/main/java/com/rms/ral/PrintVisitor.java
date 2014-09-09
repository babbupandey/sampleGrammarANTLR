package com.rms.ral;

import org.antlr.v4.runtime.misc.NotNull;

import java.util.List;

public class PrintVisitor extends RALBaseVisitor<Void> {

    @Override
    public Void visitCreate_entity(@NotNull RALParser.Create_entityContext ctx) {
        String out = String.format("Create Setting with name: %s, with following details:", ctx.VARIABLE_NAME());
        System.out.println(out);
        visitJson(ctx.json());
        return null;
    }

    @Override
    public Void visitJson(@NotNull RALParser.JsonContext ctx) {

        if(ctx.object() != null) {
            for(RALParser.MembersContext membersContext: ctx.object().members()) {
                visitMembers(membersContext);
            }
        } else if(ctx.array() != null) {
            for(RALParser.ElementsContext elementsContext: ctx.array().elements()) {
                visitElements(elementsContext);
            }
        }

        return null;
    }

    @Override
    public Void visitMembers(RALParser.MembersContext membersContexts) {
        visitPair(membersContexts.pair());
        if(membersContexts.members()!=null) {
            for(RALParser.MembersContext member: membersContexts.members()) {
                visitMembers(member);
            }
        }
        return null;
    }

    @Override
    public Void visitElements(RALParser.ElementsContext elementsContexts) {
        visitValue(elementsContexts.value());
        if(elementsContexts.elements() != null) {
            for(RALParser.ElementsContext element: elementsContexts.elements()) {
                visitElements(element);
            }
        }
        return null;
    }

    @Override
    public Void visitPair(RALParser.PairContext pairContext) {
        System.out.print("Key: " + pairContext.STRING() + " ");
        visitValue(pairContext.value());
        return null;
    }

    @Override
    public Void visitValue(RALParser.ValueContext valueContext) {
        if(valueContext.FALSE() != null) {
            System.out.println("Value: " + valueContext.FALSE());
        } else if(valueContext.TRUE() != null) {
            System.out.println("Value: " + valueContext.TRUE());
        } else if(valueContext.NULL() != null) {
            System.out.println("Value: " + valueContext.NULL());
        } else if(valueContext.STRING() != null) {
            System.out.println("Value: " + valueContext.STRING());
        } else if(valueContext.NUMBER() != null) {
            System.out.println("Value: " + valueContext.NUMBER());
        } else if(valueContext.json() != null) {
            visitJson(valueContext.json());
        }
        return null;
    }
}
