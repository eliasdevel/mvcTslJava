<%@page pageEncoding="UTF-8" contentType="text/html" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>       
<c:import  url = "tool-bar.jsp"/>
<table class="table table-dark" >
    <thead>
        <tr>
            <th scope="col"> Opções </th>
            <th scope="col">Nome</th>
            <th scope="col">Email</th>
            <th scope="col">CPF</th>

        </tr>
    </thead>
    <tbody>   
        <c:forEach items = "${users}"  var = "user">
            <tr>
                <td> 
                    <a style="font-size:  20px" href="?p=UserForm&id=<c:out value = "${user.getId()}"/>" class="glyphicon-pencil"></a>
                    <a style="font-size:  20px" href="?p=UserSave&ac=delete&id=<c:out value = "${user.getId()}"/>" class="glyphicon-minus"></a>
                </td>
                <td scope="col"> 
                    <c:out value = "${user.getName()}"/><p>
                </td>
                <td scope="col"> 
                    <c:out value = "${user.getEmail()}"/><p>
                </td>
                <td scope="col"> 
                    <c:out value = "${user.getCpf()}"/><p>
                </td>

            </tr>
        </c:forEach>
    </tbody>
</table>