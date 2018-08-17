package controllers;

import dao.StatesDao;
import db.ConexaoBD;
import java.sql.ResultSet;
import java.sql.Statement;
import models.Cusco;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
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
         
        StatesDao dao = new StatesDao(new ArrayList<State>());

        req.setAttribute("states", dao.getStates());
        req.setAttribute("content", "states-list.jsp");
        req.setAttribute("title", "Estados");
        System.out.println("Executando a logica e redirecionando...");
        return "layout.jsp";
    }
}
