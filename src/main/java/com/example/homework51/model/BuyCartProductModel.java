package com.example.homework51.model;

import lombok.Data;

import java.util.List;

@Data
public class BuyCartProductModel {
    private List<CartProduct> cartProducts;
    private String customerEmail;
    private double total = 0;
}
