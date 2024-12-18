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

    // Hiển thị review cho sản phẩm đó (rv này đã được admin duyệt)
    public List<Review> getAllReviewByPID(String pID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from reviews where productID =:pID && display = 1 ")
                        .bind("pID", pID)
                        .mapToBean(Review.class).list())
        );
    }


    /* cập nhật display
      1 ==> hiện
      0 ==> ẩn
     */
    public int modifyReview(String rID, int value) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createUpdate("Update reviews set display = :value where reviewID = :reviewID ")
                        .bind("value", value)
                        .bind("reviewID", rID)
                        .execute())
        );
    }

    // xóa reviews
    public int removeReview(String rID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createUpdate("Delete from reviews where reviewID = :reviewID")
                        .bind("reviewID", rID)
                        .execute())
        );
    }


    public static void main(String[] args) {
        ReviewDAO dao = new ReviewDAO();
        List<Review> reviews = dao.getAllReviewByPID("19");
        for (Review review : reviews) {
            System.out.println(review);
        }
    }
}
