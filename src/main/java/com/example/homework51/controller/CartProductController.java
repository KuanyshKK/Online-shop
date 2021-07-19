package com.example.homework51.controller;

import com.example.homework51.model.BuyCartProductModel;
import com.example.homework51.model.CartProduct;
import com.example.homework51.model.Product;
import com.example.homework51.model.ShopDataModel;
import com.example.homework51.repository.CartProductRepository;
import com.example.homework51.repository.ProductRepository;
import com.example.homework51.service.CartProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cartProducts")
public class CartProductController {
    private final CartProductRepository cartProductRepository;
    private final CartProductService cartProductService;
    private final ProductRepository productRepository;

    public CartProductController(CartProductRepository cartProductRepository, CartProductService cartProductService, ProductRepository productRepository) {
        this.cartProductRepository = cartProductRepository;
        this.cartProductService = cartProductService;
        this.productRepository = productRepository;
    }

    @GetMapping("/shop")
    public String getShop(Model model){
        List<Product> products = productRepository.findAll();
        ShopDataModel shopDataModel = new ShopDataModel();
        shopDataModel.setProducts(products);
        model.addAttribute("shopDataModel", shopDataModel);
        return "shop";
    }

    @PostMapping("/add")
    public String addProductToCart(@RequestParam String productId,
                                   @RequestParam String customerEmail,
                                   @RequestParam int amount){
        cartProductService.addCartProduct(productId, customerEmail, amount);
        return "redirect:/cartProducts/shop";
    }

    @GetMapping
    public String getCartProductByEmail(@RequestParam String email, Model model){
        List<CartProduct> cartProducts = cartProductRepository.getAllByCustomerEmail(email);
        model.addAttribute("cartProducts", cartProducts);
        System.out.println(email);
        return "cartProducts";
    }

    @PostMapping("/update")
    public String updateAmountOfProducts(@RequestParam String productId, @RequestParam int amount){
        CartProduct cartProduct = cartProductService.getById(productId);
        cartProduct.setAmount(amount);
        cartProductRepository.save(cartProduct);
        cartProduct.setCustomerEmail(cartProduct.getCustomerEmail().replace("@","%40"));
        System.out.println(cartProduct.getCustomerEmail());
        return "redirect:/cartProducts?email=" + cartProduct.getCustomerEmail();
    }

    @PostMapping("/delete")
    public String deleteProductFromCart(@RequestParam String productId){
        CartProduct cartProduct = cartProductService.getById(productId);
        cartProductRepository.delete(cartProduct);
        List<CartProduct> cartProducts = cartProductRepository.getAllByCustomerEmail(cartProduct.getCustomerEmail());

        return cartProducts.size()>0 ?
                "redirect:/cartProducts?email=" + cartProduct.getCustomerEmail()
                : "redirect:/cartProducts/shop";

    }

    @GetMapping("/{email}/deleteAll")
    public String deleteAllProductFromCart(@PathVariable String email){
        cartProductRepository.deleteAllByCustomerEmail(email);
        return "redirect:/shop";
    }

    @GetMapping("/{email}/prepareOrder")
    public String prepareOrderForCartProducts(@PathVariable String email, Model model){
        List<CartProduct> cartProducts = cartProductRepository.getAllByCustomerEmail(email);
        BuyCartProductModel dataModel = new BuyCartProductModel();
        double total = cartProductService.calculateTotal(cartProducts);
        dataModel.setCartProducts(cartProducts);
        dataModel.setTotal(total);
        dataModel.setCustomerEmail(email);
        model.addAttribute("dataModel", dataModel);
        return "buyCartProducts";
    }




}
