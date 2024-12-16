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

}
