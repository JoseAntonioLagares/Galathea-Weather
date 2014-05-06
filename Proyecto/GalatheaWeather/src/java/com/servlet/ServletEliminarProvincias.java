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
public class ServletEliminarProvincias extends HttpServlet {

    Connection con = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            int id = Integer.parseInt(request.getParameter("idBorrar"));
            con = Conexion.getConexion();
            String consulta = "DELETE FROM `provincia` WHERE `id`=?";
            PreparedStatement pst = null;
            pst = con.prepareStatement(consulta);
            pst.setInt(1, id);
            pst.executeUpdate();
            request.getRequestDispatcher("/view/paginas/panel/panelControlTiempo.jsp").forward(request, response);
            out.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    @Override
    public String getServletInfo() {
        return "Galathea Weather";
    }
}
