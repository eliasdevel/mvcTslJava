<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><c:out value = "${title}"/></title>
        <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/login.css" rel="stylesheet">
      
        <script src="jquery/jquery.js"></script>
        <script src="bootstrap/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div  class="login col-lg-8">
            <form  action="<c:out value = "admin?p=Login"/>" method="POST"  >
                <div class="form-group">
                    <label for="inputName">Nome</label>
                    <input name ="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="estadoHelp" placeholder="Nome do estado">

                </div>
                <div class="form-group">
                    <label for="inputPassword">Senha</label>
                    <input name ="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Sigla">
                </div>

                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
        </div>
    </body>