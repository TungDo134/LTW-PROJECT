package dao;

import context.DBConntext;
import context.JDBIContext;
import entity.AboutUsPic;
import entity.HomePicture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AboutUsPicDAO {




    public List<AboutUsPic> getAboutUsPic() {

        ArrayList<AboutUsPic> listpicAboutUs = new ArrayList<>();

        try {
            Connection conn = DBConntext.getConnection();

            String query = "SELECT * FROM aboutuspictures";
            PreparedStatement pst = conn.prepareStatement(query);

            System.out.println(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                listpicAboutUs.add(new AboutUsPic(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)

                ));
            }
            DBConntext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listpicAboutUs;
    }
    //Hiển thị tất cả ảnh about us
    public List<AboutUsPic> getAllAboutUsPic() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from aboutuspictures")
                        .mapToBean(AboutUsPic.class).list())
        );
    }
}
