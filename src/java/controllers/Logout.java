package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
public class Logout implements Logic {

    public String executa(HttpServletRequest req,
            HttpServletResponse res)
            throws Exception {
        System.out.println(req.getParameter("ac"));

        req.getSession().removeAttribute("email");
        req.getSession().removeAttribute("password");
        

//        StatesDao dao = new StatesDao(new ArrayList<State>());
//
//        req.setAttribute("states", dao.getStates());
//        req.setAttribute("content", "states-list.jsp");
        req.setAttribute("title", "Login");
        System.out.println("Executando a logica e redirecionando...");
        return "login.jsp";
    }

   
}
