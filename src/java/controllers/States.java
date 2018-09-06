package controllers;

import dao.StatesDao;
import java.util.ArrayList;
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
        req.setAttribute("states", dao.getStates(null));
        req.setAttribute("content", "states-list.jsp");
        req.setAttribute("savePage", "StateForm");
        req.setAttribute("title", "Estados");
        System.out.println("Executando a logica e redirecionando...");
        return "layout.jsp";
    }
  
}
