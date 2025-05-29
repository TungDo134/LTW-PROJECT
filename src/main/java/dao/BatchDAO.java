package dao;

import entity.Batch;
import context.JDBIContext;
import org.jdbi.v3.core.Handle;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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

    // Lấy lô hàng bị lưu trũ (isDeleted=0)
    public List<Batch> getArchiveBatch() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("""
                                SELECT b.*, p.productName
                                FROM batches b
                                JOIN products p ON b.productID = p.productID
                                WHERE b.isDeleted = 1
                                """)
                        .mapToBean(Batch.class)
                        .list()
        );
    }

    // Thêm lô hàng mới
    public boolean addBatch(Batch batch) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
                                INSERT INTO batches (productID, batchNumber, quantity, price, importDate, supplierID, isDeleted)
                                VALUES (:productID, :batchNumber, :quantity, :price, :importDate, :supplierID, :isDeleted)
                                """)
                        .bind("productID", batch.getProductID())
                        .bind("batchNumber", batch.getBatchNumber())
                        .bind("quantity", batch.getQuantity())
                        .bind("price", batch.getPrice())
                        .bind("importDate", batch.getImportDate())
                        .bind("supplierID", batch.getSupplierID())
                        .bind("isDeleted", batch.getIsDeleted())
                        .execute()
        );
        syncInventoryForProductIDs(JDBIContext.getJdbi().open(), List.of(batch.getProductID()));
        return rowsAffected > 0;
    }

    // Update batches
    public boolean updateBatch(Batch batch) {
        return JDBIContext.getJdbi().withHandle(handle -> {
            // Bắt đầu transaction
            handle.begin();
            try {
                // Bước 1: Lấy productID cũ trước khi cập nhật
                Integer oldProductID = handle.createQuery("SELECT productID FROM batches WHERE batchID = :batchID")
                        .bind("batchID", batch.getBatchID())
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(null);

                if (oldProductID == null) {
                    handle.rollback(); // Rollback nếu batch không tồn tại
                    return false;
                }

                // Bước 2: Cập nhật batch trong bảng batches
                int rowsAffected = handle.createUpdate("""
                                UPDATE batches
                                SET productID = :productID, quantity = :quantity, price = :price, supplierID = :supplierID
                                WHERE batchID = :batchID
                                """)
                        .bind("batchID", batch.getBatchID())
                        .bind("productID", batch.getProductID())
                        .bind("quantity", batch.getQuantity())
                        .bind("price", batch.getPrice())
                        .bind("supplierID", batch.getSupplierID())
                        .execute();

                // Bước 3: Xác định các productID bị ảnh hưởng
                List<Integer> affectedProductIDs = new ArrayList<>();
                affectedProductIDs.add(oldProductID); // productID cũ
                affectedProductIDs.add(batch.getProductID()); // productID mới

                // Loại bỏ trùng lặp
                affectedProductIDs = affectedProductIDs.stream().distinct().collect(Collectors.toList());

                // Bước 4: Đồng bộ inventory cho các productID bị ảnh hưởng
                syncInventoryForProductIDs(handle, affectedProductIDs);

                // Commit transaction nếu thành công
                handle.commit();
                return rowsAffected > 0;

            } catch (Exception e) {
                // Rollback nếu có lỗi
                handle.rollback();
                return false;
            }
        });
    }

    // Soft Delete
    public boolean softDeleteBatch(String batchId) {
        return JDBIContext.getJdbi().withHandle(handle -> {
            handle.begin();

            try {
                // Bước 1: Lấy productID của lô cần soft delete
                Integer productID = handle.createQuery("SELECT productID FROM batches WHERE batchID = :batchID")
                        .bind("batchID", batchId)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(null);

                if (productID == null) {
                    handle.rollback();
                    return false; // Batch không tồn tại
                }

                // Bước 2: Thực hiện soft delete
                int rowsAffected = handle.createUpdate("UPDATE batches SET isDeleted = 1 WHERE batchID = :batchID")
                        .bind("batchID", batchId)
                        .execute();

                if (rowsAffected == 0) {
                    handle.rollback();
                    return false; // Không cập nhật được
                }

                // Bước 3: Đồng bộ inventory cho productID bị ảnh hưởng
                syncInventoryForProductIDs(handle, List.of(productID));

                handle.commit();
                return true;

            } catch (Exception e) {
                handle.rollback();
                return false;
            }
        });
    }

    // Un Soft Delete
    public boolean unSoftDeleteBatch(String batchId) {
        return JDBIContext.getJdbi().withHandle(handle -> {
            handle.begin();

            try {
                // Bước 1: Lấy productID của lô cần soft delete
                Integer productID = handle.createQuery("SELECT productID FROM batches WHERE batchID = :batchID")
                        .bind("batchID", batchId)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(null);

                if (productID == null) {
                    handle.rollback();
                    return false; // Batch không tồn tại
                }

                // Bước 2: Thực hiện unSoft delete
                int rowsAffected = handle.createUpdate("UPDATE batches SET isDeleted = 0 WHERE batchID = :batchID")
                        .bind("batchID", batchId)
                        .execute();

                if (rowsAffected == 0) {
                    handle.rollback();
                    return false; // Không cập nhật được
                }

                // Bước 3: Đồng bộ inventory cho productID bị ảnh hưởng
                syncInventoryForProductIDs(handle, List.of(Integer.valueOf(productID)));

                handle.commit();
                return true;

            } catch (Exception e) {
                handle.rollback();
                return false;
            }
        });
    }

    // Sync batches and inventory
    private void syncInventoryForProductIDs(Handle handle, List<Integer> productIDs) {
        if (productIDs.isEmpty()) {
            return;
        }
        handle.createUpdate(
                        "INSERT INTO inventory (productID, quantityInStock, lastUpdated) " +
                                "SELECT productID, COALESCE(SUM(quantity), 0) AS totalQuantity, NOW() " +
                                "FROM batches " +
                                "WHERE isDeleted = 0 AND productID IN (<productIDs>) " +
                                "GROUP BY productID " +
                                "ON DUPLICATE KEY UPDATE " +
                                "quantityInStock = VALUES(quantityInStock), " +
                                "lastUpdated = NOW()"
                )
                .bindList("productIDs", productIDs)
                .execute();
    }

    public List<Batch> getBatchesNum() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("""
                                SELECT b.batchNumber
                                FROM batches b
                                """)
                        .mapToBean(Batch.class)
                        .list()
        );
    }

    // update status (isUsed=0 || 1)
    public boolean updateUsedStatus(String batchId, Byte isUsed) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("UPDATE batches SET isUsed = :isUsed WHERE batchID = :batchID")
                        .bind("batchID", batchId)
                        .bind("isUsed", isUsed)
                        .execute()
        );
        return rowsAffected > 0;
    }


}

