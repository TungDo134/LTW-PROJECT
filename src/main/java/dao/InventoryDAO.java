package dao;

import context.JDBIContext;
import entity.Inventory;

import java.sql.Timestamp;
import java.util.List;

public class InventoryDAO {

    public List<Inventory> getAllInventory() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("""
                SELECT
                    i.productID,
                    p.productName,
                    i.quantityInStock,
                    i.quantitySold,
                    i.quantityReserved,
                    i.reorderLevel,
                    i.lastUpdated
                FROM inventory i
                JOIN products p ON i.productID = p.productID
            """)
                        .map((row, ctx) -> {
                            Inventory inv = new Inventory();
                            inv.setProductID(row.getInt("productID"));
                            inv.setProductName(row.getString("productName"));
                            inv.setQuantityInStock(row.getInt("quantityInStock"));
                            inv.setQuantitySold(row.getInt("quantitySold"));
                            inv.setQuantityReserved(row.getInt("quantityReserved"));
                            inv.setReorderLevel(row.getInt("reorderLevel"));

                            // Chuyển đổi Timestamp thành LocalDateTime
                            Timestamp timestamp = row.getTimestamp("lastUpdated");
                            if (timestamp != null) {
                                inv.setLastUpdated(timestamp.toLocalDateTime());
                            }

                            return inv;
                        })
                        .list()
        );
    }
    public Inventory getInventoryByProductID(String productID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("""
                SELECT
                    i.productID,
                    p.productName,
                    i.quantityInStock,
                    i.quantitySold,
                    i.quantityReserved,
                    i.reorderLevel,
                    i.lastUpdated
                FROM inventory i
                JOIN products p ON i.productID = p.productID
                WHERE i.productID = :productID
            """)
                        .bind("productID", productID)
                        .map((row, ctx) -> {
                            Inventory inv = new Inventory();
                            inv.setProductID(row.getInt("productID"));
                            inv.setProductName(row.getString("productName"));
                            inv.setQuantityInStock(row.getInt("quantityInStock"));
                            inv.setQuantitySold(row.getInt("quantitySold"));
                            inv.setQuantityReserved(row.getInt("quantityReserved"));
                            inv.setReorderLevel(row.getInt("reorderLevel"));

                            Timestamp timestamp = row.getTimestamp("lastUpdated");
                            if (timestamp != null) {
                                inv.setLastUpdated(timestamp.toLocalDateTime());
                            }

                            return inv;
                        })
                        .findOne()
                        .orElse(null)
        );
    }

    public boolean updateInventory(Inventory inventory) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("""
            UPDATE inventory
            SET 
                quantityInStock = :quantityInStock,
                quantitySold = :quantitySold,
                quantityReserved = :quantityReserved,
                reorderLevel = :reorderLevel,
                lastUpdated = CURRENT_TIMESTAMP
            WHERE productID = :productID
        """)
                        .bind("quantityInStock", inventory.getQuantityInStock())
                        .bind("quantitySold", inventory.getQuantitySold())
                        .bind("quantityReserved", inventory.getQuantityReserved())
                        .bind("reorderLevel", inventory.getReorderLevel())
                        .bind("productID", inventory.getProductID())
                        .execute()
        ) > 0; // Trả về true nếu có ít nhất 1 dòng được cập nhật
    }

    public boolean addStock(int productID, int addedQuantity, Integer reorderLevel) {
        return JDBIContext.getJdbi().withHandle(handle -> {
            StringBuilder query = new StringBuilder("""
            UPDATE inventory
            SET quantityInStock = quantityInStock + :addedQuantity,
                lastUpdated = CURRENT_TIMESTAMP
        """);

            if (reorderLevel != null) {
                query.append(", reorderLevel = :reorderLevel");
            }

            query.append(" WHERE productID = :productID");

            var update = handle.createUpdate(query.toString())
                    .bind("addedQuantity", addedQuantity)
                    .bind("productID", productID);

            if (reorderLevel != null) {
                update.bind("reorderLevel", reorderLevel);
            }

            return update.execute() > 0;
        });
    }

    public boolean deleteInventoryItem(String productID) {
        return JDBIContext.getJdbi().withHandle(handle -> {
            // Tạo câu lệnh SQL DELETE để xóa bản ghi với productID
            String query = "DELETE FROM inventory WHERE productID = :productID";

            // Thực hiện câu lệnh DELETE và kiểm tra số lượng bản ghi bị ảnh hưởng
            var update = handle.createUpdate(query)
                    .bind("productID", productID); // Gán giá trị productID vào câu truy vấn

            // Trả về true nếu ít nhất một bản ghi bị xóa
            return update.execute() > 0;
        });
    }



}
