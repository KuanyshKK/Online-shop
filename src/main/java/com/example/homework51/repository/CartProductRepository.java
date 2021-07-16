package com.example.homework51.repository;

import com.example.homework51.model.CartProduct;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface CartProductRepository extends MongoRepository<CartProduct, String> {

    List<CartProduct> getAllByCustomerEmail(String email);
    void deleteAllByCustomerEmail(String email);

}
