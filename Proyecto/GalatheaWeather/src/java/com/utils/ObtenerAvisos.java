/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utils;

import com.conexion.Conexion;
import com.modelo.Avisos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 *
 * @author JoseAntonio
 */
public class ObtenerAvisos {

    public static List<Avisos> seleccionarTodosAvisos() throws SQLException {
        List<Avisos> avisos = new ArrayList<Avisos>();
        Connection con = Conexion.getConexion();
        String consulta = "Select * from avisos";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        rs = pst.executeQuery();
        String texto;
        int dia, mes, anio, id;
        boolean importancia;
        while (rs.next()) {
            texto = rs.getString("texto");
            importancia = rs.getBoolean("importancia");
            dia = Integer.parseInt(rs.getString("dia"));
            id = Integer.parseInt(rs.getString("id"));
            mes = Integer.parseInt(rs.getString("mes"));
            anio = Integer.parseInt(rs.getString("anio"));
            Avisos a = new Avisos(id, texto, importancia, dia, mes, anio);
            avisos.add(a);
        }
        if (!avisos.isEmpty()) {
            Collections.reverse(avisos);
        }
        con.close();
        return avisos;
    }
}
