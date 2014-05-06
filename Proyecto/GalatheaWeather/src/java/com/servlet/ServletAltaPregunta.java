/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conexion.Conexion;
import com.utils.ObtenerUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JoseAntonio
 */
public class ServletAltaPregunta extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Connection con = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            //Guardamos los datos enviados desde form
            HttpSession sesion = request.getSession(false);
            String nick = (String) sesion.getAttribute("nick");
            String usuario_remitente = ObtenerUsuario.seleccionaDNI(nick);
            String usuario_destinatario="";
            String texto = request.getParameter("texto");
            int leido = 0;
            if (nick.compareToIgnoreCase("admin") != 0) {
                usuario_destinatario = ObtenerUsuario.seleccionaDNI("admin");
            }else {
                usuario_destinatario = ObtenerUsuario.seleccionaDNI(request.getParameter("destinatario"));
                texto = request.getParameter("texto");
            }
            //Establecemos la conexion
            con = Conexion.getConexion();
            String consulta = "INSERT INTO `pregunta` (`usuario_remitente`, `usuario_destinatario`, `texto`,`leido`) VALUES ('" + usuario_remitente + "', '" + usuario_destinatario + "', '" + texto + "','" + leido + "');";
            PreparedStatement pst = null;
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
            request.getRequestDispatcher("/view/paginas/formularios/altaPregunta.jsp").forward(request, response);

            con.close();
            out.close();
        } catch (SQLException ex) {
            out.println(ex.toString());
        }
    }

    @Override
    public String getServletInfo() {
        return "Galathea Weather";
    }
}
