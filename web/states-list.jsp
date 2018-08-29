<%@page pageEncoding="UTF-8" contentType="text/html" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>       
 <c:import  url = "tool-bar.jsp"/>
<table class="table table-dark" >
    <thead>
        <tr>
            <th scope="col">Sigla</th>
            <th scope="col">Estado</th>
        </tr>
    </thead>
    <tbody>   
         <c:forEach items = "${states}"  var = "state">
        <tr>
           
                <td scope="col"> 
                    <c:out value = "${state.getId()}"/><p>
                </td>
                <td scope="col"> 
                    <c:out value = "${state.getName()}"/><p>
                </td>
            
        </tr>
        </c:forEach>
    </tbody>
</table>