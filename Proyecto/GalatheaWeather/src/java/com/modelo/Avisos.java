/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import java.util.Date;

/**
 *
 * @author JoseAntonio
 */
public class Avisos {

    private int id;
    private String texto;
    private boolean importancia;
    private int dia, mes, anio;

    public Avisos(int id, String texto, boolean importancia, int dia, int mes, int anio) {
        this.id = id;
        this.texto = texto;
        this.importancia = importancia;
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
    }

    public int getId() {
        return id;
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
    
    public void setId(int id) {
        this.id = id;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public boolean isImportancia() {
        return importancia;
    }

    public void setImportancia(boolean importancia) {
        this.importancia = importancia;
    }

}
