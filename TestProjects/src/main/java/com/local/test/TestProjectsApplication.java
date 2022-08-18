package com.local.test;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages= {"com.local.test"})
@MapperScan(value={"com.local.test"})
public class TestProjectsApplication {
	public static void main(String[] args) {
		SpringApplication.run(TestProjectsApplication.class, args);
	}
}