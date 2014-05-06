/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conexion.Conexion;
import com.utils.ObtenerProvincias;
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
public class ServletAltaPrediccion extends HttpServlet {

    Connection con = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            con = Conexion.getConexion();
            int idProvincia = ObtenerProvincias.obtenerIDProvincia(request.getParameter("provinciaNuevaPrediccion"));
            int dia = Integer.parseInt(request.getParameter("fechaNuevaPrediccion").split("-")[0]);
            int mes = Integer.parseInt(request.getParameter("fechaNuevaPrediccion").split("-")[1]);
            int anio = Integer.parseInt(request.getParameter("fechaNuevaPrediccion").split("-")[2]);
            int temmin = Integer.parseInt(request.getParameter("temminNuevaPrediccion"));
            int temmax = Integer.parseInt(request.getParameter("temmaxNuevaPrediccion"));
            String estado = request.getParameter("estadoNuevaPrediccion").toString();
            String consulta = "INSERT INTO `prediccion` (`estado`, `temmin`, `temmax`, `idprovincia`, `dia`, `mes`, `anio`) VALUES (?,?,?,?,?,?,?);";
            PreparedStatement pst = null;
            pst = con.prepareStatement(consulta);
            pst.setString(1, estado);
            pst.setInt(2,temmin);
            pst.setInt(3,temmax);
            pst.setInt(4,idProvincia);
            pst.setInt(5,dia);
            pst.setInt(6,mes);
            pst.setInt(7,anio);          
            pst.executeUpdate();
            request.getRequestDispatcher("view/paginas/panel/panelControlTiempo.jsp").forward(request, response);
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
