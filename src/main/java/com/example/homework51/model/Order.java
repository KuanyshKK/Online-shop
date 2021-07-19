package com.example.homework51.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Document(collection = "orders")
@Data
public class Order {
    @Id
    private String id;
    private LocalDateTime dateTime;
    private Customer customer;
    private List<CartProduct> cartProducts;
    private double total = 0;

    public Order(Customer customer, List<CartProduct> cartProducts ,double total) {
        this.id = UUID.randomUUID().toString();
        this.dateTime = LocalDateTime.now();
        this.customer = customer;
        this.cartProducts = cartProducts;
        this.total = total;
    }
}


