package dao;

import context.DBConntext;
import context.JDBIContext;
import entity.Coupon;
import entity.HomePicture;
import entity.Product;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HomePictureDAO {


    public HomePicture getHomePic() {

        try (Handle handle = JDBIContext.getJdbi().open()) {
            return handle.createQuery("SELECT * FROM homepictures")
                    .mapToBean(HomePicture.class).one();
        }
    }
    //Hiển thị tất cả ảnh home
    public List<HomePicture> getAllHomePic() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from homepictures")
                        .mapToBean(HomePicture.class).list())
        );
    }

    public static void main(String[] args) {
        HomePictureDAO dao = new HomePictureDAO();
        System.out.println(dao.getHomePic());
    }


}

