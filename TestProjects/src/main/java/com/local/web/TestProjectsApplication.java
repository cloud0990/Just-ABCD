package com.local.web;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages= {"com.local.web"})
@MapperScan(value={"com.local.web"})
public class TestProjectsApplication {
	public static void main(String[] args) {
		SpringApplication.run(TestProjectsApplication.class, args);
	}
}