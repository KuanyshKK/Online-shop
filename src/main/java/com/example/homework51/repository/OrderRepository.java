package com.example.homework51.repository;

import com.example.homework51.model.Order;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface OrderRepository extends MongoRepository<Order, String> {

    List<Order> getOrdersByCustomerEmail(String email, Sort sort);

}
