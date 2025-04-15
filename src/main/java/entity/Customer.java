package entity;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.io.Serializable;

public class Customer implements Serializable {
    public int id;
    public String name;
    public String email;
    public String pass;
    public String phone;
    public String address;
    public String addressShipping;
    public byte role;

    public Customer() {
    }


    public Customer(int id, String name, String email, String pass, String phone, String address, String addressShipping, byte role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pass = pass;
        this.phone = phone;
        this.address = address;
        this.addressShipping = addressShipping;
        this.role = role;
    }

    @ColumnName("customerID")
    public int getId() {
        return id;
    }

    @ColumnName("customerName")
    public String getName() {
        return name;
    }
    @ColumnName("email")
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

    public String getAddressShipping() {
        return addressShipping;
    }


    public byte getRole() {
        return role;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setAddressShipping(String addressShipping) {
        this.addressShipping = addressShipping;
    }

    public void setRole(byte role) {
        this.role = role;
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
                ", addressShipping='" + addressShipping + '\'' +
                ", role=" + role +
                '}';
    }
}


