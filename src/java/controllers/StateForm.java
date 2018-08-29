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
public class StateForm implements Logic {

    public String executa(HttpServletRequest req,
            HttpServletResponse res)
            throws Exception {
        System.out.println(req.getParameter("ac"));
        java.lang.reflect.Method method;
        

        StatesDao dao = new StatesDao(new ArrayList<State>());

        req.setAttribute("states", dao.getStates());
        req.setAttribute("content", "state-form.jsp");
        req.setAttribute("title", "Estados");
        req.setAttribute("action", "admin?p=StateSave");
        System.out.println("Executando a logica e redirecionando...");
        return "layout.jsp";
    }
    
    
    

  
}
