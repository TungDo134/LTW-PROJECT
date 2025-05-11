
package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author CTT VNPAY
 */
@WebServlet(name = "VNPayReturnServlet", value = "/vnpay-return")
public class VNPayReturnServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            Map<String, String> fields = new HashMap<>();
            for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = params.nextElement();
                String fieldValue = request.getParameter(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = fields.remove("vnp_SecureHash");
            String vnp_SecureHashType = fields.remove("vnp_SecureHashType");

            String signValue = VnPayConfig.hashAllFields(fields);

            if (signValue.equals(vnp_SecureHash)) {
                String responseCode = fields.get("vnp_ResponseCode");
                if ("00".equals(responseCode)) {
                    // Thanh toán thành công
                    request.setAttribute("message", "Thanh toán thành công!");
                    // Xử lý đơn hàng (thêm vào DB, xoá giỏ hàng,...)
                } else {
                    // Thanh toán thất bại
                    request.setAttribute("message", "Thanh toán thất bại. Mã lỗi: " + responseCode);
                }
            } else {
                request.setAttribute("message", "Dữ liệu không hợp lệ (sai chữ ký)");
            }

            request.getRequestDispatcher("success.jsp").forward(request, response);
        }
    }




