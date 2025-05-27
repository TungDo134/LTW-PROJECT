package dao;

import entity.Batch;
import context.JDBIContext;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

public class BatchDAO {

    // Lấy tất cả lô hàng
    public List<Batch> getAllBatches() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("""
                                SELECT b.*, p.productName, s.supplierName
                                FROM batches b
                                JOIN products p ON b.productID = p.productID
                                LEFT JOIN suppliers s ON b.supplierID = s.supplierID
                                WHERE b.isDeleted = 0
                                ORDER BY b.createdAt DESC
                                """)
                        .mapToBean(Batch.class)
                        .list()
        );
    }

    // Lấy lô hàng theo ID
    public Optional<Batch> getBatchByID(int batchID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("""
                                SELECT b.*, p.productName, s.supplierName
                                FROM batches b
                                JOIN products p ON b.productID = p.productID
                                LEFT JOIN suppliers s ON b.supplierID = s.supplierID
                                WHERE b.batchID = :batchID
                                """)
                        .bind("batchID", batchID)
                        .mapToBean(Batch.class)
                        .findOne()
        );
    }

    // Thêm lô hàng mới
    public boolean addBatch(Batch batch) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
                                INSERT INTO batches (productID, batchNumber, quantity, importDate, supplierID, createdAt, isDeleted)
                                VALUES (:productID, :batchNumber, :quantity, :importDate, :supplierID, :createdAt, :isDeleted)
                                """)
                        .bind("productID", batch.getProductID())
                        .bind("batchNumber", batch.getBatchNumber())
                        .bind("quantity", batch.getQuantity())
                        .bind("importDate", batch.getImportDate())
                        .bind("supplierID", batch.getSupplierID())
                        .bind("createdAt", batch.getCreatedAt())
                        .bind("isDeleted", batch.isDeleted())
                        .execute()
        );
        return rowsAffected > 0;
    }

    // Cập nhật lô hàng
    public boolean updateBatch(Batch batch) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
                                UPDATE batches
                                SET productID = :productID, quantity = :quantity,
                                  supplierID = :supplierID
                                WHERE batchID = :batchID
                                """)
                        .bind("batchID", batch.getBatchID())
                        .bind("productID", batch.getProductID())
                        .bind("quantity", batch.getQuantity())
                        .bind("supplierID", batch.getSupplierID())
                        .execute()
        );
        return rowsAffected > 0;
    }

    // Xóa (lưu trữ) lô hàng
    public boolean deleteBatch(String batchID) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("UPDATE batches SET isDeleted = 1 WHERE batchID = :batchID")
                        .bind("batchID", batchID)
                        .execute()
        );
        return rowsAffected > 0;
    }
}