package com.local.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.local.web.common.interceptor.TestInterceptor;

@SuppressWarnings("deprecation") //경고 무시
@Configuration	
@ComponentScan("com.local.web")
//@EnableWebMvc : 스프링부트의 기본적인 웹 MVC기능들을 제외하고 처음부터 생성한다.
public class WebConfig extends WebMvcConfigurerAdapter implements WebMvcConfigurer {

	@Value("${spring.profiles.active}")
	String profiles;
	
//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		
//		if("local".equals(profiles)) {
//			registry.addResourceHandler("/assets/plugin/**").addResourceLocations("/assets/dev/js/");
//			registry.addResourceHandler("/assets/css/**").addResourceLocations("/assets/dev/css/");
//		}else {
//			registry.addResourceHandler("/assets/plugin/**").addResourceLocations("/assets/" + profiles + "/plugin/");
//			registry.addResourceHandler("/assets/css/**").addResourceLocations("/assets/" + profiles + "/css/");
//		}
//		super.addResourceHandlers(registry);
//	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		// "/"에 해당하는 url mapping을 setViewName으로 forward
		registry.addViewController("/").setViewName("forward:/main");
		// 우선순위를 가장 높게 잡는다.
		registry.setOrder( Ordered.HIGHEST_PRECEDENCE );
		super.addViewControllers(registry);
	}

	@Autowired
	private TestInterceptor testInterceptor;
	
	// addPathPatterns     : 해당 경로에 접근하기 전, 인터셉터가 가로챈다.
	// excludePathPatterns : 해당 경로는 인터셉터가 가로채지 않는다.
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(testInterceptor)
		.addPathPatterns("/**")
		.excludePathPatterns("*.css")
		.excludePathPatterns("*.js")
		.excludePathPatterns("/assets/plugin/js/jqgird/**")
		.excludePathPatterns("/assets/css/**")
		.excludePathPatterns("/assets/common/**")
		.excludePathPatterns("/assets/dev/**")
		.excludePathPatterns("/login")
		.excludePathPatterns("/autoComplete")
		.excludePathPatterns("/logout")
		.excludePathPatterns("/checkLoginUser") //회원체크
		.excludePathPatterns("/signUp/view")    //회원가입 페이지 forword
		.excludePathPatterns("/signUp/**");     //insertUser
	}
}