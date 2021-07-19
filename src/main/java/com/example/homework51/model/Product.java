package com.example.homework51.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Document(collection = "products")
@Data
public class Product {

    @Id
    private String id;
    private String name;
    private double price;
    private String description;

    @DBRef
    private Manufacturer manufacturer;

    @DBRef
    private Category category;

    private List<ProductReview> reviews = new ArrayList<>();
    private double averageRate;

    private String filePath;

    public Product(String name, double price, String description, Manufacturer manufacturer, Category category, String filePath) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.price = price;
        this.description = description;
        this.manufacturer = manufacturer;
        this.category = category;
        this.averageRate = 0;
        this.filePath = filePath;
    }

    public void addReview(String name, String surname, String email, String phoneNumber, int rate, String comment){
        ProductReview review = new ProductReview(name, surname, email, phoneNumber, rate, comment);
        this.reviews.add(review);
    }
}
