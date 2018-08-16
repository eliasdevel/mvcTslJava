<%-- 
    Document   : primeiraView.jsp
    Created on : 16/08/2018, 10:46:27
    Author     : elias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <table>
            <body>
                aaa
                <c:forEach items = "${states}"  var = "state">
                    Item <c:out value = "${state.getName()}"/><p>
                    </c:forEach>
            </body>
        </table>
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
