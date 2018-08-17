<%--
    Document   : index
    Created on : 08/08/2018, 20:35:07
    Author     : emuller2
--%>

<%@ page import="java.sql.*" %>   
<%@ page import="com.mysql.jdbc.Driver" %>  
<%  
    String url = "jdbc:mysql://localhost:3306/mydb";
    String username = "root";  
    String password = "mysqL/123";  
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    }catch(Exception e){
        e.printStackTrace();
    }
   Connection conn = DriverManager.getConnection( url, username, password );
   

   %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados do banco de dados</title>
    </head>
    <body>
        <% try {
            Statement st = conn.createStatement(); 
            
//             "INSERT INTO states('RS','Rio Grande do Sul')";
              String sql =     "SELECT * FROM states;";
            ResultSet rs = st.executeQuery(sql);
        %>
           <table border="1">
        <thead>
            <tr>
                <th>Nome</th>
                <th>Sigla</th>
            </tr>
        </thead>
        <tbody>
        <% while(rs.next()){%>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("id") %></td>
            </tr>

        <%}
        
         }catch (Exception e ){
            e.printStackTrace();
        }%>
        
              </tbody>
    </table>
    </body>
</html>

