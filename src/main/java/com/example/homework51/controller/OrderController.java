package com.example.homework51.controller;

import com.example.homework51.model.CartProduct;
import com.example.homework51.model.Customer;
import com.example.homework51.model.Order;
import com.example.homework51.repository.CartProductRepository;
import com.example.homework51.repository.OrderRepository;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {

    private final CartProductRepository cartProductRepository;
    private final OrderRepository orderRepository;

    public OrderController(CartProductRepository cartProductRepository, OrderRepository orderRepository) {
        this.cartProductRepository = cartProductRepository;
        this.orderRepository = orderRepository;
    }

    @PostMapping
    public String addOrder(@RequestParam String name,
                           @RequestParam String surname,
                           @RequestParam String email,
                           @RequestParam String phoneNumber,
                           @RequestParam String address,
                           @RequestParam String payType,
                           @RequestParam String total){

        List<CartProduct> cartProducts = cartProductRepository.getAllByCustomerEmail(email);
        Customer customer = new Customer(name, surname, phoneNumber, email, address, payType);
        double t = Double.parseDouble(total);
        Order order = new Order(customer, cartProducts, t);
        orderRepository.save(order);
        cartProductRepository.deleteAllByCustomerEmail(email);
        return "askBuyProduct";
    }

    @GetMapping("/login")
    public String getOrdersLogin(){ return "ordersLogin";}

    @GetMapping
    public String getOrdersByEmail(@RequestParam String email, Model model){
        List<Order> orders = orderRepository.getOrdersByCustomerEmail(email, Sort.by(Sort.Order.desc("dateTime")));
        model.addAttribute("orders", orders);
        return "orders";
    }
}
