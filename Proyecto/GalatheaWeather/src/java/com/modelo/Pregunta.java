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
public class Pregunta {
    private int id;
    private String remitente,destinatario,texto;
    private boolean leido;

    public Pregunta(int id, String remitente, String destinatario, String texto, boolean leido) {
        this.id = id;
        this.remitente = remitente;
        this.destinatario = destinatario;
        this.texto = texto;
        this.leido = leido;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRemitente() {
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public boolean isLeido() {
        return leido;
    }

    public void setLeido(boolean leido) {
        this.leido = leido;
    }

    
    
}
