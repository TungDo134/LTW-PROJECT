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


}
