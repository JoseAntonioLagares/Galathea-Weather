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
public class ServletModificarProvincias extends HttpServlet {

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
            con = Conexion.getConexion();
            int id = Integer.parseInt(request.getParameter("idActualizar"));
            String nombre = request.getParameter("nombreProActualizar");
            String consulta = "UPDATE `provincia` SET `nombre`= '"+nombre+"' WHERE `id` = ?";
            PreparedStatement pst = null;
            pst = con.prepareStatement(consulta);
            pst.setInt(1, id);
            pst.executeUpdate();
            request.getRequestDispatcher("/view/paginas/panel/panelControlTiempo.jsp").forward(request, response);
            con.close();
            out.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Galathea Weather";
    }
}
