package controller;

import jakarta.servlet.http.HttpServletRequest;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

public class VnPayConfig {
    public static String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";

    public static String vnp_ReturnUrl = "http://localhost:8080/Project-LTW/vnpay-return";

    public static String vnp_TmnCode = "QUQKJ72Q";  // Đảm bảo mã này chính xác
    public static String vnp_HashSecret = "0DBOHJ677YA5SBX53AKIHPK5SO45G7N7";  // Đảm bảo mã này chính xác


//    public static String getRandomNumber(int length) {
//        String chars = "0123456789";
//        StringBuilder sb = new StringBuilder(length);
//        Random rnd = new Random();
//        while (sb.length() < length) {
//            int index = (int) (rnd.nextFloat() * chars.length());
//            sb.append(chars.charAt(index));
//        }
//        return sb.toString();
//    }

//    public static String hashAllFields(Map<String, String> fields) throws UnsupportedEncodingException {
//        List<String> fieldNames = new ArrayList<>(fields.keySet());
//        Collections.sort(fieldNames);
//        StringBuilder sb = new StringBuilder();
//        for (String fieldName : fieldNames) {
//            String value = fields.get(fieldName);
//            if ((value != null) && (value.length() > 0)) {
//                sb.append(fieldName);
//                sb.append('=');
//                sb.append(URLEncoder.encode(value, StandardCharsets.US_ASCII.toString()));
//                sb.append('&');
//            }
//        }
//        // remove last & and hash
//        String queryString = sb.substring(0, sb.length() - 1);
//        return hmacSHA512(vnp_HashSecret, queryString);
//    }

    public static String buildQueryUrl(Map<String, String> fields) throws UnsupportedEncodingException {
        List<String> fieldNames = new ArrayList<>(fields.keySet());
        Collections.sort(fieldNames);
        StringBuilder sb = new StringBuilder();
        for (String fieldName : fieldNames) {
            String value = fields.get(fieldName);
            if ((value != null) && (value.length() > 0)) {
                sb.append(URLEncoder.encode(fieldName, "UTF-8"));
                sb.append('=');
                sb.append(URLEncoder.encode(value, "UTF-8"));
                sb.append('&');
            }
        }
        return sb.substring(0, sb.length() - 1); // remove last &
    }

//    public static String hmacSHA512(String key, String data) {
//        try {
//            Mac hmac512 = Mac.getInstance("HmacSHA512");
//            byte[] hmacKeyBytes = key.getBytes(StandardCharsets.UTF_8);
//            SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
//            hmac512.init(secretKey);
//            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
//            byte[] result = hmac512.doFinal(dataBytes);
//            StringBuilder sb = new StringBuilder(result.length * 2);
//            for (byte b : result) {
//                sb.append(String.format("%02x", b));
//            }
//            return sb.toString();
//
//        } catch (Exception ex) {
//            throw new RuntimeException("Lỗi khi tạo mã hash", ex);
//        }
//    }
    public static String md5(String message) {
        String digest = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(message.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder(2 * hash.length);
            for (byte b : hash) {
                sb.append(String.format("%02x", b & 0xff));
            }
            digest = sb.toString();
        } catch (UnsupportedEncodingException ex) {
            digest = "";
        } catch (NoSuchAlgorithmException ex) {
            digest = "";
        }
        return digest;
    }

    public static String Sha256(String message) {
        String digest = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(message.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder(2 * hash.length);
            for (byte b : hash) {
                sb.append(String.format("%02x", b & 0xff));
            }
            digest = sb.toString();
        } catch (UnsupportedEncodingException ex) {
            digest = "";
        } catch (NoSuchAlgorithmException ex) {
            digest = "";
        }
        return digest;
    }

    //Util for VNPAY
    public static String hashAllFields(Map fields) {
        List fieldNames = new ArrayList(fields.keySet());
        Collections.sort(fieldNames);
        StringBuilder sb = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) fields.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                sb.append(fieldName);
                sb.append("=");
                sb.append(fieldValue);
            }
            if (itr.hasNext()) {
                sb.append("&");
            }
        }
        return hmacSHA512(vnp_HashSecret,sb.toString());
    }

    public static String hmacSHA512(final String key, final String data) {
        try {if (key == null || data == null) {
            throw new NullPointerException();
        }
            final Mac hmac512 = Mac.getInstance("HmacSHA512");
            byte[] hmacKeyBytes = key.getBytes();
            final SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
            hmac512.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = hmac512.doFinal(dataBytes);
            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();

        } catch (Exception ex) {
            return "";
        }
    }

    public static String getIpAddress(HttpServletRequest request) {
        String ipAdress;
        try {
            ipAdress = request.getHeader("X-FORWARDED-FOR");
            if (ipAdress == null) {
                ipAdress = request.getRemoteAddr();
            }
        } catch (Exception e) {
            ipAdress = "Invalid IP:" + e.getMessage();
        }
        return ipAdress;
    }

    public static String getRandomNumber(int len) {
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }
}

