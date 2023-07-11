package com.local.web.common.handler;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class EchoHandler extends TextWebSocketHandler{
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    //클라이언트가 연결 되었을 때 실행
    @Override
    @OnOpen
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	sessionList.add(session);
        logger.info("{} 연결", session.getId()); 
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    @OnMessage
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{} : {}", session.getId(), message.getPayload());
        
//        Map<sesseion, WebSocketMessage> resultData = new HashMap<>();
//        resultData.put("message", message.getPayload());
        
        //모든 유저에게 메세지 출력
        for(WebSocketSession webSocketSession : sessionList){
        	webSocketSession.sendMessage(new TextMessage(message.getPayload()));
//        	webSocketSession.sendMessage(resultData);
        }
    }
    
    //클라이언트 연결을 끊었을 때 실행
    @Override
    @OnClose
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} 연결 종료", session.getId());
    }

}
