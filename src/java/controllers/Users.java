package controllers;

import dao.StatesDao;
import dao.UsersDao;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
public class Users implements Logic {

    public String executa(HttpServletRequest req,
            HttpServletResponse res)
            throws Exception {
        UsersDao dao = new UsersDao(new ArrayList<User>());
        req.setAttribute("users", dao.getUsers(null));
        req.setAttribute("content", "users-list.jsp");
        req.setAttribute("savePage", "UserForm");
        req.setAttribute("title", "Users");
        System.out.println("Executando a logica e redirecionando...");
        return "layout.jsp";
    }
  
}
