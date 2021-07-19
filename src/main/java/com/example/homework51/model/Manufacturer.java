package com.example.homework51.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.UUID;

@Document(collection = "manufacturers")
@Data
public class Manufacturer {

    @Id
    private String id;
    private String name;
    private int code;
    private String email;
    private String filePath;

    public Manufacturer(String name, int code, String email, String filePath) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.code = code;
        this.email = email;
        this.filePath = filePath;
    }
}
