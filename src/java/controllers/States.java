package controllers;

import db.ConexaoBD;
import java.sql.ResultSet;
import java.sql.Statement;
import models.Cusco;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.State;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
public class States implements Logic {

    public String executa(HttpServletRequest req,
            HttpServletResponse res)
            throws Exception {
        List<State> states = new ArrayList<State>();
        
//        Statement st = ConexaoBD.con.createStatement();
        
        
//        ResultSet rs =  st.executeQuery("Select * from states;");
        State state = new State();
        state.setId("RS");
        state.setName("Rio Grande Do Sul");
        states.add(state);

        req.setAttribute("states", states);
        System.out.println("Executando a logica e redirecionando...");
        return "list.jsp";
    }
}
