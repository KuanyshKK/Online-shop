package com.example.homework51.model;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class ProductDataModel {
    private List<Product> products = new ArrayList<>();
    private List<Manufacturer> manufacturers = new ArrayList<>();
}
