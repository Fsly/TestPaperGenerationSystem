package com.imu.bean;

public class Admin {
    private Integer aid;
    private String Name;
    private String Telephone;
    private String Address;
    private String Password;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getTelephone() {
        return Telephone;
    }

    public void setTelephone(String telephone) {
        Telephone = telephone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "AID=" + aid +
                ", Name='" + Name + '\'' +
                ", Telephone='" + Telephone + '\'' +
                ", Address='" + Address + '\'' +
                ", Password='" + Password + '\'' +
                '}';
    }
}
