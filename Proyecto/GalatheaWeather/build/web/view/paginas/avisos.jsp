<%-- 
    Document   : panelAvisos
    Created on : 19-nov-2013, 20:41:52
    Author     : JoseAntonio
--%>
<%@page import="com.utils.ObtenerAvisos"%>
<%@page import="com.modelo.Avisos"%>
<%@page import="java.util.List"%>
<!DOCTYPE html><%@page session="true"%>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            HttpSession sesion = request.getSession(false);
        %>        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Galathea Weather</title>

        <link href="${pageContext.request.contextPath}/view/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/view/css/bootstrap_weather.css" rel="stylesheet">
        <style type="text/css"></style><style type="text/css"></style>
    </head>
    <body oncontextmenu="return false">
        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
                    <li><a href="view/paginas/prediccion.jsp">El tiempo</a></li>
                    <li><a href="view/paginas/about.jsp">About</a></li>                    
                        <% if (sesion.getAttribute("nick") != null) {
                                if (!sesion.getAttribute("nick").equals("admin")) {
                        %> 
                    <li><a class="btn btn-warning" href="${pageContext.request.contextPath}/view/paginas/prediccion.jsp"><i class="glyphicon glyphicon-user"></i> <%=  sesion.getAttribute("nick")%></a></li>
                        <% } else {%>
                    <li><a class="btn btn-warning active" href="${pageContext.request.contextPath}/view/paginas/panel/panelAdmin.jsp"><i class="glyphicon glyphicon-user"></i> <%=  sesion.getAttribute("nick")%></a></li>
                        <% }
                        } else {%>
                    <li><a class="btn btn-warning active" href="${pageContext.request.contextPath}/view/paginas/registro.jsp"><i class="glyphicon glyphicon-user"></i> Login</a></li>
                        <% }%> 
                </ul>
                <h3 class="text-muted">Galathea Weather</h3>
            </div>
            <% if (sesion.getAttribute("nick") != null) {%>   
            <div class="page-header">
                <h1>Avisos</h1>
                
                <%
                    List<Avisos> avisos = ObtenerAvisos.seleccionarTodosAvisos();
                    for (int i = 0; i < avisos.size(); i++) {
                        if (avisos.get(i).isImportancia()) {%>
                <div class="alert alert-danger">
                    <strong>&iexcl;AVISO! - <%= avisos.get(i).getDia() + "/" + avisos.get(i).getMes() + "/" + avisos.get(i).getAnio()%></strong>: <%=avisos.get(i).getTexto()%>.
                </div>
                <%} else {%>
                <div class="alert alert-warning">
                    <strong>&iexcl;AVISO! - <%= avisos.get(i).getDia() + "/" + avisos.get(i).getMes() + "/" + avisos.get(i).getAnio()%></strong>: <%=avisos.get(i).getTexto()%>.
                </div>
                <% }
                    }%>
            </div>
            <%} else {%>
            <div class="jumbotron">
                <h1>No te vayas por las ramas...</h1>
                <p class="lead">Hola, te notamos algo perdido, esperemos que no se hayan "nublado" tus ideas. No te preocupes, pulsa el bot&oacute;n para salir de aqu&iacute;. <p>
                <p><a class="btn btn-lg btn-success" href="${pageContext.request.contextPath}/index.jsp" role="button">&iexcl;Inicio!</a></p>
            </div>
            <%}%>

            <div class="footer">
                <p>Galathea Weather &copy; UCAV 2013 - 2014</p>
            </div>
        </div> 
    </body>
</html>
