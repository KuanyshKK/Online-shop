package com.example.homework51.service;

import com.example.homework51.model.Manufacturer;
import com.example.homework51.model.Product;
import com.example.homework51.repository.ManufacturerRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class ManufacturerService {

    private final ManufacturerRepository manufacturerRepository;

    public ManufacturerService(ManufacturerRepository manufacturerRepository) {
        this.manufacturerRepository = manufacturerRepository;
    }

    public Manufacturer getById(String id){
        return manufacturerRepository.findById(id).orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Производитель с id %s не найден", id)
        ));
    }
}
