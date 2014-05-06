/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import twitter4j.*;
import twitter4j.auth.AccessToken;

/**
 *
 * @author JoseAntonio
 */
public class ServletAltaAvisos extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Connection con = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            //Guardamos los datos enviados desde form
            String texto = request.getParameter("texto");
            String importancia = request.getParameter("importancia");
            int accion = 1;
            if (importancia.compareToIgnoreCase("Normal") == 0) {
                accion = 0;
            }
            Calendar c = Calendar.getInstance();
            String dia, mes, anio;
            dia = Integer.toString(c.get(Calendar.DATE));
            mes = Integer.toString(c.get(Calendar.MONTH));
            anio = Integer.toString(c.get(Calendar.YEAR));
            //Establecemos la conexion
            con = Conexion.getConexion();
            String consulta = "INSERT INTO `dbaplicacion`.`avisos` (`texto`, `importancia`, `dia`,`mes`,`anio`) VALUES ('" + texto + "', '" + accion + "', " + dia + "," + mes + "," + anio + ");";
            PreparedStatement pst = null;
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
            request.getRequestDispatcher("/view/paginas/formularios/altaAviso.jsp").forward(request, response);
            ////////////////////////////////////////////////////////////////////
            //Enviar correo si el aviso es importante y mencionar en twitter.
            List<String> emails = new ArrayList<String>();
            emails = getEmails();
            if (accion == 1) {
                try {
                    enviarEmail(emails, texto);
                } catch (AddressException ex) {
                    ex.printStackTrace();
                }
            }
            ////////////////////////////////////////////////////////////////////
            List<String> twitter = new ArrayList<String>();
            twitter = getTweets();
            if (accion == 1) {
                try {
                    enviarTweets(twitter);
                } catch (TwitterException ex) {
                    ex.printStackTrace();
                }
            }
            ///////////////////////////////////////////////////////////////////
            con.close();
            out.close();
        } catch (SQLException ex) {
            out.println(ex.toString());
        }

    }

    @Override
    public String getServletInfo() {
        return "Galathea Weather";
    }

    private void enviarEmail(List<String> emails, String texto) throws AddressException {
        try {
            Properties props = new Properties();

            // Nombre del host de correo, es smtp.gmail.com
            props.setProperty("mail.smtp.host", "smtp.gmail.com");

            // TLS si está disponible
            props.setProperty("mail.smtp.starttls.enable", "true");

            // Puerto de gmail para envio de correos
            props.setProperty("mail.smtp.port", "587");

            // Nombre del usuario
            props.setProperty("mail.smtp.user", "galatheaweather@gmail.com");

            // Si requiere o no usuario y password para conectarse.
            props.setProperty("mail.smtp.auth", "true");



            Session session = Session.getDefaultInstance(props);

            MimeMessage message = new MimeMessage(session);
            Transport t = session.getTransport("smtp");
            t.connect("galatheaweather@gmail.com", "ucav1314");

            // Quien envia el correo
            message.setFrom(new InternetAddress("galatheaweather@gmail.com"));

            for (int i = 0; i < emails.size(); i++) {
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(emails.get(i)));
                message.setSubject("Galathea Weather: AVISO - IMPORTANTE");
                message.setText("Se ha publicado el siguiente aviso de caracter importante en la web:\n     " + texto);
                t.sendMessage(message, message.getAllRecipients());
            }
            t.close();
        } catch (MessagingException ex) {
            Logger.getLogger(ServletRegistrar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private List<String> getEmails() throws SQLException {
        List<String> emails = new ArrayList<String>();
        con = Conexion.getConexion();
        String consulta = "Select * from usuario";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        rs = pst.executeQuery();
        String correo = "";
        while (rs.next()) {
            //En caso de existir una coincidencia
            //Y reemplazamos los atributos de dicho Usuario
            correo = rs.getString("email");

            if (correo != null && correo.compareTo("") != 0) {
                emails.add(correo);
            }
        }
        return emails;

    }

    private List<String> getTweets() throws SQLException {
        List<String> tweets = new ArrayList<String>();
        con = Conexion.getConexion();
        String consulta = "Select * from usuario";
        ResultSet rs = null;
        PreparedStatement pst = null;
        pst = con.prepareStatement(consulta);
        rs = pst.executeQuery();
        String tweet = "";
        while (rs.next()) {
            //En caso de existir una coincidencia
            //Y reemplazamos los atributos de dicho Usuario
            tweet = rs.getString("twitter");
            if (tweet != null && tweet.compareTo("") != 0) {
                tweets.add(tweet);
            }
        }
        return tweets;
    }

    private void enviarTweets(List<String> twitter) throws TwitterException {
        String consumer_secret = "CT1FxooApMqmh91yHJFouJPOIp26va2r5XHTWBvSsAI";
        String consumer_key = "xcMI9FV9foFLc7bvMM49Qw";
        String oauth_token = "2203481053-53dIT1WrWtxQYop4oluPV3XohyOGo3WosI8Aqrr";
        String oauth_token_secret = "fqQicvlw5sK0KCxjhGW2pkRi0RMuVMM0Rv3Wnigq7lTpS";

        TwitterFactory factory = new TwitterFactory();
        Twitter t = factory.getInstance();

        AccessToken acceso = new AccessToken(oauth_token, oauth_token_secret);

        t.setOAuthConsumer(consumer_key, consumer_secret);
        t.setOAuthAccessToken(acceso);
        Calendar calendario = Calendar.getInstance();
        int hora, minutos, segundos;
        hora = calendario.get(Calendar.HOUR_OF_DAY);
        minutos = calendario.get(Calendar.MINUTE);
        segundos = calendario.get(Calendar.SECOND);
        for (int i = 0; i < twitter.size(); i++) {
            String cuenta = twitter.get(i);
            if (!cuenta.startsWith("@")) {
                cuenta = "@" + cuenta;
            }
            Status status = t.updateStatus("Hola, " + cuenta + " hemos publicado un aviso importante. Revisa tu correo o visita la web. " + hora + ":" + minutos + ":" + segundos);
        }
    }
}
