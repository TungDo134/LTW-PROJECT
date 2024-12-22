package dao;

import context.JDBIContext;
import entity.HomePicture;
import org.jdbi.v3.core.Handle;

import java.util.Arrays;
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


    public int updateImg(String target, String img) {
        //Kiểm tra tên cột hợp lệ

        List<String> allowedColumns = Arrays.asList("bannerImg", "img1", "img2", "img3", "img4", "img5");
        if (!allowedColumns.contains(target)) {
            throw new IllegalArgumentException("Invalid column name: " + target);
        }

        // Tạo câu lệnh SQL với tên cột hợp lệ
        String sql = "UPDATE homepictures SET " + target + " = :img";
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("img", img) // Gán giá trị cần cập nhật
                        .execute()
        );
    }

    public static void main(String[] args) {
        HomePictureDAO dao = new HomePictureDAO();
        System.out.println(dao.getHomePic());
    }


}

