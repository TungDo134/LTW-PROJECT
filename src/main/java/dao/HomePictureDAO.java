package dao;

import context.DBConntext;
import context.JDBIContext;
import entity.HomePicture;
import entity.Product;
import org.jdbi.v3.core.Jdbi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HomePictureDAO {

//    private final Jdbi jdbi;
//
//    public HomePictureDAO() {
//        this.jdbi = JDBIContext.getJdbi(); // Lấy JDBI từ context
//    }
//
//    public List<HomePicture> getHomePic() {
//        return jdbi.withHandle(handle ->
//                handle.createQuery("SELECT * FROM homepictures")
//                        .mapToBean(HomePicture.class).list()
//        );
//    }


    public List<HomePicture> getHomePic() {

        ArrayList<HomePicture> list = new ArrayList<>();

        try {
            Connection conn = DBConntext.getConnection();

            String query = "SELECT * FROM homepictures";
            PreparedStatement pst = conn.prepareStatement(query);

            System.out.println(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                list.add(new HomePicture(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)


                ));
            }
            DBConntext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

