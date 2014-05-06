<!DOCTYPE html>
<%@page session="true"%>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% HttpSession sesion = request.getSession(true);%>

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
                    <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
                    <li><a href="${pageContext.request.contextPath}/view/paginas/prediccion.jsp">El tiempo</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/view/paginas/about.jsp">About</a></li>                    
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
                <div class="panel panel-info">
                    <div class="panel-heading">Datos b&aacute;sicos de las tecnolog&iacute;as usadas para el desarrollo de este proyecto</div>
                    <!-- List group -->
                    <ul class="list-group">
                        <li class="list-group-item">Netbeans 7.3 y Notepad++</li>
                        <li class="list-group-item">Framework BootStrap (HTML5,CSS3,js) + jquery</li>
                        <li class="list-group-item">960 Grid System</li>
                        <li class="list-group-item">Adobe True Color</li>
                        <li class="list-group-item">Tomcat 6</li>
                        <li class="list-group-item">APIs para enviar email y twitter.</li>
                    </ul>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">Datos personales</div>
                    <ul class="list-group">
                        <li class="list-group-item">Jos&eacute Antonio Lagares Rodr&iacute;guez</li>
                        <li class="list-group-item">Universidad Cat&oacute;lica de &Aacute;vila</li>
                        <li class="list-group-item">Curso 2013-2014</li>
                        <li class="list-group-item">Todos los derechos reservados</li>
                    </ul>
                </div>			
            </div>
            <div class="row">
                <div class="col-sm-3 col-md-6">
                    <div class="thumbnail">
                        <img src="<%=request.getContextPath()%>/view/resources/img/gmail.png" alt="Correo Gmail" style="width: 250; height: 200px;" class="img-responsive">
                        <div class="caption">
                            <h3>Contacto personal</h3>
                            <p>Ponte en contacto conmigo, m&aacute;ndame un email<p>
                            <p><a href="mailto:lagares91@gmail.com" class="btn btn-danger" role="button">Escribeme</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-md-6">
                    <div class="thumbnail">
                        <img src="<%=request.getContextPath()%>/view/resources/img/tweeter.png" alt="twitter" style="width: 250; height: 200px;" class="img-responsive">
                        <div class="caption">
                            <h3>S&iacute;gueme en Twitter</h3>
                            <p>Tamb&eacute;n puedes seguirme en twitter<p>
                            <p><a href="https://twitter.com/L_a_g_a_r_e_s" class="btn btn-primary" role="button">S&iacute;gueme</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <p>Galathea Weather &copy; UCAV 2013 - 2014</p>
            </div>
        </div> 
    </body>
</html>