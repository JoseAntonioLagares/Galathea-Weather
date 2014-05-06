<%-- 
    Document   : prediccion
    Created on : 21-nov-2013, 22:33:05
    Author     : JoseAntonio
--%>

<%@page import="com.utils.ObtenerPrediccion"%>
<%@page import="com.modelo.Prediccion"%>
<%@page import="com.utils.ObtenerProvincias"%>
<%@page import="com.modelo.Provincia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <style type="text/css"></style>
        <link href="${pageContext.request.contextPath}/view/css/bootstrap_weather.css" rel="stylesheet">
        <style type="text/css"></style>

    </head>
    <body oncontextmenu="return false">
        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/view/paginas/prediccion.jsp">El tiempo</a></li>
                    <li><a href="${pageContext.request.contextPath}/view/paginas/about.jsp">About</a></li>                    
                        <% if (sesion.getAttribute("nick") != null) {
                                if (!sesion.getAttribute("nick").equals("admin")) {
                        %> 
                    <li ><a class="btn btn-warning" href="${pageContext.request.contextPath}/view/paginas/prediccion.jsp"><i class="glyphicon glyphicon-user"></i> <%=  sesion.getAttribute("nick")%></a></li>
                        <% } else {%>
                    <li><a class="btn btn-warning active" href="${pageContext.request.contextPath}/view/paginas/panel/panelAdmin.jsp"><i class="glyphicon glyphicon-user"></i> <%=  sesion.getAttribute("nick")%></a></li>
                        <% }
                        } else {%>
                    <li><a class="btn btn-warning active" href="${pageContext.request.contextPath}/view/paginas/registro.jsp"><i class="glyphicon glyphicon-user"></i> Login</a></li>
                        <% }%> 
                </ul>
                <h3 class="text-muted">Galathea Weather</h3>
            </div>
            <%
                if (sesion.getAttribute("nick") != null) {
            %>
            <div class="page-header">
                <%
                    List<Provincia> lista = ObtenerProvincias.obtenerProvincias();
                    if (lista.size() > 0) {
                %>
                <div class="col-md-12 column">
                    <div class="btn-group btn-group-md">
                        <form action="<%=request.getContextPath()%>/ServletSelecProvinciaTiempo" method="POST">
                            <%for (int i = 0; i < lista.size(); i++) {%>
                            <input type="submit" class="btn btn-info" name="seleccionar" value="<%=lista.get(i).getNombre()%>">
                            <%}%>
                            <br/>
                        </form>
                    </div>
                </div>
                <%
                    if (request.getParameter("seleccionar") != null) {
                        String provincia = request.getParameter("seleccionar").toString();
                        List<Prediccion> predicciones = ObtenerPrediccion.obtenerPredicciones(ObtenerProvincias.obtenerIDProvincia(request.getParameter("seleccionar")));
                        if (predicciones.size() > 0) {
                            predicciones = ObtenerPrediccion.filtrar(predicciones, 4);
                            
                %>
                <!--A meter las previsiones -->
                <div class="row">
                    <h1><%=provincia %></h1>
                    <%for (int i = 0; i < predicciones.size(); i++) {%> 
                    <div class="col-md-3 column">
                        <%if (predicciones.get(i).getEstado().compareToIgnoreCase("lluvioso") == 0) {%>
                        <img src="<%=request.getContextPath()%>/view/resources/img/lluvioso.svg" alt="llueve">
                        <%}%>
                        <%if (predicciones.get(i).getEstado().compareToIgnoreCase ("nieve") == 0) {%>
                        <img src="<%=request.getContextPath()%>/view/resources/img/nieve.svg" alt="nieve">
                        <%}%>
                        <%if (predicciones.get(i).getEstado().compareToIgnoreCase("nublado") == 0) {%>
                        <img src="<%=request.getContextPath()%>/view/resources/img/nublado.svg" alt="nublado">
                        <%}%>
                        <%if (predicciones.get(i).getEstado().compareToIgnoreCase("soleado") == 0) {%>
                        <img src="<%=request.getContextPath()%>/view/resources/img/soleado.svg" alt="soleado">
                        <%}%>
                        <small><%=predicciones.get(i).getDia() + "/" + predicciones.get(i).getMes() + "/" + predicciones.get(i).getAnio()%></small>
                        <h5 class="text-left text-info">Temp. Min: <%=predicciones.get(i).getTemMin()%></h5>
                        <h5 class="text-danger">Temp. Max: <%=predicciones.get(i).getTemMax()%></h5>
                    </div> 
                    <%}%>
                </div>

                <!-- -->
                <% } else {%>
                <h1>No hay predicciones para mostrar</h1>
                <% }
                    }%>
                <% } else {%>
                <h1>No hay provincias para mostrar</h1>
                <p>Ponte ne contacto con los administradores en caso de haber alg&uacute;n problema</p>

                <%}%>
            </div>
            <% } else {%>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/view/js/jquery.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/view/js/bootstrap.js"></script>

    </body>
</html>