package com.example.ss10_jsp_jstl.modal;
public class Customer {
    private String  nameCustomer ;
    private String birthday ;
    private  String address;
    private String image ;

    public Customer(String nameCustomer, String birthday, String address, String image) {
        this.nameCustomer = nameCustomer;
        this.birthday = birthday;
        this.address = address;
        this.image = image;
    }


    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
