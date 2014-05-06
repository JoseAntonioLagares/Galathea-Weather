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

/**
 *
 * @author JoseAntonio
 */
public class ServletAltaProvincia extends HttpServlet {

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        PrintWriter out = response.getWriter();
        try {
            //Guardamos los datos enviados desde form
            String nombre = request.getParameter("nombre");       
            //Establecemos la conexion
            con = Conexion.getConexion();
            String consulta = "INSERT INTO `dbaplicacion`.`provincia` (`nombre`) VALUES ('" + nombre + "')";
            PreparedStatement pst = null;
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
            request.getRequestDispatcher("/view/paginas/panel/panelControlTiempo.jsp").forward(request, response);
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
