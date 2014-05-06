
<!DOCTYPE html>
<!--Falta validar con JS los campos del formulario y pasar a desplegable la provincia y ciudad  -->
<%@page session="true"%>
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
        <style type="text/css"></style><style type="text/css"></style></head>

    <body oncontextmenu="return false">
        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
                        <% if (sesion.getAttribute("nick") != null && sesion.getAttribute("nick").equals("admin")) {%> 
                    <li><a class="btn btn-warning active" href="${pageContext.request.contextPath}/view/paginas/panel/panelAdmin.jsp"><i class="glyphicon glyphicon-user"></i> <%=  sesion.getAttribute("nick")%></a></li>
                        <%}%>
                </ul>
                <h3 class="text-muted">Galathea Weather</h3>
            </div>
            <% if (sesion.getAttribute("nick") == null || sesion.getAttribute("nick").equals("admin")) {%>       
            <div class="row">
                <div class="col-xs-12 col-md-12"><h1>Formulario de Alta <small>Por favor, rellena el formulario</small></h1></div>
            </div>
            <div class="row">
                <div class="col-md-6 col-md-offset-3">                    
                    <form class="form-horizontal" action="<%=request.getContextPath()%>/ServletRegistrar" method="POST" align="center" name="formRegistro" onSubmit="return validacion()">
                        <fieldset>
                            <!-- Form Name -->
                            <legend>Registro de Usuario</legend>

                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="dni">DNI</label>
                                <div class="controls">
                                    <input id="dni" name="dni" type="text" placeholder="DNI" class="input-large" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="nombre">Nombre</label>
                                <div class="controls">
                                    <input id="nombre" name="nombre" type="text" placeholder="Nombre" class="input-large" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="apellidos">Apellidos</label>
                                <div class="controls">
                                    <input id="apellidos" name="apellidos" type="text" placeholder="Apellidos" class="input-large" required>

                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="nick">Nick</label>
                                <div class="controls">
                                    <input id="nick" name="nick" type="text" placeholder="Nick" class="input-large" required>
                                </div>
                            </div>

                            <!-- Password input-->
                            <div class="control-group">
                                <label class="control-label" for="password">Password</label>
                                <div class="controls">
                                    <input id="password" name="password" type="password" placeholder="Password" class="input-large" required>

                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="email">Email</label>
                                <div class="controls">
                                    <input id="email" name="email" type="email" placeholder="E-mail" class="input-large" required>

                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="twitter">Perfil Twitter</label>
                                <div class="controls">
                                    <input id="twitter" name="twitter" type="text" placeholder="Twitter" class="input-large" required>

                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <br></br>                            
                                    <p><input type="submit" class="btn btn-lg btn-success" name="login" value="REGISTRATE" ></p>
                                </div>
                            </div>
                        </fieldset>
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