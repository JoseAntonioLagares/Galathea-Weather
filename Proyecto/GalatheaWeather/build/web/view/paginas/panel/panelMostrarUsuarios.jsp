<%-- 
    Document   : panelMostrarUsuarios
    Created on : 21-nov-2013, 15:39:51
    Author     : JoseAntonio
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.Usuario"%>
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
            <% if (sesion.getAttribute("nick").equals("admin")) {%>   
            <h1>Usuarios</h1>
            <br/>
            <form name="nuevousuario" action="${pageContext.request.contextPath}/view/paginas/formularios/altaUsuario.jsp" method="POST">
                <input type="submit" class="btn btn-danger" value ="Nuevo Usuario">
            </form>
            <br/>
            <%
                List<Usuario> lista = ObtenerUsuario.obtenerUsuarios();
            %>

            <div>
                <ul class="nav nav-tabs" id="taps">
                    <li class="active"><a href="#op1" data-toggle="tab">Usuarios       <%if (lista.size() > 0) {%><span class="badge btn-info"><%= lista.size()%></span><%}%></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="op1">
                        <%if (lista.size() > 0) {%>
                        <table class="table table-hover">
                            <thead><tr><th>DNI</th><th>Nombre</th><th>Apellidos</th><th>Nick</th><th>E-mail</th><th>Modificar</th><th>Eliminar</th></tr></thead>
                            <tbody>
                                <% for (int i = 0; i < lista.size(); i++) {%>
                                <tr>
                                    <td><%= lista.get(i).getDni()%> </td>
                                    <td><%= lista.get(i).getNombre()%> </td>
                                    <td><%= lista.get(i).getApellido()%> </td>
                                    <td><%= lista.get(i).getNick()%> </td>
                                    <td><%= lista.get(i).getEmail()%> </td>
                                    <td align="center"><button type="button" class="btn btn-xs btn-warning" data-toggle="modal" data-target="#M<%=lista.get(i).getDni()%>" name="modificar">Modificar</button></td>
                                    <td align="center"><button type="button" class="btn btn-xs btn-danger" name="eliminar" value="Eliminar" data-toggle="modal" data-target="#E<%=lista.get(i).getDni()%>">Eliminar</button></td>
                            <form action="<%=request.getContextPath()%>/ServletBorrarUsuario" method="POST">
                                <div class="modal fade" id="E<%=lista.get(i).getDni()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">&iquest;Estas seguro?</h4>
                                            </div>
                                            <div class="modal-body">
                                                <p>&iquest;De verdad deseas borrar a <%= lista.get(i).getNombre() + " " + lista.get(i).getApellido() + " con DNI:" + lista.get(i).getDni()%>?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                <input type="submit" name="borrar" class="btn btn-danger" value="Si, deseo borrar"><input type="hidden" name="idBorrar" value="<%=lista.get(i).getDni()%>">
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                            </form> 
                            <form action="<%=request.getContextPath()%>/ServletActualizarUsuario" method="POST" name ="formRegistro" onSubmit="return validacion()">
                                <div class="modal fade" id="M<%=lista.get(i).getDni()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">Modificacion de datos de Usuario</h4>
                                            </div>
                                            <div class="modal-body">
                                                <fieldset>
                                                    <!-- Text input-->
                                                    <div class="control-group">
                                                        <label class="control-label" for="dni">DNI</label>
                                                        <div class="controls">
                                                            <input id="dni" name="dni" type="text" value="<%=lista.get(i).getDni()%>" class="input-large" disabled><input id="dni" name="dni" type="hidden" value="<%=lista.get(i).getDni()%>" required>
                                                        </div>
                                                    </div>

                                                    <!-- Text input-->
                                                    <div class="control-group">
                                                        <label class="control-label" for="nombre">Nombre</label>
                                                        <div class="controls">
                                                            <input id="nombre" name="nombre" type="text" placeholder="Nombre" class="input-large" value="<%=lista.get(i).getNombre()%>" required>
                                                        </div>
                                                    </div>

                                                    <!-- Text input-->
                                                    <div class="control-group">
                                                        <label class="control-label" for="apellidos">Apellidos</label>
                                                        <div class="controls">
                                                            <input id="apellidos" name="apellidos" type="text" placeholder="Apellidos" class="input-large" value="<%=lista.get(i).getApellido()%>" required>

                                                        </div>
                                                    </div>

                                                    <!-- Text input-->
                                                    <div class="control-group">
                                                        <label class="control-label" for="nick">Nick</label>
                                                        <div class="controls">
                                                            <input id="nick" name="nick" type="text" placeholder="Nick" class="input-large" value="<%=lista.get(i).getNick()%>" disabled>
                                                        </div>
                                                    </div>

                                                    <!-- Password input-->
                                                    <div class="control-group">
                                                        <label class="control-label" for="password">Password</label>
                                                        <div class="controls">
                                                            <input id="password" name="password" type="password" placeholder="Password" class="input-large" value="<%=lista.get(i).getPassword()%>" required>
                                                        </div>
                                                    </div>

                                                    <!-- Text input-->
                                                    <div class="control-group">
                                                        <label class="control-label" for="email">Email</label>
                                                        <div class="controls">
                                                            <input id="email" name="email" type="email" placeholder="E-mail" class="input-large" value="<%=lista.get(i).getEmail()%>" required>
                                                        </div>
                                                    </div>

                                                    <!-- Text input-->
                                                    <div class="control-group">
                                                        <label class="control-label" for="twitter">Perfil Twitter</label>
                                                        <div class="controls">
                                                            <input id="twitter" name="twitter" type="text" placeholder="Twitter" class="input-large" value="<%=lista.get(i).getTweeter()%>" required>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                <input type="submit" name="actualizar" class="btn btn-warning" value="Si, deseo actualizar"><input type="hidden" name="idBorrar" value="<%=lista.get(i).getDni()%>" onSubmit="return validacion()">
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                            </form> 
                            </tr>
                            <% }%>
                            </tbody>
                        </table>
                        <%} else {%>
                        <h3>No hay usuarios para mostrar <small>(..aplicate en el marketing y socialmedia...)</small></h3>
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
                                    valorDNI = formRegistro.dni.value;
                                    var letras = ['T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E', 'T'];
                                    if (!(/^\d{8}[A-Z]$/.test(valorDNI))) {
                                        formRegistro.dni.focus();
                                        alert('DNI incorrecto')
                                        return false;
                                    }

                                    if (valor.charAt(8) != letras[(valorDNI.substring(0, 8)) % 23]) {
                                        formRegistro.dni.focus();
                                        alert('DNI incorrecto')
                                        return false;
                                    }
                                    valorNombre = formRegistro.nombre.value;
                                    if (!(/^[a-zA-ZÒ—]*$/.test(valorNombre))) {
                                        formRegistro.nombre.focus();
                                        alert('Nombre incorrecto')
                                        return false;
                                    }
                                    valorApellidos = formRegistro.apellidos.value;
                                    if (!(/^[a-zA-ZÒ—]*$/.test(valorApellidos))) {
                                        formRegistro.apellidos.focus();

                                        alert('Apellidos incorrectos')
                                        return false;
                                    }
                                    valorEmail = formRegistro.email.value;

                                    if (!(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(valorEmail))) {
                                        formRegistro.email.focus();
                                        alert('Introduce un email valido')
                                        return false;
                                    }
                                    valorTwitter = formRegistro.twitter.value;
                                    if (!(/^[\w_]{1,18}$/.test(valorTwitter))) {
                                        formRegistro.twitter.focus();
                                        alert('Debe tener entre 1 y 18 caracteres')
                                        return false;
                                    }
                                    return true;
                                }
        </script>
    </body>
</html>