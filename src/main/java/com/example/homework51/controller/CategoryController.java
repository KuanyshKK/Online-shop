package com.example.homework51.controller;

import com.example.homework51.model.Category;
import com.example.homework51.repository.CategoryRepository;
import com.example.homework51.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CategoryController {

    private final CategoryRepository categoryRepository;
    private final CategoryService service;

    public CategoryController(CategoryRepository categoryRepository, CategoryService service) {
        this.categoryRepository = categoryRepository;
        this.service = service;
    }


    @GetMapping("/categories")
    public String getCategories(Model model){
        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);
        return "categories";
    }

    @GetMapping("/categories/add")
    public String getCategoryAddPage(){
        return "categoryAdd";
    }

    @PostMapping("/categories/add")
    public String addCategory(@RequestParam String name,
                                  @RequestParam String description){
        Category category = new Category(name, description);
        categoryRepository.save(category);
        return "redirect:/categories";
    }

    @GetMapping("/categories/{id}")
    public String getCategory(Model model,
                                  @PathVariable String id){
        Category category = service.getById(id);
        model.addAttribute("category", category);
        return "categoryInfo";
    }

    @GetMapping("/categories/{id}/update")
    public String getUpdateCategory(Model model,
                                        @PathVariable String id){
        Category category = service.getById(id);
        model.addAttribute("category", category);
        return "categoryUpdate";
    }

    @PostMapping("/categories/{id}/update")
    public String updateCategory(@PathVariable String id,
                                @RequestParam String name,
                                @RequestParam String description){
        Category category = service.getById(id);
        category.setName(name);
        category.setDescription(description);
        categoryRepository.save(category);
        return "redirect:/categories";
    }

    @GetMapping("/categories/{id}/deletePage")
    public String getDeleteCategory(
            @PathVariable String id){
        return "categoryDelete";
    }

    @GetMapping("/categories/{id}/delete")
    public String deleteCategory(
            @PathVariable String id){
        Category category = service.getById(id);
        categoryRepository.delete(category);
        return "redirect:/categories";
    }
}
