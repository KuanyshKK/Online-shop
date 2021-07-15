package com.example.homework51.controller;

import com.example.homework51.model.Category;
import com.example.homework51.model.Manufacturer;
import com.example.homework51.model.Product;
import com.example.homework51.model.ProductDataModel;
import com.example.homework51.repository.CategoryRepository;
import com.example.homework51.repository.ManufacturerRepository;
import com.example.homework51.repository.ProductRepository;
import com.example.homework51.service.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class ProductController {

    private final ProductRepository productRepository;
    private final ManufacturerRepository manufacturerRepository;
    private final CategoryRepository categoryRepository;
    private final ProductService service;

    public ProductController(ProductRepository productRepository, ManufacturerRepository manufacturerRepository, CategoryRepository categoryRepository, ProductService service) {
        this.productRepository = productRepository;
        this.manufacturerRepository = manufacturerRepository;
        this.categoryRepository = categoryRepository;
        this.service = service;
    }

    @GetMapping
    public String root(){
        return "index";
    }

    @GetMapping("/products")
    public String getProducts(Model model){
        List<Product> products = productRepository.findAll();
        List<Manufacturer> manufacturers = manufacturerRepository.findAll();
        List<Category> categories = categoryRepository.findAll();
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
                             @RequestParam BigDecimal price){


        Manufacturer manufacturer = manufacturerRepository.findById(manufacturerId).orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Производитель с id %s не найден", manufacturerId)
        ));
        Category category = categoryRepository.findById(categoryId).orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Категория с id %s не найден", categoryId)
        ));

        Product product = new Product(name, price, description, manufacturer, category);
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
                                @RequestParam BigDecimal price){
        Product product = service.getById(id);
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
        Product product = service.getById(id);
        productRepository.delete(product);
        return "redirect:/products";
    }

}
