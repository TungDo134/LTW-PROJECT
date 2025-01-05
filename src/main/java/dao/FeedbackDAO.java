package dao;


import context.JDBIContext;
import entity.Feedback;

import java.util.List;

public class FeedbackDAO {

    public List<Feedback> getFeedback() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from feedbacks").mapToBean(Feedback.class).list())
        );
    }
    // xóa FeedbackController dựa vào ID
    public int deleteFeedback(int fID) {
        return JDBIContext.getJdbi().withHandle(handle -> (
                handle.createUpdate("DELETE FROM feedbacks WHERE fID =:fID")
                        .bind("fID", fID)
                        .execute())
        );
    }
    public int addFeedback(Feedback feedback) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO feedbacks (customerName, email, fContent) VALUES (:customerName, :email, :fContent)")
                        .bind("customerName", feedback.getCustomerName())
                        .bind("email", feedback.getEmail())
                        .bind("fContent", feedback.getfContent())
                        .execute()
        );
    }
}
