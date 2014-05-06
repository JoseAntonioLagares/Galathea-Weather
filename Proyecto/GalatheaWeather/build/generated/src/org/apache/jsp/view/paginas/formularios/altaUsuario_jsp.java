package org.apache.jsp.view.paginas.formularios;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class altaUsuario_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"en\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("    <title>Galathea Weather</title>\n");
      out.write("\n");
      out.write("    <link href=\"../css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"../css/bootstrap_weather.css\" rel=\"stylesheet\">\n");
      out.write("\t<style type=\"text/css\"></style><style type=\"text/css\"></style></head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("      <div class=\"header\">\n");
      out.write("        <ul class=\"nav nav-pills pull-right\">\n");
      out.write("          <li><a href=\"../../index.htm\">Inicio</a></li>\n");
      out.write("          <li><a href=\"./avisos.htm\">Avisos</a></li>\n");
      out.write("          <li><a href=\"./preguntas.htm\">Preguntas</a></li>\n");
      out.write("\t\t  <li><a href=\"./prediccion.htm\">El tiempo</a></li>\n");
      out.write("\t\t  <li><a href=\"./about.htm\">About</a></li>\n");
      out.write("\t\t  <li ><a class=\"btn btn-warning active\" href=\"view/paginas/registro.htm\">Login</a></li>\n");
      out.write("        </ul>\n");
      out.write("        <h3 class=\"text-muted\">Galathea Weather</h3>\n");
      out.write("      </div>\n");
      out.write("    \n");
      out.write("\n");
      out.write("      <div class=\"row marketing\">\n");
      out.write("\t\t\n");
      out.write("        \n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("      <div class=\"footer\">\n");
      out.write("        <p>Galathea Weather Â© UCAV 2013 - 2014</p>\n");
      out.write("      </div>\n");
      out.write("    </div> \n");
      out.write("</body></html>");
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
