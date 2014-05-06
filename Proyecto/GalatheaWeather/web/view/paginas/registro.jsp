<!DOCTYPE html><%@page session="true"%>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <style type="text/css"></style><style type="text/css"></style></head>

    <body oncontextmenu="return false">

        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
                    <li><a href="${pageContext.request.contextPath}/view/paginas/prediccion.jsp">El tiempo</a></li>
                    <li><a href="${pageContext.request.contextPath}/view/paginas/about.jsp">About</a></li>
                        <% if (sesion.getAttribute("nick") != null) {%> 
                    <li ><a class="btn btn-warning" href="${pageContext.request.contextPath}/index.jsp"><i class="glyphicon glyphicon-user"></i> <%=  sesion.getAttribute("nick")%></a></li>
                        <%} else {%>
                    <li><a class="btn btn-warning active" href="${pageContext.request.contextPath}/view/paginas/registro.jsp"><i class="glyphicon glyphicon-user"></i> Login</a></li>
                        <%}%>
                </ul>
                <h3 class="text-muted">Galathea Weather</h3>
            </div>
            <div class="row marketing">
                <div class="col-md-5">
                    <h4>Si a&uacute;n no est&aacute;s registrado,&iquest;a qu&eacute; esperas?</h4>
                    <br/>
                    <p><a class="btn btn-lg btn-success" href="${pageContext.request.contextPath}/view/paginas/formularios/altaUsuario.jsp" role="button">REGISTRATE</a></p>
                </div>		
                <div class="col-md-5 col-md-offset-2">
                    <form class="form-horizontal" action="<%=request.getContextPath()%>/ServletLogin" method="POST">
                        <div class="control-group">
                            <label class="control-label" for="inputUsuario">Usuario</label>
                            <div class="controls">
                                <input type="text" name="nick" placeholder="Usuario" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputPassword">Password</label>
                            <div class="controls">                              
                                <input type="password" name="password" placeholder="Password" required>
                                <br/><br/>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">					
                                <p><input type="submit" class="btn btn-lg btn-primary" name="login" value="Entra"/></p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="footer">
                <p>Galathea Weather &copy; UCAV 2013 - 2014</p>
            </div>
        </div> 
    </body></html>