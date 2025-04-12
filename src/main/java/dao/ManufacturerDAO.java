package dao;

import context.JDBIContext;
import entity.Manufacturer;

import java.util.List;

public class ManufacturerDAO {

    // Lấy danh sách tất cả nhà sản xuất
    public Manufacturer getByCateID(int cateID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM manufacturers WHERE cateID = :cateID LIMIT 1")
                        .bind("cateID", cateID)
                        .mapToBean(Manufacturer.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public Manufacturer getManufacturerById(int manuID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM manufacturers WHERE manuID = :manuID")
                        .bind("manuID", manuID)
                        .mapToBean(Manufacturer.class)
                        .findOne()
                        .orElse(null)
        );
    }


    public List<Manufacturer> getAllManufacturers() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM manufacturers")
                        .mapToBean(Manufacturer.class)
                        .list()
        );
    }

    // Thêm nhà sản xuất mới
    public int addManufacturer(Manufacturer m) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO manufacturers (supplierName, brand, brandOrigin, manufactureLocation, color, material, weight, dimensions, bestSeller) " +
                                "VALUES (:supplierName, :brand, :brandOrigin, :manufactureLocation, :color, :material, :weight, :dimensions, :bestSeller)")
                        .bind("supplierName", m.getSupplierName())
                        .bind("brand", m.getBrand())
                        .bind("brandOrigin", m.getBrandOrigin())
                        .bind("manufactureLocation", m.getManufactureLocation())
                        .bind("color", m.getColor())
                        .bind("material", m.getMaterial())
                        .bind("weight", m.getWeight())
                        .bind("dimensions", m.getDimensions())
                        .bind("bestSeller", m.isBestSeller())
                        .execute()
        );
    }

    // Xóa
    public int deleteManufacturer(int id) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("DELETE FROM manufacturers WHERE manuID = :id")
                        .bind("id", id)
                        .execute()
        );
    }

    // Cập nhật
    public int updateManufacturer(Manufacturer m) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("UPDATE manufacturers SET " +
                                "supplierName = :supplierName, brand = :brand, brandOrigin = :brandOrigin, " +
                                "manufactureLocation = :manufactureLocation, color = :color, material = :material, " +
                                "weight = :weight, dimensions = :dimensions, bestSeller = :bestSeller " +
                                "WHERE manuID = :manuID")
                        .bind("supplierName", m.getSupplierName())
                        .bind("brand", m.getBrand())
                        .bind("brandOrigin", m.getBrandOrigin())
                        .bind("manufactureLocation", m.getManufactureLocation())
                        .bind("color", m.getColor())
                        .bind("material", m.getMaterial())
                        .bind("weight", m.getWeight())
                        .bind("dimensions", m.getDimensions())
                        .bind("bestSeller", m.isBestSeller())
                        .bind("manuID", m.getManuID())
                        .execute()
        );
    }



}
