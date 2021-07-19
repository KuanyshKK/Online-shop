package com.example.homework51.service;

import com.example.homework51.model.CartProduct;
import com.example.homework51.model.Product;
import com.example.homework51.model.ProductReview;
import com.example.homework51.repository.ProductRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product getById(String id){
        return productRepository.findById(id).orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Товар с id %s не найден", id)
        ));
    }

    public double calculateAverageRate(Product product){
        double avg = 0;
        int size = 0;
        for (ProductReview review : product.getReviews()) {
            avg += review.getRate();
            size++;
        }
        if(size == 0)
            return 0;
        avg = avg/size;
        return avg;
    }
}
