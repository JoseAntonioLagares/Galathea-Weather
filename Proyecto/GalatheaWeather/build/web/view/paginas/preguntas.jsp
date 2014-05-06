<%-- 
    Document   : preguntas
    Created on : 19-nov-2013, 23:46:44
    Author     : JoseAntonio
--%>
<%@page import="com.utils.ObtenerUsuario"%>
<%@page import="com.modelo.Pregunta"%>
<%@page import="com.utils.ObtenerPreguntas"%>
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
        <style type="text/css"></style>
        <link href="${pageContext.request.contextPath}/view/css/bootstrap_weather.css" rel="stylesheet">
        <style type="text/css"></style>

    </head>
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
            <% if (sesion.getAttribute("nick") != null) {%>   
            <h1>Preguntas</h1>
            <br/>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#nuevapregunta">Nueva Pregunta</button>
            <br/><br/>
            <div class="modal fade" id="nuevapregunta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form class="form-horizontal" action="<%=request.getContextPath()%>/ServletAltaPregunta" method="POST" name="altaPregunta" onSubmit="return validacion()">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">Nueva Pregunta</h4>
                            </div>
                            <div class="modal-body">
                                <% if (sesion.getAttribute("nick").equals("admin")) {%>
                                <div class="control-group">
                                    <label class="control-label" for="texto" >Selecciona un usuario</label>
                                    <div class="controls"> 
                                        <select id="usuario" name="destinatario" class="input-large">
                                            <%
                                                List<String> nicks = ObtenerUsuario.obtenerNick();
                                                for (int i = 0; i < nicks.size(); i++) {%>
                                            <option><%= nicks.get(i)%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <%}%>
                                <div class="control-group">
                                    <label class="control-label" for="texto">Pregunta</label>
                                    <div class="controls">                     
                                        <textarea id="texto" name="texto" placeholder="Ponga aqu&iacute; su pregunta" required></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <input type="submit" class="btn btn-danger" name="enviar" value="Enviar"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div><!-- /.modal-content -->

            <%
                List<Pregunta> preguntasRecibidasNoLeidas = ObtenerPreguntas.seleccionarPreguntasRecibidasNoLeidas((String) sesion.getAttribute("dni").toString());
                List<Pregunta> preguntasRecibidasLeidas = ObtenerPreguntas.seleccionarPreguntasRecibidas((String) sesion.getAttribute("dni").toString());
                List<Pregunta> preguntasEnviadas = ObtenerPreguntas.seleccionarPreguntasEnviadas((String) sesion.getAttribute("dni").toString());
            %>

            <div>
                <ul class="nav nav-tabs" id="taps">
                    <li class="active"><a href="#op1" data-toggle="tab">No Leidas       <%if (preguntasRecibidasNoLeidas.size() > 0) {%><span class="badge btn-info"><%= preguntasRecibidasNoLeidas.size()%></span><%}%></a></li>
                    <li><a href="#op2" data-toggle="tab">Leidas</a></li>
                    <li><a href="#op3" data-toggle="tab">Enviadas</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="op1">
                        <%if (preguntasRecibidasNoLeidas.size() > 0) {%>
                        <form action="<%=request.getContextPath()%>/ServletModificarPreguntasRecibidas" method="POST">
                            <table class="table">
                                <thead><tr><th>De</th><th>Texto</th><th>Marcar como visto</th></tr></thead>
                                <tbody>
                                    <% for (int i = 0; i < preguntasRecibidasNoLeidas.size(); i++) {%>
                                    <tr>
                                        <td><%= ObtenerUsuario.seleccionaNick(preguntasRecibidasNoLeidas.get(i).getRemitente())%> </td>
                                        <td><%= preguntasRecibidasNoLeidas.get(i).getTexto()%></td>
                                        <td><input type="submit" class="btn btn-xs btn-info" name="marcar" value="Marcar"><input type="hidden" name="id" value="<%=preguntasRecibidasNoLeidas.get(i).getId()%>"></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </form> 
                        <%} else {%>
                        <h3>No hay Mensajes</h3>
                        <%}%>
                    </div>
                    <div class="tab-pane" id="op2">
                        <%if (preguntasRecibidasLeidas.size() > 0) {%>
                        <table class="table">
                            <thead><tr><th>De</th><th>Texto</th></tr></thead>
                            <tbody>
                                <% for (int i = 0; i < preguntasRecibidasLeidas.size(); i++) {%>
                                <tr>
                                    <td><%= ObtenerUsuario.seleccionaNick(preguntasRecibidasLeidas.get(i).getRemitente())%> </td>
                                    <td><%= preguntasRecibidasLeidas.get(i).getTexto()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                        <%} else {%>
                        <h3>No hay Mensajes</h3>
                        <%}%>
                    </div>
                    <div class="tab-pane" id="op3">
                        <%if (preguntasEnviadas.size() > 0) {%>
                        <table class="table">
                            <thead><tr><th>Hacia</th><th>Texto</th></tr></thead>
                            <tbody>
                                <% for (int i = 0; i < preguntasEnviadas.size(); i++) {%>
                                <tr>
                                    <td><%= ObtenerUsuario.seleccionaNick(preguntasEnviadas.get(i).getDestinatario())%> </td>
                                    <td><%= preguntasEnviadas.get(i).getTexto()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                        <%} else {%>
                        <h3>No hay Mensajes</h3>
                        <%}%>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/view/js/jquery.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/view/js/bootstrap.js"></script>
        <script type="text/javascript">
            function validacion() {
                texto = altaPregunta.texto.value;                
                if (texto.length <= 0) {
                    formRegistro.texto.focus();
                    alert('Debes preguntar algo')
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
