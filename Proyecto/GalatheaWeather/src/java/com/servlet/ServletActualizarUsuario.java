/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conexion.Conexion;
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
public class ServletActualizarUsuario extends HttpServlet {

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
            String dni = request.getParameter("dni");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String twitter = request.getParameter("twitter");
            if (!twitter.startsWith("@")) {
                twitter = "@" + twitter;
            }
            //Establecemos la conexion
            con = Conexion.getConexion();
            String consulta = "UPDATE `dbaplicacion`.`usuario` SET `nombre` = '" + nombre + "', `apellidos` = '" + apellidos + "', `password` = '" + password + "', `email` = '" + email + "', `twitter` = '" + twitter + "' WHERE dni = '" + dni + "'";
            PreparedStatement pst = null;
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
            //Mandamos estos atributos a la página bienvenida
            request.getRequestDispatcher("/view/paginas/panel/panelMostrarUsuarios.jsp").forward(request, response);
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