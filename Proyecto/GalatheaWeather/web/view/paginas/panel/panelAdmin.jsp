<!DOCTYPE html>
<%@page session="true"%>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% HttpSession sesion = request.getSession(false);%>

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
                </ul>
                <h3 class="text-muted">Galathea Weather</h3>
            </div>
            <% if (sesion.getAttribute("nick").equals("admin")) {%>   
            <div class="page-header">
                <h1>Panel de Administraci&oacute;n <small>...&Uacute;salo con cuidado...</small></h1>
                <div class="row">
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/view/resources/img/usuarios.png" alt="usuarios" class="img-responsive">
                            <div class="caption">
                                <h3>Usuarios</h3>
                                <p>Administraci&oacute;n de usuarios<p>
                                <p><a href="${pageContext.request.contextPath}/view/paginas/panel/panelMostrarUsuarios.jsp" class="btn btn-warning" role="button">Usuarios</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/view/resources/img/weather.png" alt="tiempo" class="img-responsive">
                            <div class="caption">
                                <h3>Tiempo</h3>
                                <p>Administraci&oacute;n del tiempo<p>
                                <p><a href="${pageContext.request.contextPath}/view/paginas/panel/panelControlTiempo.jsp" class="btn btn-warning" role="button">Tiempo</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/view/resources/img/avisos.jpg" alt="avisos" class="img-responsive">
                            <div class="caption">
                                <h3>Avisos</h3>
                                <p>dministraci&oacute;n de avisos<p>
                                <p><a href="${pageContext.request.contextPath}/view/paginas/formularios/altaAviso.jsp" class="btn btn-warning" role="button">Avisos</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/view/resources/img/preguntas.jpg" alt="preguntas" class="img-responsive">
                            <div class="caption">
                                <h3>Preguntas</h3>
                                <p>Administraci&oacute;n de preguntas<p>
                                <p><a href="${pageContext.request.contextPath}/view/paginas/formularios/altaPregunta.jsp" class="btn btn-warning" role="button">Preguntas</a></p>
                            </div>
                        </div>
                    </div>
                </div>
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
    </body></html>