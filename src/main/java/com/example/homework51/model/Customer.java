package com.example.homework51.model;

import lombok.Data;

@Data
public class Customer {
    private String name;
    private String surname;
    private String phoneNumber;
    private String email;
    private String address;
    private String payType;

    public Customer(String name, String surname, String phoneNumber, String email, String address,String payType) {
        this.name = name;
        this.surname = surname;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
        this.payType = payType;
    }
}
