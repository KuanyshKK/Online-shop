package com.example.homework51.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.math.BigDecimal;
import java.util.UUID;

@Document(collection = "products")
@Data
public class Product {

    @Id
    private String id;
    private String name;
    private BigDecimal price;
    private String description;

    @DBRef
    private Manufacturer manufacturer;

    @DBRef
    private Category category;

    public Product(String name, BigDecimal price, String description, Manufacturer manufacturer, Category category) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.price = price;
        this.description = description;
        this.manufacturer = manufacturer;
        this.category = category;
    }
}
