package entity;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class test {
    public static void main(String[] args) throws IllegalAccessException {
        Category cate = new Category(1, "Bút", "but.png");
        List<Object> values = new ArrayList<>();
        for (Field field : cate.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            values.add(field.get(cate));
        }

        System.out.println(values);
    }
}

