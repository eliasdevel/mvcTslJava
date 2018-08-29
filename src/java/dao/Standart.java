/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.ConexaoBD;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;

/**
 *
 * @author elias
 */
public class Standart {
    protected String table;
    protected Connection con;
    protected String  query;

    public Standart() {
          ConexaoBD conexao = new ConexaoBD();
          try {
              
                if(conexao.abriuConexao()){
                    System.out.println("Abriu Normalmente");
                }else{
                    System.out.println("erro de conexao");
                }
            } catch (Exception e) {
                System.out.println("erro de conexao");
            }
          
             try {
              
               this.con = conexao.obterConexao();
            } catch (Exception e) {
                
            }
         
    }

    
    
    public void setTable(String table) {
        this.table = table;
    }
    
    
}
