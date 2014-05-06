/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utils;

import com.conexion.Conexion;
import com.modelo.Pregunta;
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
public class ObtenerPreguntas {

    public static List<Pregunta> seleccionarPreguntasRecibidas(String dni) throws SQLException {
        List<Pregunta> preguntas = new ArrayList<Pregunta>();
        Connection con = Conexion.getConexion();
        String consulta = "SELECT * FROM `pregunta` WHERE `usuario_destinatario`=? AND `leido` = 1";
        ResultSet rs;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        pst.setString(1, dni);
        rs = pst.executeQuery();
        String dni_remitente, dni_destinatario, texto;
        int id;
        boolean leido;
        while (rs.next()) {
            texto = rs.getString("texto");
            leido = rs.getBoolean("leido");
            id = rs.getInt("id");
            dni_remitente = rs.getString("usuario_remitente");
            dni_destinatario = rs.getString("usuario_destinatario");
            Pregunta p = new Pregunta(id, dni_remitente, dni_destinatario, texto, leido);
            preguntas.add(p);
        }
        if (!preguntas.isEmpty()) {
            Collections.reverse(preguntas);
        }
        con.close();
        return preguntas;
    }

    public static List<Pregunta> seleccionarPreguntasRecibidasNoLeidas(String dni) throws SQLException {
        List<Pregunta> preguntas = new ArrayList<Pregunta>();
        Connection con = Conexion.getConexion();
        String consulta = "SELECT * FROM `pregunta` WHERE `leido` = 0 and `usuario_destinatario`=?";
        ResultSet rs;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        pst.setString(1, dni);
        rs = pst.executeQuery();
        String dni_remitente, dni_destinatario, texto;
        int id;
        boolean leido;
        while (rs.next()) {
            texto = rs.getString("texto");
            leido = rs.getBoolean("leido");
            id = rs.getInt("id");
            dni_remitente = rs.getString("usuario_remitente");
            dni_destinatario = rs.getString("usuario_destinatario");
            Pregunta p = new Pregunta(id, dni_remitente, dni_destinatario, texto, leido);
            preguntas.add(p);
        }
        if (!preguntas.isEmpty()) {
            Collections.reverse(preguntas);
        }
        con.close();
        return preguntas;
    }

    public static List<Pregunta> seleccionarPreguntasEnviadas(String dni) throws SQLException {
        List<Pregunta> preguntas = new ArrayList<Pregunta>();
        Connection con = Conexion.getConexion();
        String consulta = "SELECT * FROM `pregunta` WHERE `usuario_remitente`=?";
        ResultSet rs;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        pst.setString(1, dni);
        rs = pst.executeQuery();
        String dni_remitente, dni_destinatario, texto;
        int id;
        boolean leido;
        while (rs.next()) {
            texto = rs.getString("texto");
            leido = rs.getBoolean("leido");
            id = rs.getInt("id");
            dni_remitente = rs.getString("usuario_remitente");
            dni_destinatario = rs.getString("usuario_destinatario");
            Pregunta p = new Pregunta(id, dni_remitente, dni_destinatario, texto, leido);
            preguntas.add(p);
        }
        if (!preguntas.isEmpty()) {
            Collections.reverse(preguntas);
        }
        con.close();
        return preguntas;
    }

    public static void marcarComoLeida(String id) throws SQLException {
        Connection con = Conexion.getConexion();
        String consulta = "UPDATE `pregunta` SET `leido`= 1 WHERE `id` = ?";
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        pst.setString(1, id);
        pst.executeUpdate();
    }
}
