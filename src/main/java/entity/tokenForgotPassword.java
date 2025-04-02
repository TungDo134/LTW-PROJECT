package entity;

import java.time.LocalDateTime;

public class tokenForgotPassword {
    private int id;
    private String token;
    private LocalDateTime expiryTime;
    private boolean isUsed;
    private int userId;

    public tokenForgotPassword() {
    }

    public tokenForgotPassword(int id, String token, LocalDateTime expiryTime, boolean isUsed, int userId) {
        this.id = id;
        this.token = token;
        this.expiryTime = expiryTime;
        this.isUsed = isUsed;
        this.userId = userId;
    }
    public tokenForgotPassword(String token, LocalDateTime expiryTime, boolean isUsed, int userId) {
        this.token = token;
        this.expiryTime = expiryTime;
        this.isUsed = isUsed;
        this.userId = userId;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public LocalDateTime getExpiryTime() {
        return expiryTime;
    }

    public void setExpiryTime(LocalDateTime expiryTime) {
        this.expiryTime = expiryTime;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public void setUsed(boolean used) {
        isUsed = used;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "tokenForgotPassword{" +
                "id=" + id +
                ", token='" + token + '\'' +
                ", expiryTime=" + expiryTime +
                ", isUsed=" + isUsed +
                ", userId=" + userId +
                '}';
    }
}
