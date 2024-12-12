package entity;

public class Customer {
    public int id;
    public String name;
    public String email;
    public String pass;
    public String phone;
    public String address;
    public byte role;

    public Customer(int id, String name, String email, String pass, String phone, String address, byte role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pass = pass;
        this.phone = phone;
        this.address = address;
        this.role = role;
    }

    public Customer(){

    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPass() {
        return pass;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public byte getRole() {
        return role;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", pass='" + pass + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", role=" + role +
                '}';
    }
}


