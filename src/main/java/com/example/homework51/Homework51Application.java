package com.example.homework51;

import com.example.homework51.configuration.StorageProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties(StorageProperties.class)
public class Homework51Application {

    public static void main(String[] args) {
        SpringApplication.run(Homework51Application.class, args);
    }

}
