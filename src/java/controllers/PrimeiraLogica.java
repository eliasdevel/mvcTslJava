package controllers;


import models.Cusco;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 public class PrimeiraLogica implements Logic {
        public String executa(HttpServletRequest req,
                HttpServletResponse res)
                throws Exception {
             List<Cusco> cuscos =new ArrayList<Cusco>();
             Cusco c = new Cusco();
             c.id = 1;
             c.nome = "aaa";
             cuscos.add(c);
             cuscos.add(c);
             cuscos.add(c);
             cuscos.add(c);
             cuscos.add(c);
             cuscos.add(c);
             cuscos.add(c);
            req.setAttribute("cuscos",cuscos );
            System.out.println("Executando a logica e redirecionando...");
            return "primeiraView.jsp";
        }
    }
