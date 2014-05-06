<%-- 
    Document   : preguntas
    Created on : 19-nov-2013, 23:46:44
    Author     : JoseAntonio
--%>
<%@page import="com.utils.ObtenerPrediccion"%>
<%@page import="com.modelo.Prediccion"%>
<%@page import="com.modelo.Provincia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.utils.ObtenerProvincias"%>
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
        <link href="${pageContext.request.contextPath}/view/css/bootstrap calendario.css" rel="stylesheet">
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
            <h1>El Tiempo</h1>
            <br/>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#nuevaprediccion">Nueva Predicci&oacute;n</button>
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#nuevaprovincia">Nueva Provincia</button>
            <br/><br/>
            <%
                List<Provincia> listaProvincias = ObtenerProvincias.obtenerProvincias();

            %>
            <div class="modal fade" id="nuevaprediccion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form class="form-horizontal" action="<%=request.getContextPath()%>/ServletAltaPrediccion" method="POST">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">Nueva Predicci&oacute;n</h4>
                            </div>
                            <div class="modal-body">
                                <!--Nueva prediccion -->
                                <div class="control-group">
                                    <label class="control-label" for="provincias">Provincia</label>
                                    <div class="controls">
                                        <select id="provincias" name="provinciaNuevaPrediccion" class="input-large" required>
                                            <% for (int i = 0; i < listaProvincias.size(); i++) {%>
                                            <option><%=listaProvincias.get(i).getNombre()%></option>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <!-- Select Basic -->
                                    <label class="control-label" for="fecha">Fecha</label>
                                    <div id="datetimepicker4" class="input-append">
                                        <input data-format="dd-MM-yyyy" type="text" name="fechaNuevaPrediccion" required></input>
                                        <span class="add-on">
                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                                            </i>
                                        </span>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="control-group">
                                    <label class="control-label" for="estado">Estado del cielo</label>
                                    <div class="controls">
                                        <select id="estado" name="estadoNuevaPrediccion" class="input-large" required>
                                            <option>Nublado</option>
                                            <option>Soleado</option>
                                            <option>Lluvioso</option>
                                            <option>Nieve</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="temmax">Temperatura Maxima</label>
                                    <div class="controls">
                                        <input id="temmax" name="temmaxNuevaPrediccion" type="number" placeholder="Temperatura m&aacute;xima" class="input-large" required>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="temmin">Temperatura Minima</label>
                                    <div class="controls">
                                        <input id="temmin" name="temminNuevaPrediccion" type="number" placeholder="Temperatura m&iacute;nima" class="input-large" required>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <input type="submit" class="btn btn-danger" name="enviar" value="A&ntilde;adir"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="nuevaprovincia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form class="form-horizontal" action="<%=request.getContextPath()%>/ServletAltaProvincia" method="POST">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">Nueva Provincia</h4>
                            </div>
                            <div class="modal-body">
                                <div class="control-group">
                                    <label class="control-label" for="Nombre">Nombre de la provincia</label>
                                    <div class="controls">
                                        <input id="Nombre" name="nombre" type="text" placeholder="Nombre de la provincia" class="input-large" required>
                                    </div>
                                </div>           
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <input type="submit" class="btn btn-info" name="enviar" value="A&ntilde;adir"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <div>
                <ul class="nav nav-tabs" id="taps">
                    <li class="active"><a href="#op0" data-toggle="tab">Selec. Provincias</a></li>
                        <%
                            String idSeleccionar;
                            String provincia;
                            int id;
                            if (request.getParameter("seleccionar") != null) {
                                idSeleccionar = request.getParameter("seleccionar").toString().split("-")[1].trim();
                        %>
                    <li><a href = "#op1" data-toggle = "tab" >Predicciones</a></li>
                        <%} else {
                            idSeleccionar = "0";
                        %>
                        <% }%>
                    <li><a href="#op2" data-toggle="tab">Gest. Provincias</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="op0">
                        <% if (listaProvincias.size() > 0) {%>
                        <form action="<%=request.getContextPath()%>/ServletSelecProvincia" method="POST">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Seleccionar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (int i = 0; i < listaProvincias.size(); i++) {%>
                                    <tr>
                                        <td><%= listaProvincias.get(i).getNombre()%> </td>
                                        <td><input type="submit" class="btn btn-xs btn-default" name="seleccionar" value="Seleccionar - <%=listaProvincias.get(i).getNombre()%>"></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </form>
                        <%} else {%>
                        <h3>No hay provincias</h3>
                        <% }%>
                    </div>
                    <%
                        List<Prediccion> predicciones;
                        id = ObtenerProvincias.obtenerIDProvincia(idSeleccionar);
                        provincia = idSeleccionar;
                        predicciones = ObtenerPrediccion.obtenerPredicciones(id);
                    %>
                    <div class="tab-pane" id="op1">
                        <%if (predicciones.size() > 0) {%>
                        <table class="table">
                            <thead><tr><th>Provincia</th><th>Fecha</th><th>Estado</th><th>Temp. Min.</th><th>Temp. Max.</th><th>Modificar</th><th>Eliminar</th></tr></thead>
                            <tbody>
                                <% for (int i = 0; i < predicciones.size(); i++) {%>
                                <tr>
                                    <td><%= provincia%></td>
                                    <td><%= predicciones.get(i).getDia() + "/" + predicciones.get(i).getMes() + "/" + predicciones.get(i).getAnio()%> </td>
                                    <td><%= predicciones.get(i).getEstado()%> </td>
                                    <td><%= predicciones.get(i).getTemMin()%> </td>
                                    <td><%= predicciones.get(i).getTemMax()%> </td>
                                    <td><button type="button" class="btn btn-xs btn-warning" data-toggle="modal" data-target="#MPRE<%=predicciones.get(i).getId()%>" name="modificar">Modificar</button></td>
                                    <td><button type="button" class="btn btn-xs btn-danger" name="eliminar" value="Eliminar" data-toggle="modal" data-target="#EPRE<%=predicciones.get(i).getId()%>">Eliminar</button></td>

                            <div class="modal fade" id="MPRE<%=predicciones.get(i).getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form class="form-horizontal" action="<%=request.getContextPath()%>/ServletModificarPrediccion" method="POST">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">Modificar Predicci&oacute;n - <%=provincia + " " + predicciones.get(i).getDia() + "/" + predicciones.get(i).getMes() + "/" + predicciones.get(i).getAnio()%></h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="control-group">
                                                    <label class="control-label" for="estado">Estado del cielo</label>
                                                    <div class="controls">
                                                        <select id="estado" name="estadoPreddiconModificar" class="input-large">
                                                            <option>Nublado</option>
                                                            <option>Soleado</option>
                                                            <option>Lluvioso</option>
                                                            <option>Nieve</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <!-- Text input-->
                                                <div class="control-group">
                                                    <label class="control-label" for="temmax">Temperatura Maxima</label>
                                                    <div class="controls">
                                                        <input id="temmax" name="temmaxPreddiconModificar" type="number" placeholder="Temperatura m&aacute;xima" class="input-large"value="<%=predicciones.get(i).getTemMax()%>" required>
                                                    </div>
                                                </div>

                                                <!-- Text input-->
                                                <div class="control-group">
                                                    <label class="control-label" for="temmin">Temperatura Minima</label>
                                                    <div class="controls">
                                                        <input id="temmin" name="temminPreddiconModificar" type="number" placeholder="Temperatura m&iacute;nima" class="input-large" value="<%=predicciones.get(i).getTemMin()%>" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                <input type="submit" class="btn btn-warning" name="enviar" value="Modificar"/>
                                                <input type="hidden" name="idPrediccionModificar" value="<%=predicciones.get(i).getId()%>">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="modal fade" id="EPRE<%=predicciones.get(i).getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form class="form-horizontal" action="<%=request.getContextPath()%>/ServletEliminarPrediccion" method="POST">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">Eliminar Predicci&oacute;n</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>&iquest;Desea eliminar la predicci&oacute;n?</p>           
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        <input type="submit" class="btn btn-danger" name="enviar" value="Eliminar"/> <input type="hidden" name="idBorrar" value="<%=predicciones.get(i).getId()%>"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    </tr>
                    <% }%>
                    </tbody>
                    </table>

                    <%} else {%>
                    <h3>No hay predicciones</h3>
                    <%}%>
                </div>
                <div class="tab-pane" id="op2">
                    <%if (listaProvincias.size() > 0) {%>
                    <table class="table">
                        <thead><tr><th>Nombre</th><th>Modificar</th><th>Eliminar</th></tr></thead>
                        <tbody>
                            <% for (int i = 0; i < listaProvincias.size(); i++) {%>
                            <tr>
                                <td><%= listaProvincias.get(i).getNombre()%> </td>
                                <td ><button type="button" class="btn btn-xs btn-warning" data-toggle="modal" data-target="#MPRO<%=listaProvincias.get(i).getId()%>" name="modificar">Modificar</button></td>
                                <td ><button type="button" class="btn btn-xs btn-danger" name="eliminar" value="Eliminar" data-toggle="modal" data-target="#EPRO<%=listaProvincias.get(i).getId()%>">Eliminar</button></td>
                        <form action="<%=request.getContextPath()%>/ServletModificarProvincias" method="POST">
                            <div class="modal fade" id="MPRO<%= listaProvincias.get(i).getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Modificar provincia</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="control-group">
                                                <label class="control-label" for="Nombre">Nombre</label>
                                                <div class="controls">
                                                    <input id="Nombre" name="nombreProActualizar" type="text" placeholder="Nombre de la provicia" class="input-large" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            <input type="submit" name="actualizar" class="btn btn-warning" value="Si, deseo actualizar"><input type="hidden" name="idActualizar" value="<%= listaProvincias.get(i).getId()%>">
                                        </div>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </form> 
                        <form action="<%=request.getContextPath()%>/ServletEliminarProvincias" method="POST">
                            <div class="modal fade" id="EPRO<%= listaProvincias.get(i).getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Eliminar provincia</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>&iquest;De verdad deseas borrar esta provincia?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            <input type="submit" name="borrar" class="btn btn-danger" value="Si, deseo borrar"><input type="hidden" name="idBorrar" value="<%= listaProvincias.get(i).getId()%>">
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
                    <h3>No hay provincias</h3>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/view/js/calendario.js"></script>
    <script type="text/javascript">
        $(function() {
            $('#datetimepicker4').datetimepicker({
                pickTime: true
            });
        });
    </script>
</body>
</html>
