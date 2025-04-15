package dao;

import context.JDBIContext;
import entity.Customer;
import entity.tokenForgotPassword;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TokenForgotDAO {
    public boolean insertTokenForgot(tokenForgotPassword tokenForgot) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO tokenforgotpassword (token, expiryTime, isUsed, userId) " +
                                "VALUES (:token, :expiryTime, :isUsed, :userId);")
                        .bind("token", tokenForgot.getToken())
                        .bind("expiryTime", tokenForgot.getExpiryTime())
                        .bind("isUsed", tokenForgot.isIsUsed())
                        .bind("userId", tokenForgot.getUserId())
                        .execute() > 0
        );
    }
    public tokenForgotPassword getTokenPassword(String token) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from tokenforgotpassword where token = :token and isUsed = false")
                        .bind("token", token)
                        .mapToBean(tokenForgotPassword.class).findOne().orElse(null)
                ));
    }

    public void updateStatus(tokenForgotPassword token){
        System.out.println("token= "+token);
        JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("UPDATE tokenforgotpassword SET isUsed = :isUsed WHERE token = :token")
                        .bind("isUsed", true)
                        .bind("token", token.getToken())
                        .execute()
        );
    }

}
