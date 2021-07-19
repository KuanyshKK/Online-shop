package com.example.homework51.service;

import com.example.homework51.model.CartProduct;
import com.example.homework51.model.Category;
import com.example.homework51.model.Product;
import com.example.homework51.repository.CartProductRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CartProductService {
    private final CartProductRepository cartProductRepository;
    private final ProductService productService;

    public CartProductService(CartProductRepository cartProductRepository, ProductService productService) {
        this.cartProductRepository = cartProductRepository;
        this.productService = productService;
    }

    public void addCartProduct(String productId,  String customerEmail, int amount){
        Product product = productService.getById(productId);
        CartProduct cartProduct = new CartProduct(product, amount, customerEmail);
        cartProductRepository.save(cartProduct);
    }

    public CartProduct getById(String id){
        return cartProductRepository.findById(id).orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Товар с id %s в корзине не найдена", id)
        ));
    }

    public double calculateTotal(List<CartProduct> cartProducts){
        var total = cartProducts.stream()
                .mapToDouble(i -> i.getProduct().getPrice() * i.getAmount())
                .sum();
        return total;
    }




}
