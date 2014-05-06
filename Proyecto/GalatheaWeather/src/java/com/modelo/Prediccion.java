/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

/**
 *
 * @author JoseAntonio
 */
public class Prediccion{
    private int id;
    private String estado;
    private int temMin;
    private int temMax;
    private int idProvincia;
    private int dia;
    private int mes;
    private int anio;

    public Prediccion(int id, String estado, int temMin, int temMax, int idProvincia, int dia, int mes, int anio) {
        this.id = id;
        this.estado = estado;
        this.temMin = temMin;
        this.temMax = temMax;
        this.idProvincia = idProvincia;
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getTemMin() {
        return temMin;
    }

    public void setTemMin(int temMin) {
        this.temMin = temMin;
    }

    public int getTemMax() {
        return temMax;
    }

    public void setTemMax(int temMax) {
        this.temMax = temMax;
    }

    public int getIdProvincia() {
        return idProvincia;
    }

    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }  

    @Override
    public int hashCode() {
        int hash = 5;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Prediccion other = (Prediccion) obj;
        return true;
    } 
    
}
