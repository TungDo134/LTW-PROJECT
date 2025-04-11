package dao;

import context.JDBIContext;
import entity.Manufacturer;

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

    // Xoá nhà sản xuất theo ID
    public int deleteManufacturer(int id) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("DELETE FROM manufacturers WHERE id = :id")
                        .bind("id", id)
                        .execute()
        );
    }

    // (Tùy chọn) Tìm theo ID
    public Manufacturer getManufacturerById(int id) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM manufacturers WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Manufacturer.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public static void main(String[] args) {
        ManufacturerDAO manufacturer= new ManufacturerDAO();
        System.out.println(manufacturer.getByCateID(10));
    }
}
