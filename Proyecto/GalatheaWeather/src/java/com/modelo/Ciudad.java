/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

/**
 *
 * @author JoseAntonio
 */
public class Ciudad {
    private int id;
    private int id_provincia;
    private String nombre;

    public Ciudad(int id, int id_provincia, String nombre) {
        this.id = id;
        this.id_provincia = id_provincia;
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_provincia() {
        return id_provincia;
    }

    public void setId_provincia(int id_provincia) {
        this.id_provincia = id_provincia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }        
}
