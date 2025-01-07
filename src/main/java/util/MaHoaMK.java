package util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;

public class MaHoaMK {
    public static String toSHA1(String str) {
//        String salt = "asjrlkmcoewj@tjle;oxqskjhdjksjf1jurVn"; // Làm cho mật khẩu phức tạp
        String rs = null;
//        str += salt;
        try {
            byte[] dataBytes = str.getBytes(StandardCharsets.UTF_8);
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] sha1Bytes = md.digest(dataBytes);
            rs = Base64.getEncoder().encodeToString(sha1Bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static void main(String[] args) {
        System.out.println(toSHA1("admin123"));
    }
}
