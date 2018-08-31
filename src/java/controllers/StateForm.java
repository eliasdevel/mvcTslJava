package controllers;

import dao.StatesDao;
import java.sql.ResultSet;
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
        String action = "admin?p=StateSave";
        req.setAttribute("states", dao.getStates(null));
        req.setAttribute("content", "state-form.jsp");
        req.setAttribute("title", "Estados");
        if (req.getParameter("id") != null) {
            ResultSet rs = dao.getById("states", req.getParameter("id"));
            rs.next();
            State state = new State();
            action += "&id=" + req.getParameter("id");
            state.setId(req.getParameter("id"));
            state.setName(rs.getString("name"));
            req.setAttribute("state", state);
        }

        req.setAttribute("action", action);
        System.out.println("Executando a logica e redirecionando...");
        return "layout.jsp";
    }

}
