package entity;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.UUID;

public class resetService {
    private final int LIMIT_MINUS = 20;
    private final String from = "thithaovan060104@gmail.com";
    private final String password = "djpvlziiuerasfrk";

    public String generateToken(){
        return UUID.randomUUID().toString();
    }
    public LocalDateTime expireDateTime(){
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }
    public boolean isExpireTime(LocalDateTime time){
        return LocalDateTime.now().isAfter(time);
    }
    public boolean sendEmail(String to, String linkReset, String name){
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });


        MimeMessage msg = new MimeMessage(session);

        try {
            msg.addHeader("Content-Type", "text/html; charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject("Reset Password", "UTF-8");
            String content = "<h1>Hello" + name + "</h1>" + "<p>Click the link to reset password"
                    + "<a href=" + linkReset + ">Click here</a></p>";
            msg.setContent(content, "text/html; charset=UTF-8");
            Transport.send(msg);
            return true;
        } catch (Exception e) {
            System.out.println("Send error");
            System.out.println(e);
            return false;
        }
    }
}
