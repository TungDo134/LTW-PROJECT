package dao;

import entity.Supplier;
import context.JDBIContext;

import java.util.List;
import java.util.Optional;

public class SupplierDAO {

    // Lấy tất cả nhà cung cấp
    public List<Supplier> getAllSuppliers() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM suppliers WHERE isDeleted = 0 ORDER BY createdAt DESC")
                        .mapToBean(Supplier.class)
                        .list()
        );
    }

    // Lấy tất cả nhà cung cấp bị lưu trữ
    public List<Supplier> getArchiveSuppliers() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM suppliers WHERE isDeleted = 1 ORDER BY createdAt DESC")
                        .mapToBean(Supplier.class)
                        .list()
        );
    }

    // Lấy nhà cung cấp theo ID
    public Supplier getSupplierByID(int supplierID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM suppliers WHERE supplierID = :supplierID")
                        .bind("supplierID", supplierID)
                        .mapToBean(Supplier.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Thêm nhà cung cấp mới
    public boolean addSupplier(Supplier supplier) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
                                INSERT INTO suppliers (supplierName, contactInfo, address)
                                VALUES (:supplierName, :contactInfo, :address)
                                """)
                        .bind("supplierName", supplier.getSupplierName())
                        .bind("contactInfo", supplier.getContactInfo())
                        .bind("address", supplier.getAddress())
                        .execute()
        );
        return rowsAffected > 0;
    }

    // Cập nhật nhà cung cấp
    public boolean updateSupplier(Supplier supplier) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
                                UPDATE suppliers
                                SET supplierName = :supplierName, contactInfo = :contactInfo, address = :address,
                                createdAt = :createdAt, updatedAt = :updatedAt
                                WHERE supplierID = :supplierID
                                """)
                        .bind("supplierID", supplier.getSupplierID())
                        .bind("supplierName", supplier.getSupplierName())
                        .bind("contactInfo", supplier.getContactInfo())
                        .bind("address", supplier.getAddress())
                        .bind("createdAt", supplier.getCreatedAt())
                        .bind("updatedAt", supplier.getUpdatedAt())
                        .execute()
        );
        return rowsAffected > 0;
    }

    // Xóa (lưu trữ) nhà cung cấp
    public boolean softDeleteSupplier(int supplierID) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
                                UPDATE suppliers
                                SET isDeleted = 1
                                WHERE supplierID = :supplierID
                                """)
                        .bind("supplierID", supplierID)
                        .execute()
        );
        return rowsAffected > 0;
    }

    // Bỏ xóa (lưu trữ) nhà cung cấp
    public void unSoftDeleteSupplier(int supplierID) {
        JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
                                UPDATE suppliers
                                SET isDeleted = 0
                                WHERE supplierID = :supplierID
                                """)
                        .bind("supplierID", supplierID)
                        .execute()
        );
    }
}