/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.security.AuthProvider;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author lenovo
 */
public class Email {

    static final String from = "dangvinhxuanhai3@gmail.com";
    static final String password = "selt axsd khaf jdoe";

    public static boolean SendEmail(String to,String tieude, String noidung){

        //properties:
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP host
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        //phien lam viec
        Session session = Session.getInstance(props, auth);

        //gui email
        MimeMessage msg = new MimeMessage(session);
        try {
            //kieu noi dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            //nguoi gui
            msg.setFrom(from);
            //nguoi nhan
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //tieu de email
            msg.setSubject(tieude+" "+System.currentTimeMillis());
            //quy dinh ngay gui
            msg.setSentDate(new Date());
            //quy dinh email nhan phan hoi
            //msg.setReplyTo(InternetAddress.parse(form,false));
            //noi dung
            msg.setContent(noidung,"text/HTML; charset=UTF-8");

            //gui email
            Transport.send(msg);
            return true;
        } catch (MessagingException ex) {
            return false;
        }
    }

    public static void main(String[] args) {
        Email.SendEmail("dangvinhxuanhai@gmail.com","test mail", "day la noi dunggggggg");
    }
}
