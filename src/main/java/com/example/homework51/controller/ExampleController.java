package com.example.homework51.controller;


import com.example.homework51.exception.StorageFileNotFoundException;
import com.example.homework51.model.FileExample;
import com.example.homework51.repository.FileExampleRepository;
import com.example.homework51.service.StorageService;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ExampleController {
    private final StorageService service;
    private final FileExampleRepository exampleRepository;

    public ExampleController(StorageService service, FileExampleRepository exampleRepository) {
        this.service = service;
        this.exampleRepository = exampleRepository;
    }


    @PostMapping("/files")
    public String uploadFileHandler(@RequestParam String productId,
                                    @RequestParam("file")MultipartFile file){
        service.store(file);
        exampleRepository.save(new FileExample(file.getOriginalFilename()));
        return "redirect:/product";
    }

    @GetMapping("/files/{filename:.+}")
    public ResponseEntity<Resource> getFile(@PathVariable String filename) {
        Resource file = service.loadAsResource(filename);
        return ResponseEntity.ok().header(
                HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename= \"" + file.getFilename() + "\"")
                .body(file);
    }
    @ExceptionHandler(StorageFileNotFoundException.class)
    public ResponseEntity<?> fileNotFound(StorageFileNotFoundException e){
        return ResponseEntity.notFound().build();
    }
}
