package entity;

import dao.ReviewDAO;

import java.io.Serializable;
import java.util.Date;

public class Review implements Serializable {

    private int reviewID;
    private int productID;
    private String customerName;
    private int rating;
    private byte display;
    private String comment;
    private Date date;


    public Review(int reviewID, int productID, String customerName, int rating, byte display, String comment, Date date) {
        this.reviewID = reviewID;
        this.productID = productID;
        this.customerName = customerName;
        this.rating = rating;
        this.display = display;
        this.comment = comment;
        this.date = date;
    }

    public Review() {
    }


    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public byte getDisplay() {
        return display;
    }

    public void setDisplay(byte display) {
        this.display = display;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Review{" +
                "reviewID=" + reviewID +
                ", productID=" + productID +
                ", customerName='" + customerName + '\'' +
                ", rating=" + rating +
                ", display=" + display +
                ", comment='" + comment + '\'' +
                ", date=" + date +
                '}';
    }
}
