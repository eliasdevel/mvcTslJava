package controllers;

import dao.CitysDao;
import dao.UsersDao;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Address;
import models.City;
import models.State;
import models.User;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
public class UserSave implements Logic {
    
    public String executa(HttpServletRequest req,
            HttpServletResponse res)
            throws Exception {
        System.out.println(req.getParameter("ac"));
        java.lang.reflect.Method method;
        UsersDao dao = new UsersDao(new ArrayList<User>());
        CitysDao citysDao = new CitysDao(new ArrayList<City>());
        User user = new User();
        State state = new State();
        
        Address address = new Address();
        City city = new City();
        
        if (req.getParameter("id") != null) {
            user.setId(Integer.parseInt(req.getParameter("id")));
        }
        if (req.getParameter("name") != null) {
            user.setName(req.getParameter("name"));
        }
        if (req.getParameter("email") != null) {
            user.setName(req.getParameter("email"));
        }
        if (req.getParameter("cpf") != null) {
            user.setName(req.getParameter("cpf"));
        }
        if (req.getParameter("type") != null) {
            user.setName(req.getParameter("type"));
        }
        if (req.getParameter("city") != null) {
            address.setCity(citysDao.getCity(Integer.parseInt(req.getParameter("city"))));
            
//            user.getAddress().setCity(citysDao.getCity(0)));
        }
        
        if (req.getParameter("ac") != null) {
            if (req.getParameter("ac").equals("delete")) {
                dao.delete("users", req.getParameter("id"));
            }
        } else {
            if (dao.saveUser(user)) {
                req.setAttribute("type-msg", "sucess");
                req.setAttribute("msg", "Salvo com sucesso");
            } else {
                req.setAttribute("type-msg", "error");
                req.setAttribute("msg", "Erro ao salvar");
            }
        }
        
        req.setAttribute("url", "?p=Users");
        return "reload.jsp";
    }
}
