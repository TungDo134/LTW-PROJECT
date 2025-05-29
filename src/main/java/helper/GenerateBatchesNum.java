package helper;

import context.JDBIContext;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class GenerateBatchesNum {
    public String generateBatchesNumber() {
        String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")); // VD: 20240527
        int countToday = JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM batches WHERE DATE(createdAt) = CURDATE()")
                        .mapTo(int.class)
                        .one()
        );

        int nextSerial = countToday + 1;
        //Ví dụ: 001, 002, ...
        String serialStr = String.format("%03d", nextSerial);
        return "LO-" + dateStr + "-" + serialStr;
    }
}
