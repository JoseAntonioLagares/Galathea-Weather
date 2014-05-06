<!DOCTYPE html>
<%@page session="true"%>
<html lang="en">
    <% HttpSession sesion = request.getSession(false);%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Galathea Weather</title>

        <link href="${pageContext.request.contextPath}/view/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/view/css/bootstrap_weather.css" rel="stylesheet">
        <style type="text/css"></style><style type="text/css"></style></head>

    <body oncontextmenu="return false">

        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li class="active"><a href="index.jsp">Inicio</a></li>
                        <% if (sesion.getAttribute("nick") == null) {%>
                    <li><a href="${pageContext.request.contextPath}/view/paginas/registro.jsp">El tiempo</a></li>
                        <%} else {%>
                    <li><a href="${pageContext.request.contextPath}/view/paginas/prediccion.jsp">El tiempo</a></li>
                    <%}%>
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

            <div class="jumbotron">
                <% if (sesion.getAttribute("nick") == null) {%> 
                <h1>El tiempo en tu zona</h1>
                <p class="lead">Esta aplicaci&oacute;n le permite conocer el tiempo en provincias y localidades. Adem&aacute;s para disfrutar de m&uacute;ltiples ventajas, debe registrarse. <p>
                <p><a class="btn btn-lg btn-success" href="view/paginas/registro.jsp" role="button">&iexcl;Entra YA!</a></p>
                <%} else {%>
                <h1><%=  sesion.getAttribute("nombre")%></h1>
                <p class="lead">Ya puedes empezar a disfrutar de las ventajas que ofrece la mejor web del tiempo. <p>
                <p><a class="btn btn-lg btn-success" href="view/paginas/prediccion.jsp" role="button">&iexcl;Disfruta de las ventajas!</a></p>               
                <p class="lead">En caso de que ya no nos quieras :'( ...tambi&eacute;n puedes salir...<p>
                <form class="form-horizontal" action="<%=request.getContextPath()%>/ServletCerrarSesion" method="POST">
                    <div class="control-group">
                        <div class="controls">
                            <p><input type="submit" class="btn btn-lg btn-danger" name="salir" value="Salir"/></p>
                        </div>
                    </div>    
                </form>
                <%}%>
            </div>

            <div class="row marketing">
                <div class="col-lg-6">
                    <h4>Predicci&oacute;n del tiempo</h4>
                    <p>Conozca de primera mano las distintas predicciones para su hubicaci&oacute;n.</p>
                    <% if (sesion.getAttribute("nick") == null) {%> 
                    <p><a class="btn btn-primary" href="view/paginas/registro.jsp">Ver Detalles &raquo;</a></p>
                    <%} else {%>
                    <p><a class="btn btn-primary" href="view/paginas/prediccion.jsp">Ver Detalles &raquo;</a></p>
                    <%}%>
                    <h4>Avisos</h4>
                    <p>Si Ud. es un usuario registrado peude recibir avisos de las &uacute;ltimas noticias emitidas.</p>
                    <% if (sesion.getAttribute("nick") == null) {%> 
                    <p><a class="btn btn-primary" href="view/paginas/registro.jsp">Ver Detalles &raquo;</a></p>
                    <%} else {%>
                    <p><a class="btn btn-primary" href="view/paginas/avisos.jsp">Ver Detalles &raquo;</a></p>
                    <%}%>
                </div>
                <div class="col-lg-6">
                    <h4>Preguntas</h4>
                    <p>Si Ud. tiene alguna duda, Galathea Weather le ofrece un servicio para enviar preguntas.</p>
                    <% if (sesion.getAttribute("nick") == null) {%> 
                    <p><a class="btn btn-primary" href="view/paginas/registro.jsp">Ver Detalles &raquo;</a></p>
                    <%} else {%>
                    <p><a class="btn btn-primary" href="view/paginas/preguntas.jsp">Ver Detalles &raquo;</a></p>
                    <%}%>	

                    <h4>Sobre el equipo</h4>
                    <p>Consulte nuestro perfil en la secci&oacute;n de <a href="view/paginas/about.jsp">about</a></p>
                    <p><a class="btn btn-primary" href="view/paginas/about.jsp">Ver Detalles &raquo;</a></p>			  
                </div>
            </div>

            <div class="footer">
                <p>Galathea Weather &copy; UCAV 2013 - 2014</p>
            </div>
        </div> 
    </body>
</html>