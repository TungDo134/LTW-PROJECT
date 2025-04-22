package dao;

import context.JDBIContext;
import entity.Manufacturer;

import java.util.List;

public class ManufacturerDAO {

    // Lấy manufacturer theo ID
    public Manufacturer getManufacturerById(int manuID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM manufacturers WHERE manuID = :manuID")
                        .bind("manuID", manuID)
                        .mapToBean(Manufacturer.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Lấy danh sách tất cả manufacturers
    public List<Manufacturer> getAllManufacturers() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM manufacturers")
                        .mapToBean(Manufacturer.class)
                        .list()
        );
    }

    // Thêm manufacturer mới
    public int addManufacturer(Manufacturer m) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
            INSERT INTO manufacturers 
            (manuName,  brandOrigin, manufactureLocation) 
            VALUES (:manuName, :brandOrigin, :manufactureLocation)
        """)
                        .bind("manuName", m.getManuName())
                        .bind("brandOrigin", m.getBrandOrigin())
                        .bind("manufactureLocation", m.getManufactureLocation())
                        .execute()
        );
    }


    // Cập nhật manufacturer
    public int updateManufacturer(Manufacturer m) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
            UPDATE manufacturers 
            SET manuName = :manuName, 
                brandOrigin = :brandOrigin, 
                manufactureLocation = :manufactureLocation 
            WHERE manuID = :manuID
        """)
                        .bind("manuName", m.getManuName())
                        .bind("brandOrigin", m.getBrandOrigin())
                        .bind("manufactureLocation", m.getManufactureLocation())
                        .bind("manuID", m.getManuID())
                        .execute()
        );
    }


    // Xóa manufacturer theo ID
    public int deleteManufacturer(int manuID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("DELETE FROM manufacturers WHERE manuID = :manuID")
                        .bind("manuID", manuID)
                        .execute()
        );
    }

    public static void main(String[] args) {
        ManufacturerDAO manufacturerDAO = new ManufacturerDAO();

        System.out.println(manufacturerDAO.getAllManufacturers());
    }


}
