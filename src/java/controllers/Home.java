package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
public class Home implements Logic {

    public String executa(HttpServletRequest req,
            HttpServletResponse res)
            throws Exception {
        System.out.println(req.getParameter("ac"));

        req.setAttribute("content", "home.jsp");
        req.setAttribute("title", "iTragoAdmin");
        System.out.println("Executando a logica e redirecionando...");
        return "layout.jsp";
    }

}
