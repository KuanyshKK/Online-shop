package com.example.homework51.configuration;

import com.example.homework51.service.StorageService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApplicationConfig {
    @Bean
    CommandLineRunner init(StorageService storageService){
        return (args)->{
            storageService.init();
        };
    }
}
