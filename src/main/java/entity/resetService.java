package entity;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

public class resetService {
    private final int LIMIT_MINUS = 20;
    private final String from = "thithaovan060104@gmail.com";
    private final String password = "djpvlziiuerasfrk";

    public String generateToken() {
        return UUID.randomUUID().toString();
    }

    public LocalDateTime expireDateTime() {
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }

    public boolean isExpireTime(LocalDateTime time) {
        return LocalDateTime.now().isAfter(time);
    }
    public int generateOTP() {
        return new Random().nextInt(900000) + 100000;
    }
    public boolean sendEmail(String to, String name, int otpvalue) {
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

//        int otpvalue = 0;
//        Random rand = new Random();
//        otpvalue = rand.nextInt(1255650);
        MimeMessage msg = new MimeMessage(session);

        try {
            msg.addHeader("Content-Type", "text/html; charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject("Mã OTP đặt lại mật khẩu", "UTF-8");
            String content = "Xin chào " + name + ",<br><br>"
                    + "Mã OTP của bạn là: <strong>" + otpvalue + "</strong><br>"
                    + "Mã này sẽ hết hạn trong 20 phút.<br><br>"
                    + "Vui lòng không chia sẻ mã này với bất kỳ ai.";

            msg.setContent(content, "text/html; charset=UTF-8");
            Transport.send(msg);
            return true;
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
