<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>       
<form  action="<c:out value = "${action}"/>" method="POST"  >
  <div class="form-group">
    <label for="inputName">Nome</label>
    <input name ="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="estadoHelp" placeholder="Nome do estado">
    
  </div>
  <div class="form-group">
    <label for="inputSigla">Sigla</label>
    <input name ="id" type="text" class="form-control" id="exampleInputPassword1" placeholder="Sigla">
  </div>
  
  <button type="submit" class="btn btn-primary">Salvar</button>
</form>