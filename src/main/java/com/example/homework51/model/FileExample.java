package com.example.homework51.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Document(collection = "files")
public class FileExample {
    @Id
    private String id = UUID.randomUUID().toString();
    private String filePath;

    public FileExample(String filePath){this.filePath = filePath;}
}
