package com.local.web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.local.web.common.handler.EchoHandler;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	/* Chrome Simple WebSocket Client 사용하기위해 만든 Handler */
    //private final WebSocketHandler webSocketHandler;
	
    /* 직접 구현한 핸들러 클래스 */
	private final EchoHandler echoHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        /* 직접 구현한 핸들러를 넣고, URL 매핑 */
    	registry.addHandler(echoHandler, "/chat/main/echo").setAllowedOrigins("*").withSockJS();
    }
}