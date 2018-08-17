<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>       
<table class="table table-dark" >
    <thead>
        <tr>
            <th scope="col">Sigla</th>
            <th scope="col">Estado</th>
        </tr>
    </thead>
    <tbody>   
        <tr>
            <c:forEach items = "${states}"  var = "state">
                <td scope="col"> 
                    <c:out value = "${state.getId()}"/><p>
                </td>
                <td scope="col"> 
                    <c:out value = "${state.getName()}"/><p>
                </td>
            </c:forEach>
        </tr>
    </tbody>
</table>
