package com.example.homework51.controller;

import com.example.homework51.model.*;
import com.example.homework51.repository.CategoryRepository;
import com.example.homework51.repository.FileExampleRepository;
import com.example.homework51.repository.ManufacturerRepository;
import com.example.homework51.repository.ProductRepository;
import com.example.homework51.service.FileSystemStorageService;
import com.example.homework51.service.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
public class ProductController {

    private final ProductRepository productRepository;
    private final ManufacturerRepository manufacturerRepository;
    private final CategoryRepository categoryRepository;
    private final ProductService service;
    private final FileSystemStorageService storageService;
    private final FileExampleRepository fileExampleRepository;

    public ProductController(ProductRepository productRepository, ManufacturerRepository manufacturerRepository, CategoryRepository categoryRepository, ProductService service, FileSystemStorageService storageService, FileExampleRepository fileExampleRepository) {
        this.productRepository = productRepository;
        this.manufacturerRepository = manufacturerRepository;
        this.categoryRepository = categoryRepository;
        this.service = service;
        this.storageService = storageService;
        this.fileExampleRepository = fileExampleRepository;
    }



    @GetMapping("/products")
    public String getProducts(Model model){
        List<Product> products = productRepository.findAll();
        List<Manufacturer> manufacturers = manufacturerRepository.findAll();
        List<Category> categories = categoryRepository.findAll();
        for (Product product : products) {
            product.setAverageRate(service.calculateAverageRate(product));
        }
        ProductDataModel dataModel = new ProductDataModel();
        dataModel.setProducts(products);
        dataModel.setManufacturers(manufacturers);
        dataModel.setCategories(categories);
        model.addAttribute("productDataModel", dataModel);
        return "products";
    }

    @PostMapping("/products")
    public String addProduct(@RequestParam String name,
                             @RequestParam String manufacturerId,
                             @RequestParam String categoryId,
                             @RequestParam String description,
                             @RequestParam double price,
                             @RequestParam MultipartFile file){


        Manufacturer manufacturer = manufacturerRepository.findById(manufacturerId).orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Производитель с id %s не найден", manufacturerId)
        ));
        Category category = categoryRepository.findById(categoryId).orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Категория с id %s не найден", categoryId)
        ));

        FileExample fileExample = new FileExample(file.getOriginalFilename());
        Product product = new Product(name, price, description, manufacturer, category, fileExample.getFilePath());
        storageService.store(file);
        fileExampleRepository.save(fileExample);
        productRepository.save(product);
        return "redirect:/products";
    }

    @GetMapping("/products/{id}")
    public String getProduct(Model model,
                         @PathVariable String id){
        Product product = service.getById(id);
        model.addAttribute("product", product);
        return "productInfo";
    }

    @GetMapping("/products/{id}/update")
    public String getUpdateProduct(Model model,
                             @PathVariable String id){
        Product product = service.getById(id);
        model.addAttribute("product", product);
        return "productUpdate";
    }

    @PostMapping("/products/{id}/update")
    public String updateProduct(@PathVariable String id,
                                @RequestParam String name,
                                @RequestParam String description,
                                @RequestParam double price,
                                @RequestParam MultipartFile file){
        Product product = service.getById(id);
        FileExample fileExample = new FileExample(file.getOriginalFilename());
        storageService.store(file);
        fileExampleRepository.save(fileExample);
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setFilePath(fileExample.getFilePath());
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
        Product product = service.getById(id);
        productRepository.delete(product);
        return "redirect:/products";
    }

    @PostMapping("/products/addReview")
    public String addReview(@RequestParam String productId,
                                @RequestParam String name,
                                @RequestParam String surname,
                                @RequestParam String email,
                                @RequestParam String phoneNumber,
                                @RequestParam int rating,
                                @RequestParam String comment){
        Product product = service.getById(productId);
        product.addReview(name, surname, email, phoneNumber, rating, comment);
        productRepository.save(product);
        return "redirect:/cartProducts/shop";
    }

}
