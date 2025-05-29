package helper;

import entity.Batch;
import helper.GenerateBatchesNum;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ExcelReader {
    public List<Batch> readBatchesFromExcel(String filePath) throws IOException {
        List<Batch> batches = new ArrayList<>();
        try (FileInputStream fis = new FileInputStream(filePath);
             Workbook workbook = new XSSFWorkbook(fis)) {
            Sheet sheet = workbook.getSheetAt(0);
            boolean skipHeader = true;

            for (Row row : sheet) {
                if (skipHeader) {
                    skipHeader = false;
                    continue;
                }

                if (row.getCell(0) == null || row.getCell(0).getCellType() == CellType.BLANK) {
                    continue;
                }

                // Đọc productID
                int productID = 0;
                if (row.getCell(0) != null && row.getCell(0).getCellType() == CellType.NUMERIC) {
                    productID = (int) row.getCell(0).getNumericCellValue();
                }

                // Đọc quantity
                int quantity = 0;
                if (row.getCell(2) != null && row.getCell(2).getCellType() == CellType.NUMERIC) {
                    quantity = (int) row.getCell(2).getNumericCellValue();
                }

                // Đọc price
                double price = 0.0;
                if (row.getCell(3) != null && row.getCell(3).getCellType() == CellType.NUMERIC) {
                    price = row.getCell(3).getNumericCellValue();
                }

                // Đọc supplierID
                int supplierID = 0;
                if (row.getCell(5) != null && row.getCell(5).getCellType() == CellType.NUMERIC) {
                    supplierID = (int) row.getCell(5).getNumericCellValue();
                }

                // Tự sinh batchNumber
                String batchNumber = new GenerateBatchesNum().generateBatchesNumber();

                // Tự sinh importDate và createdAt bằng LocalDateTime.now()
                String importDate = String.valueOf(LocalDateTime.now().toLocalDate());
                String createdAt = String.valueOf(LocalDateTime.now()); // 2025-05-29 06:09 PM +07

                // Giá trị mặc định cho isDeleted và isUsed
                byte isDeleted = 0;
                byte isUsed = 0;

                // Tạo Batch
                Batch batch = new Batch(productID, batchNumber, quantity, price, importDate, supplierID, createdAt, isDeleted, isUsed);
                batches.add(batch);
                System.out.println("Read batch: " + batch); // Debug
            }
        } catch (IOException e) {
            System.err.println("Error reading Excel file: " + e.getMessage());
            throw e;
        }
        return batches;
    }

    public static void main(String[] args) throws IOException {
        ExcelReader reader = new ExcelReader();
        System.out.println(reader.readBatchesFromExcel("D:\\WorkSpace_IJ\\Project-LTW\\Book1.xlsx"));
    }
}
