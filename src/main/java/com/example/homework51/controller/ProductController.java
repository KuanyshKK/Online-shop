package com.example.homework51.controller;

import com.example.homework51.model.Manufacturer;
import com.example.homework51.model.Product;
import com.example.homework51.model.ProductDataModel;
import com.example.homework51.repository.ManufacturerRepository;
import com.example.homework51.repository.ProductRepository;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
public class ProductController {

    private final ProductRepository productRepository;
    private final ManufacturerRepository manufacturerRepository;
    private final MongoTemplate mongoTemplate;

    public ProductController(ProductRepository productRepository, ManufacturerRepository manufacturerRepository, MongoTemplate mongoTemplate) {
        this.productRepository = productRepository;
        this.manufacturerRepository = manufacturerRepository;
        this.mongoTemplate = mongoTemplate;
    }

    @GetMapping
    public String root(){
        return "index";
    }

    @GetMapping("/products")
    public String getProducts(Model model){
        List<Product> products = productRepository.findAll();
        List<Manufacturer> manufacturers = manufacturerRepository.findAll();
        ProductDataModel dataModel = new ProductDataModel();
        dataModel.setProducts(products);
        dataModel.setManufacturers(manufacturers);
        model.addAttribute("productDataModel", dataModel);
        return "products";
    }

    @PostMapping("/products")
    public String addProduct(@RequestParam String name,
                             @RequestParam String manufacturerId,
                             @RequestParam String description,
                             @RequestParam double price){


        Manufacturer manufacturer = manufacturerRepository.findById(manufacturerId).orElse(null);
        Product product = new Product(name, price, description, manufacturer);
        productRepository.save(product);
        return "redirect:/products";
    }

    @GetMapping("/products/{id}")
    public String getProduct(Model model,
                         @PathVariable String id){
        Product product = productRepository.findById(id).orElse(null);
        if(product == null)
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND,
                    String.format("Продукт с id %s не найден",id));
        model.addAttribute("product", product);
        return "productInfo";
    }

    @GetMapping("/products/{id}/update")
    public String getUpdateProduct(Model model,
                             @PathVariable String id){
        Product product = productRepository.findById(id).orElse(null);
        if(product == null)
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND,
                    String.format("Продукт с id %s не найден",id));
        model.addAttribute("product", product);
        return "productUpdate";
    }

    @PostMapping("/products/{id}/update")
    public String updateProduct(@PathVariable String id,
                                @RequestParam String name,
                                @RequestParam String description,
                                @RequestParam double price){
        Product product = mongoTemplate.findOne(Query.query(Criteria.where("_id").is(id)), Product.class);
        if(product == null)
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND,
                    String.format("Продукт с id %s не найден",id));
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        productRepository.save(product);
        return "redirect:/products";
    }

    @GetMapping("/products/{id}/deletePage")
    public String getDeleteProduct(
            @PathVariable String id){
        return "productDelete";
    }

    @GetMapping("/products/{id}/delete")
    public String deleteProduct(
                             @PathVariable String id){
        Product product = productRepository.findById(id).orElse(null);
        if(product == null)
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND,
                    String.format("Продукт с id %s не найден",id));
        productRepository.delete(product);
        return "redirect:/products";
    }

}
