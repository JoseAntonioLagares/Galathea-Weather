/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JoseAntonio
 */
public class ServletLogin extends HttpServlet {

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
            boolean existeUsuario = false;
            //Guardamos los datos enviados desde form
            String usuario = request.getParameter("nick");
            String password = request.getParameter("password");
            //Establecemos la conexion
            con = Conexion.getConexion();
            String consulta = "Select * from usuario where nick=? AND password=?";
            ResultSet rs = null;
            PreparedStatement pst = null;
            pst = con.prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, password);
            rs = pst.executeQuery();

            String nick = "";
            String dni = "";
            String nombre ="";
            
            while (rs.next()) {
                //En caso de existir una coincidencia
                existeUsuario = true;
                //Y reemplazamos los atributos de dicho Usuario
                dni = rs.getString("dni");
                nick = rs.getString("nick");
                nombre = rs.getString("nombre");
            }
            if (existeUsuario) {
                //Para el usuario existente:
                //Reemplazamos atributos que luego obtendremos desde las páginas .jsp  
                HttpSession sesion = request.getSession(false);
                sesion.setAttribute("nick", nick);
                sesion.setAttribute("dni", dni);
                sesion.setAttribute("nombre",nombre);
                request.setAttribute("nombre", nombre);
                request.setAttribute("dni", dni);
                request.setAttribute("nick", nick);
                //Mandamos estos atributos a la página bienvenida
                if (nick.compareTo("admin") != 0) {
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/view/paginas/panel/panelAdmin.jsp").forward(request, response);
                }
            } else {
                //De lo contrario vamos a 
                request.getRequestDispatcher("/view/paginas/registro.jsp").forward(request, response);
            }
            out.close();
            con.close();
        } catch (SQLException ex) {
            out.println(ex.toString());
        }
    }

    @Override
    public String getServletInfo() {
        return "Galathea Weather";
    }
}