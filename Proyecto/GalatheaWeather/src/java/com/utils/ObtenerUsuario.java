/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utils;

import com.conexion.Conexion;
import com.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author JoseAntonio
 */
public class ObtenerUsuario {

    public static String seleccionaNick(String dni) throws SQLException {
        Connection con = Conexion.getConexion();
        String consulta = "Select nick from usuario where dni=?";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        pst.setString(1, dni);
        rs = pst.executeQuery();
        String nick = "";
        while (rs.next()) {
            nick = rs.getString("nick");
        }
        con.close();
        return nick;
    }

    public static String seleccionaDNI(String nick) throws SQLException {
        Connection con = Conexion.getConexion();
        String consulta = "Select dni from usuario where nick=?";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        pst.setString(1, nick);
        rs = pst.executeQuery();
        String dni = "";
        while (rs.next()) {
            dni = rs.getString("dni");
        }
        con.close();
        return dni;
    }

    public static List<String> obtenerNick() throws SQLException {
        Connection con = Conexion.getConexion();
        List<String> lista = new ArrayList<String>();
        String s = "";
        String consulta = "Select nick from usuario";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        rs = pst.executeQuery();
        String dni = "";
        while (rs.next()) {
            s = rs.getString("nick");
            if (s.compareToIgnoreCase("admin") != 0) {
                lista.add(s);
            }

        }
        con.close();
        return lista;
    }

    public static List<Usuario> obtenerUsuarios() throws SQLException {
        Connection con = Conexion.getConexion();
        List<Usuario> lista = new ArrayList<Usuario>();
        String consulta = "Select * from usuario";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        rs = pst.executeQuery();
        String dni = "";
        String nombre = "";
        String apellido = "";
        String twitter = "";
        String nick = "";
        String password = "";
        String email = "";
        Usuario u;
        while (rs.next()) {
            nick = rs.getString("nick");
            nombre = rs.getString("nombre");
            dni = rs.getString("dni");
            apellido = rs.getString("apellidos");
            twitter = rs.getString("twitter");
            email = rs.getString("email");
            password = rs.getString("password");
            u = new Usuario(dni, nombre, apellido, nick, password, email, twitter);
            if (nick.compareToIgnoreCase("admin") != 0) {
                lista.add(u);
            }
        }
        con.close();
        return lista;
    }
}
