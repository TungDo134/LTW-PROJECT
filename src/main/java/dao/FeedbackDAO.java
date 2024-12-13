package dao;

import context.DBConntext;
import entity.Feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    public List<Feedback> getFeedback() {
        ArrayList<Feedback> list = new ArrayList<>();
        try{
            Connection conn = DBConntext.getConnection();
            String query = "SELECT * FROM feedbacks";
            PreparedStatement pst = conn.prepareStatement(query);

            System.out.println(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)

                ));
            }
            DBConntext.closeConnection(conn);
        }catch (Exception e){
            e.printStackTrace();
        }
            return list;
    }
}
