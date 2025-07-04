package ru.cloudstorage.storage.api.controllers;

import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class SwaggerTestController {

    @Operation(summary = "Test endpoint")
    @GetMapping("/test")
    public String test() {
        return "test";
    }
}
