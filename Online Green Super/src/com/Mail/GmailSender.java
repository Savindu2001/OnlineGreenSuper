package com.Mail;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class GmailSender {
    public static void sendEmail(String toEmail, String subject, String messageText)  {
        final String username = "groupgreensuper@gmail.com"; 
        final String password = "epsv vhxj zggp xffo"; 

        // Set up the properties for the mail server
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Create a mail session with the specified properties
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create a default MimeMessage object
            Message message = new MimeMessage(session);

            // Set the sender and recipient addresses
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(messageText);

            // Send the message
            Transport.send(message);
        } catch (MessagingException e) {
            // Handle the exception (e.g., log it or throw a runtime exception)
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}


/**
 Savindu senanayake 
**/
