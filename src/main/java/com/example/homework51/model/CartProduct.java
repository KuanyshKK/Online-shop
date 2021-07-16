package com.example.homework51.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "cartProducts")
@Data
public class CartProduct {

    @Id
    private String id;
    private Product product;
    private int amount = 0;
    private String customerEmail;

    public CartProduct(Product product, int amount, String customerEmail) {
        this.product = product;
        this.amount = amount;
        this.customerEmail = customerEmail;
    }
}
