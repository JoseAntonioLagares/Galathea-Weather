<!DOCTYPE html>
<%@page session="true"%>
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
            <% if (sesion.getAttribute("nick").equals("admin")) {%>  
            <div class="row">
                <div class="col-xs-12 col-md-12"><h1>Aviso</h1></div>
            </div>
            <div class="row">
                <div class="col-md-6 col-md-offset-3">  
                    <form class="form-horizontal" action="<%=request.getContextPath()%>/ServletAltaAvisos" method="POST" align="center" name="nuevoAviso">
                        <!-- Textarea -->
                        <div class="control-group">
                            <label class="control-label" for="texto">Aviso</label>
                            <div class="controls">                     
                                <textarea id="texto" name="texto" placeholder="Ponga su aviso aqu&iacute;" required></textarea>
                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="control-group">
                            <br/>
                            <label class="control-label" for="importancia">Importancia</label>
                            <div class="controls">
                                <select id="importancia" name="importancia" class="input-large">
                                    <option>Normal</option>
                                    <option>Alta</option>
                                </select>
                            </div>
                        </div>               
                        <br>                            
                        <!--<input type="submit" class="btn btn-danger" name="login" value="Emitir Aviso"/>-->
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#nuevoaviso">Nuevo Aviso</button>
                        <br/><br/>
                        <div class="modal fade" id="nuevoaviso" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">Nuevo aviso</h4>
                                    </div>
                                    <div class="modal-body">                                        
                                        <p>&iquest;Desea enviar este aviso?. Recuerde, este proceso llevar&aacute; algo de tiempo.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        <input type="submit" class="btn btn-danger" name="enviar" value="Enviar"/>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->

                    </form>
                </div>
            </div>
            <%} else {%>
            <div class="jumbotron">
                <h1>No te vayas por las ramas...</h1>
                <p class="lead">Hola, <%= sesion.getAttribute("nick")%> , te notamos algo perdido, esperemos que no se hayan "nublado" tus ideas. No te preocupes, pulsa el bot&oacute;n para salir de aqu&iacute;. <p>
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
