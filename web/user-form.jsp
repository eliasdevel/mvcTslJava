<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>       
<form  action="<c:out value = "${action}"/>" method="POST"  >
    <div class="form-group">
        <label for="inputName">Nome</label>
        <input name ="name" value="<c:out value="${user.getName()}"/>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="estadoHelp" placeholder="Nome do estado">

    </div>
    <div class="form-group">
        <label for="inputSigla">E-mail</label>
        <input name ="email" value="<c:out value="${user.getEmail()}"/>" type="email" class="form-control" id="exampleInputPassword1" placeholder="E-mail">
    </div>
    <div class="form-group">
        <label for="inputSigla">CPF</label>
        <input name ="cpf" value="<c:out value="${user.getCpf()}"/>" type="email" class="form-control" id="exampleInputPassword1" placeholder="E-mail">
    </div>
    <div class="form-group">
        <label for="exampleFormControlSelect1">Tipo</label>
        <select class="form-control" id="exampleFormControlSelect1" name="type"  >
            <option value="${user.getType()}" selected>${tipos[user.getType()]}</option>
            <c:forEach items="${tipos}" var="tipo">
                <c:if test="${tipo.key != user.getType()}">
                    <option value="${tipo.key}">${tipo.value}</option>
                </c:if>
            </c:forEach>

        </select>
    </div>

    <button type="submit" class="btn btn-primary">Salvar</button>
</form>