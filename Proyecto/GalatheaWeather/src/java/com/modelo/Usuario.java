/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

/**
 *
 * @author JoseAntonio
 */
public class Usuario {
    private String dni;
    private String nombre;
    private String apellido;
    private String nick;
    private String password;
    private String email;
    private String tweeter;

    public Usuario(String dni, String nombre, String apellido, String nick, String password, String email, String tweeter) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nick = nick;
        this.password = password;
        this.email = email;
        this.tweeter = tweeter;
 
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTweeter() {
        return tweeter;
    }

    public void setTweeter(String tweeter) {
        this.tweeter = tweeter;
    }
  
}
