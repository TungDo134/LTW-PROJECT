package dao;


import context.JDBIContext;
import entity.AboutUsPic;

import java.util.Arrays;
import java.util.List;

public class AboutUsPicDAO {

    //Hiển thị tất cả ảnh about us
    public List<AboutUsPic> getAboutUsPic() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from aboutuspictures")
                        .mapToBean(AboutUsPic.class).list())
        );
    }

    public int updateImg(String target, String img) {
        //Kiểm tra tên cột hợp lệ
        List<String> allowedColumns = Arrays.asList("img1", "img2", "img3", "img4", "member1", "member2", "member3");
        if (!allowedColumns.contains(target)) {
            throw new IllegalArgumentException("Invalid column name: " + target);
        }

        // Tạo câu lệnh SQL với tên cột hợp lệ
        String sql = "UPDATE aboutuspictures SET " + target + " = :img";
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("img", img) // Gán giá trị cần cập nhật
                        .execute()
        );
    }

    public static void main(String[] args) {
        AboutUsPicDAO dao = new AboutUsPicDAO();
        dao.updateImg("member1", "test_img.jpg");
    }

}
