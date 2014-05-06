/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utils;

import com.conexion.Conexion;
import com.modelo.Provincia;
import com.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JoseAntonio
 */
public class ObtenerProvincias {

    public static List<Provincia> obtenerProvincias() throws SQLException {
        Connection con = Conexion.getConexion();
        List<Provincia> lista = new ArrayList<Provincia>();
        String consulta = "Select * from provincia";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        rs = pst.executeQuery();
        String id = "";
        String nombre = "";

        Provincia p;
        while (rs.next()) {
            nombre = rs.getString("nombre");
            id = rs.getString("id");
            p = new Provincia(id, nombre);
            lista.add(p);
        }
        con.close();
        return lista;
    }

    public static String obtenerNombreProvincia(int id) throws SQLException {
        Connection con = Conexion.getConexion();
        String consulta = "Select nombre from provincia WHERE id=?";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        String nombre = "";
        while (rs.next()) {
            nombre = rs.getString("nombre");
        }
        Provincia p;
        con.close();
        return nombre;
    }

    public static int obtenerIDProvincia(String nombre) throws SQLException {
        Connection con = Conexion.getConexion();
        String consulta = "Select id from provincia WHERE nombre=?";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        pst.setString(1, nombre);
        rs = pst.executeQuery();
        int id=0;
        while (rs.next()) {
            id = rs.getInt("id");
        }
        con.close();
        return id;
    }
}
