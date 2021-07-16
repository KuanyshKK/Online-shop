package com.example.homework51.model;

import lombok.Data;

import java.util.List;

@Data
public class ShopDataModel {
    private List<Product> products;
    private CartProduct cartProduct;
}
