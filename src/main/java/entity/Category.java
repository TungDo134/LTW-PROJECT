package entity;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

public class Category {
    public int id;
    public String name;


    public Category(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Category() {

    }


    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ColumnName("CateID")
    public int getId() {
        return id;
    }

    @ColumnName("CateName")
    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
