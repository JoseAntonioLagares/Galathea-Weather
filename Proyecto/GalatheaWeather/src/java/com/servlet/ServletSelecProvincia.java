/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JoseAntonio
 */
public class ServletSelecProvincia extends HttpServlet {
    Connection con = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        //int provincia = Integer.parseInt(request.getParameter("idProvinciaSeleccionar"));        
        request.getParameter("seleccionar").toString().split("-")[1].trim();
        request.getRequestDispatcher("/view/paginas/panel/panelControlTiempo.jsp").forward(request, response);
        out.close();

    }

    @Override
    public String getServletInfo() {
        return "Galathea Weather";
    }
}