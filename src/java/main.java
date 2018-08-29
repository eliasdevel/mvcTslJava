/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controllers.*;
import db.ConexaoBD;
import javax.servlet.http.HttpSession;

/**
 *
 * @author elias
 */
@WebServlet(urlPatterns = {"/admin"})
public class main extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String parametro = request.getParameter("p");
        String usuario = (String) session.getAttribute("name");
        String senha = (String) session.getAttribute("password");

        if (usuario == null || senha == null) {
            parametro = "Login";
        }

//            String nomeDaClasse = "br.com.caelum.mvc.logica." + parametro;
        String nomeDaClasse = "controllers." + parametro;

        try {
            ConexaoBD conexao = new ConexaoBD();
            if (conexao.abriuConexao()) {
                System.out.println("Abriu Normalmente");
            } else {
                System.out.println("erro de conexao");
            }
        } catch (Exception e) {

            throw new ServletException(
                    "A lógica de negócios causou uma exceção", e);
        }

        try {
            Class<?> classe = Class.forName(nomeDaClasse);
            Logic logica = (Logic) classe.newInstance();

            // Recebe o String após a execução da lógica
            String pagina = logica.executa(request, response);

            // Faz o forward para a página JSP
            request.getRequestDispatcher(pagina).forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "A lógica de negócios causou uma exceção", e);
        }
    }
}
