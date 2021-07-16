package com.example.homework51.controller;

import com.example.homework51.model.Manufacturer;
import com.example.homework51.repository.ManufacturerRepository;
import com.example.homework51.service.ManufacturerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ManufacturerController {

    private final ManufacturerRepository manufacturerRepository;
    private final ManufacturerService service;


    public ManufacturerController(ManufacturerRepository manufacturerRepository, ManufacturerService service) {
        this.manufacturerRepository = manufacturerRepository;
        this.service = service;
    }

    @GetMapping("/manufacturerList")
    public String getManufacturers(Model model){
        List<Manufacturer> manufacturers = manufacturerRepository.findAll();
        model.addAttribute("manufacturers", manufacturers);
        return "manufacturerList";
    }

    @GetMapping("/manufacturerList/add")
    public String getManufacturerAddPage(){
        return "manufacturerAdd";
    }

    @PostMapping("/manufacturerList/add")
    public String addManufacturer(@RequestParam String name,
                             @RequestParam int code,
                             @RequestParam String email){
        Manufacturer manufacturer = new Manufacturer(name, code, email);
        manufacturerRepository.save(manufacturer);
        return "redirect:/manufacturerList";
    }

    @GetMapping("/manufacturerList/{id}")
    public String getManufacturer(Model model,
                             @PathVariable String id){
        Manufacturer manufacturer = service.getById(id);
        model.addAttribute("manufacturer", manufacturer);
        return "manufacturerInfo";
    }

    @GetMapping("/manufacturerList/{id}/update")
    public String getUpdateManufacturer(Model model,
                                   @PathVariable String id){
        Manufacturer manufacturer = service.getById(id);
        model.addAttribute("manufacturer", manufacturer);
        return "manufacturerUpdate";
    }

    @PostMapping("/manufacturerList/{id}/update")
    public String updateManufacturer(@PathVariable String id,
                                @RequestParam String name,
                                @RequestParam int code,
                                @RequestParam String email){
        Manufacturer manufacturer = service.getById(id);
        manufacturer.setName(name);
        manufacturer.setCode(code);
        manufacturer.setEmail(email);
        manufacturerRepository.save(manufacturer);
        return "redirect:/manufacturerList";
    }

    @GetMapping("/manufacturerList/{id}/deletePage")
    public String getDeleteManufacturer(
            @PathVariable String id){
        return "manufacturerDelete";
    }

    @GetMapping("/manufacturerList/{id}/delete")
    public String deleteManufacturer(
            @PathVariable String id){
        Manufacturer manufacturer = service.getById(id);
        manufacturerRepository.delete(manufacturer);
        return "redirect:/manufacturerList";
    }
}
