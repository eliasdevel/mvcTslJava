<%@page pageEncoding="UTF-8" contentType="text/html" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>

<html lang="en" >
    <head>
        <link rel="shortcut icon" href="assets/favicon.ico" />
         <meta charset="UTF-8"> 
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><c:out value = "${title}"/></title>
        <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/grid.css" rel="stylesheet">
        <link href="assets/menu.css" rel="stylesheet"/>
        <script src="jquery/jquery.js"></script>
        <script src="bootstrap/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <c:import  url = "menu.jsp"/>
        <div class= "main" style="height:100%">
            <c:import  url = "${content}"/>
        </div>
    </body>
</html>