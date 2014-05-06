/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JoseAntonio
 */
public class Conexion {

    private static Connection cn = null;
    private static String URL = "jdbc:mysql://localhost:3306/DBAplicacion";
    private static String usuario = "root";
    private static String contrasena = "";
    
    public static Connection getConexion() throws SQLException {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        cn = DriverManager.getConnection(URL, usuario, contrasena);
        return cn;
    }
    //Desconectar a la Base de datos
    public void desconectar() throws SQLException, ClassNotFoundException{
        cn.close();
    }
    
}
