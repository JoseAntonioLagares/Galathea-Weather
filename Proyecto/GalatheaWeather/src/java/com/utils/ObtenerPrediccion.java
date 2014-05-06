/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utils;

import com.conexion.Conexion;
import com.modelo.Prediccion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author JoseAntonio
 */
public class ObtenerPrediccion {

    public static List<Prediccion> obtenerPredicciones() throws SQLException {
        Connection con = Conexion.getConexion();
        List<Prediccion> lista = new ArrayList<Prediccion>();
        String consulta = "Select * from prediccion";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        rs = pst.executeQuery();
        int id, temmin, temmax, dia, mes, anio, provincia;
        String estado = "";

        Prediccion p;
        while (rs.next()) {

            id = rs.getInt("id");
            temmin = rs.getInt("temmin");
            temmax = rs.getInt("temmax");
            provincia = rs.getInt("provincia");
            dia = rs.getInt("dia");
            mes = rs.getInt("mes");
            anio = rs.getInt("anio");
            p = new Prediccion(id, estado, temmin, temmax, provincia, dia, mes, anio);
            lista.add(p);
        }
        con.close();
        return lista;
    }

    public static List<Prediccion> obtenerPredicciones(int idProvincia) throws SQLException {
        Connection con = Conexion.getConexion();
        List<Prediccion> lista = new ArrayList<Prediccion>();
        String consulta = "Select * from `prediccion` WHERE `idprovincia` = ?";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        pst.setInt(1, idProvincia);
        rs = pst.executeQuery();
        int id, temmin, temmax, dia, mes, anio, provincia;
        String estado = "";
        Prediccion p;
        while (rs.next()) {
            id = rs.getInt("id");
            temmin = rs.getInt("temmin");
            temmax = rs.getInt("temmax");
            provincia = rs.getInt("idprovincia");
            estado = rs.getString("estado");
            dia = rs.getInt("dia");
            mes = rs.getInt("mes");
            anio = rs.getInt("anio");
            p = new Prediccion(id, estado, temmin, temmax, provincia, dia, mes, anio);
            lista.add(p);
        }
        con.close();
        return lista;
    }

    public static List<Prediccion> filtrar(List<Prediccion> listaPredicciones, int numero) {
        List<Prediccion> lista = listaPredicciones;
        List<Prediccion> listaSeleccioandas = new ArrayList<Prediccion>();
        Calendar c = Calendar.getInstance();
        String dia, mes, anio;
        dia = Integer.toString(c.get(Calendar.DATE));
        mes = Integer.toString(c.get(Calendar.MONTH));
        anio = Integer.toString(c.get(Calendar.YEAR));
        int contadorMax = numero;
        if (lista.size() >= contadorMax) {
            lista = ordenarFechas(lista);
            int indice = indiceDiaMasCercanoActual(lista, Integer.parseInt(dia), Integer.parseInt(mes), Integer.parseInt(anio));
            listaSeleccioandas.add(lista.get(indice - 1));
            for (int i = 0; i < (contadorMax - 2); i++) {
                listaSeleccioandas.add(lista.get(indice + i));
            }
        } else {
            listaSeleccioandas = lista;
        }
        Collections.reverse(lista);
        return listaSeleccioandas;
    }

    private static List<Prediccion> ordenarFechas(List<Prediccion> lista) {
        Prediccion aux;
        for (int i = 1; i < lista.size(); i++) {
            for (int j = 0; j < lista.size() - 2; j++) {
                if (lista.get(j).getAnio() > lista.get(j + 1).getAnio() && lista.get(j).getMes() > lista.get(j + 1).getMes() && lista.get(j).getDia() > lista.get(j + 1).getDia()) {
                    aux = lista.get(j);
                    lista.set(j, lista.get(j + 1));
                    lista.set(j + 1, aux);
                }
            }
        }
        return lista;
    }

    private static int indiceDiaMasCercanoActual(List<Prediccion> lista, int dia, int mes, int anio) {
        int indice = 0;
        boolean encontrado = false;

        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getAnio() == anio) {
                if (lista.get(i).getMes() == mes) {
                    if (lista.get(i).getDia() == dia) {
                        indice = i;
                        encontrado = true;
                        break;
                    }
                }
            }
        }
        if (!encontrado) {
            List<Prediccion> list = lista;
            Prediccion p = new Prediccion(0, "", 0, 0, 0, dia, mes, anio);
            list.add(p);
            list = ordenarFechas(lista);
            for (int i = 0; i < lista.size(); i++) {
                if (lista.get(i).getAnio() == anio) {
                    if (lista.get(i).getMes() == mes) {
                        if (lista.get(i).getDia() == dia) {
                            indice = i;
                            encontrado = true;
                            break;
                        }
                    }
                }
            }
            indice = indice - 1;
            if (indice < 0) {
                indice = 0;
            }
        }
        return indice;
    }
}
