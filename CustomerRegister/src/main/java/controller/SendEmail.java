package controller;

import java.io.IOException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail 
{
    public static void send(String mail,String name) throws IOException
    {

        String to = mail;
        String text = "Hello, "+name+"\n\n"+
            "You have successfully registered to the Customer Web Application of Goutam Niwal.\n"+"Thank you for Registering \n"
                +"Regards : \n"+"Goutam Niwal";

        try {
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.socketFactory.port", "465");
            properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.port", "465");

            final String fromMail = "niwalgoutam@gmail.com";
            final String password = "sumidphwwondkakt";

            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromMail, password);
                }
            });         session.getDebug();
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.setSubject("Registration Successful !!");
            message.setText(text);
            Transport.send(message);
            System.out.println("Mail Sent !");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    public static void sendOTP(String mail,String otp) throws IOException
    {
        String to = mail;
        String text = "Your OTP is : "+otp+"\n\n"+
                "Use This Otp to reset your password \n";

        try {
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.socketFactory.port", "465");
            properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.port", "465");

            final String fromMail = "niwalgoutam@gmail.com";
            final String password = "sumidphwwondkakt";

            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromMail, password);
                }
            });         session.getDebug();
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.setSubject("Registration Successful !!");
            message.setText(text);
            Transport.send(message);
            System.out.println("Mail Sent !");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
