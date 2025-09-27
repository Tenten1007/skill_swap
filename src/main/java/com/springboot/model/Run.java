package com.springboot.model;

import org.springframework.boot.SpringApplication;

import com.springboot.SpringBootApplicationMain;

/**
 * Simple launcher class for the Skill Swap application.
 *
 * Data initialization is automatically handled by DataInitializer.java
 * when the Spring Boot application starts up.
 */
public class Run {

	public static void main(String[] args) {
		// Launch Spring Boot application
		SpringApplication.run(SpringBootApplicationMain.class, args);
	}
}