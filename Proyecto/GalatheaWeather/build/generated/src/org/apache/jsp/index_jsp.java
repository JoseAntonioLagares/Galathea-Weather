package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html lang=\"en\">\n");
      out.write("    ");
 HttpSession sesion = request.getSession(false);
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("        <title>Galathea Weather</title>\n");
      out.write("\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/view/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/view/css/bootstrap_weather.css\" rel=\"stylesheet\">\n");
      out.write("        <style type=\"text/css\"></style><style type=\"text/css\"></style></head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"header\">\n");
      out.write("                <ul class=\"nav nav-pills pull-right\">\n");
      out.write("                    <li class=\"active\"><a href=\"index.jsp\">Inicio</a></li>\n");
      out.write("                    <li><a href=\"view/paginas/prediccion.jsp\">El tiempo</a></li>\n");
      out.write("                    <li><a href=\"view/paginas/about.jsp\">About</a></li>                    \n");
      out.write("                        ");
 if (sesion.getAttribute("nick") != null) {
                                if (!sesion.getAttribute("nick").equals("admin")) {
                        
      out.write(" \n");
      out.write("                    <li><a class=\"btn btn-warning\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/view/paginas/prediccion.jsp\"><i class=\"glyphicon glyphicon-user\"></i> ");
      out.print(  sesion.getAttribute("nick"));
      out.write("</a></li>\n");
      out.write("                        ");
 } else {
      out.write("\n");
      out.write("                    <li><a class=\"btn btn-warning active\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/view/paginas/panel/panelAdmin.jsp\"><i class=\"glyphicon glyphicon-user\"></i> ");
      out.print(  sesion.getAttribute("nick"));
      out.write("</a></li>\n");
      out.write("                        ");
 }
                        } else {
      out.write("\n");
      out.write("                    <li><a class=\"btn btn-warning active\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/view/paginas/registro.jsp\"><i class=\"glyphicon glyphicon-user\"></i> Login</a></li>\n");
      out.write("                        ");
 }
      out.write(" \n");
      out.write("                </ul>\n");
      out.write("                <h3 class=\"text-muted\">Galathea Weather</h3>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"jumbotron\">\n");
      out.write("                ");
 if (sesion.getAttribute("nick") == null) {
      out.write(" \n");
      out.write("                <h1>El tiempo en tu zona</h1>\n");
      out.write("                <p class=\"lead\">Esta aplicaci&oacute;n le permite conocer el tiempo en provincias y localidades. Adem&aacute;s para disfrutar de m&uacute;ltiples ventajas, debe registrarse. <p>\n");
      out.write("                <p><a class=\"btn btn-lg btn-success\" href=\"view/paginas/registro.jsp\" role=\"button\">&iexcl;Entra YA!</a></p>\n");
      out.write("                ");
} else {
      out.write("\n");
      out.write("                <h1>");
      out.print(  sesion.getAttribute("nombre"));
      out.write("</h1>\n");
      out.write("                <p class=\"lead\">Ya puedes empezar a disfrutar de las ventajas que ofrece la mejor web del tiempo. <p>\n");
      out.write("                <p><a class=\"btn btn-lg btn-success\" href=\"view/paginas/prediccion.jsp\" role=\"button\">&iexcl;Disfruta de las ventajas!</a></p>               \n");
      out.write("                <p class=\"lead\">En caso de que ya no nos quieras :'( ...tambi&eacute;n puedes salir...<p>\n");
      out.write("                <form class=\"form-horizontal\" action=\"");
      out.print(request.getContextPath());
      out.write("/ServletCerrarSesion\" method=\"POST\">\n");
      out.write("                    <div class=\"control-group\">\n");
      out.write("                        <div class=\"controls\">\n");
      out.write("                            <p><input type=\"submit\" class=\"btn btn-lg btn-danger\" name=\"salir\" value=\"Salir\"/></p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>    \n");
      out.write("                </form>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row marketing\">\n");
      out.write("                <div class=\"col-lg-6\">\n");
      out.write("                    <h4>Predicci&oacute;n del tiempo</h4>\n");
      out.write("                    <p>Conozca de primera mano las distintas predicciones para su hubicaci&oacute;n.</p>\n");
      out.write("                    ");
 if (sesion.getAttribute("nick") == null) {
      out.write(" \n");
      out.write("                    <p><a class=\"btn btn-primary\" href=\"view/paginas/registro.jsp\">Ver Detalles ></a></p>\n");
      out.write("                    ");
} else {
      out.write("\n");
      out.write("                    <p><a class=\"btn btn-primary\" href=\"view/paginas/prediccion.jsp\">Ver Detalles ></a></p>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                    <h4>Avisos</h4>\n");
      out.write("                    <p>Si Ud. es un usuario registrado peude recibir avisos de las &uacute;ltimas noticias emitidas.</p>\n");
      out.write("                    ");
 if (sesion.getAttribute("nick") == null) {
      out.write(" \n");
      out.write("                    <p><a class=\"btn btn-primary\" href=\"view/paginas/registro.jsp\">Ver Detalles ></a></p>\n");
      out.write("                    ");
} else {
      out.write("\n");
      out.write("                    <p><a class=\"btn btn-primary\" href=\"view/paginas/avisos.jsp\">Ver Detalles ></a></p>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-6\">\n");
      out.write("                    <h4>Preguntas</h4>\n");
      out.write("                    <p>Si Ud. tiene alguna duda, Galathea Weather le ofrece un servicio para enviar preguntas.</p>\n");
      out.write("                    ");
 if (sesion.getAttribute("nick") == null) {
      out.write(" \n");
      out.write("                    <p><a class=\"btn btn-primary\" href=\"view/paginas/registro.jsp\">Ver Detalles ></a></p>\n");
      out.write("                    ");
} else {
      out.write("\n");
      out.write("                    <p><a class=\"btn btn-primary\" href=\"view/paginas/preguntas.jsp\">Ver Detalles ></a></p>\n");
      out.write("                    ");
}
      out.write("\t\n");
      out.write("\n");
      out.write("                    <h4>Sobre el equipo</h4>\n");
      out.write("                    <p>Consulte nuestro perfil en la secci&oacute;n de <a href=\"view/paginas/about.jsp\">about</a></p>\n");
      out.write("                    <p><a class=\"btn btn-primary\" href=\"view/paginas/about.jsp\">Ver Detalles ></a></p>\t\t\t  \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"footer\">\n");
      out.write("                <p>Galathea Weather &copy; UCAV 2013 - 2014</p>\n");
      out.write("            </div>\n");
      out.write("        </div> \n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
