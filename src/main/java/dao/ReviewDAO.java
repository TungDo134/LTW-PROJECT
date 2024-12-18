package dao;

import context.JDBIContext;
import entity.Review;

import java.util.List;

public class ReviewDAO {

    // hiển thị tất cả voucher
    public List<Review> getAllReview() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from reviews ").mapToBean(Review.class).list())
        );
    }


    public int modifyReview(String rID, int value) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createUpdate("Update reviews set display = :value where reviewID = :reviewID ")
                        .bind("value", value)
                        .bind("reviewID", rID)
                        .execute())
        );
    }

    public int removeReview(String rID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createUpdate("Delete from reviews where reviewID = :reviewID")
                        .bind("reviewID", rID)
                        .execute())
        );
    }
}
