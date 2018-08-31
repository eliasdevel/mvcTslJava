package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
public class Login implements Logic {

    public String executa(HttpServletRequest req,
            HttpServletResponse res)
            throws Exception {
        System.out.println(req.getParameter("ac"));

        req.getSession().setAttribute("email", req.getParameter("email"));
        req.getSession().setAttribute("password", req.getParameter("password"));

//        StatesDao dao = new StatesDao(new ArrayList<State>());
//
//        req.setAttribute("states", dao.getStates());
//        req.setAttribute("content", "states-list.jsp");
        req.setAttribute("title", "Login");
        System.out.println("Executando a logica e redirecionando...");
        if (req.getParameter("email") != null) {
            req.setAttribute("url", "admin?p=Login&tried=t");
            return "reload.jsp";
        }
        if (req.getParameter("tried") != null) {
            if (req.getParameter("tried").equals("t")) {
                req.setAttribute("error", "E-mail ou senha incorretos");
            }
        }

        return "login.jsp";
    }

}
