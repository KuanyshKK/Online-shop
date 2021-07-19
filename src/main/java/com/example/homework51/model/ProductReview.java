package com.example.homework51.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ProductReview {
    private String reviewerName;
    private String reviewerSurname;
    private String reviewerEmail;
    private String reviewerPhoneNumber;
    private int rate;
    private String comment;
}
