package com.local.web;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages= {"com.local.web"})
@MapperScan(value={"com.local.web"})
public class TestProjectsApplication { /* extends SpringBootServletInitializer : WAR 파일로 배포하는 경우 필요 */
	
//	private static Class<TestProjectsApplication> applicationClass = TestProjectsApplication.class; 
	
	public static void main(String[] args) { 
		SpringApplication.run(TestProjectsApplication.class, args);
	}

/*
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(applicationClass);
	}
*/
	
}