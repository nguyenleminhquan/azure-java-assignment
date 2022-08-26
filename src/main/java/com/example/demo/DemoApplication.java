package com.example.demo;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@SpringBootApplication
@RestController
public class DemoApplication {

	@GetMapping("/")
	String home() {
		return "<h2>Hello World</h2><h2>Real Madrid</h2><h2>Run Dev</h2>";
	}

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}
}