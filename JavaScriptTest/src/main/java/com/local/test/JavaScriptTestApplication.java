package com.local.test;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages= {"com.local.test"})
@MapperScan(value={"com.local.test"})
public class JavaScriptTestApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(JavaScriptTestApplication.class, args);
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(JavaScriptTestApplication.class);
	}

}
