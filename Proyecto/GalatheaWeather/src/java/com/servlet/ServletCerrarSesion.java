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
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.Session;

/**
 *
 * @author JoseAntonio
 */
public class ServletCerrarSesion extends HttpServlet {

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

        HttpSession sesion = request.getSession(false);
        //
        sesion.setAttribute("nick", null);
        sesion.setAttribute("dni", null);
        sesion.setAttribute("nombre", null);
        sesion.removeAttribute("nick");
        sesion.removeAttribute("dni");
        sesion.removeAttribute("nombre");
        sesion.invalidate();
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Galathea Weather";
    }
}
