package entity;

public class Category {
    public int id;
    public String name;


    public Category(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Category(){

    }

    public int getId() {
        return id;
    }

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
