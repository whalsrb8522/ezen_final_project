package com.myweb.www.config;

import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

public class WebSocketConfig implements WebSocketMessageBrokerConfigurer  {

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/chat/text")
        .setAllowedOrigins("http://localhost:8088")
        .withSockJS();
	}
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
	    // Client 에서 SEND 요청을 처리
	    //Spring docs 에서는 /topic, /queue로 나오나 편의상 /pub, /sub로 변경
		
        registry.setApplicationDestinationPrefixes("/pub");
        //해당 경로로 SimpleBroker를 등록.
        // SimpleBroker는 해당하는 경로를 SUBSCRIBE하는 Client에게 메세지를 전달하는 간단한 작업을 수행
        
        registry.enableSimpleBroker("/sub");
        //enableStompBrokerRelay
        //SimpleBroker의 기능과 외부 Message Broker( RabbitMQ, ActiveMQ 등 )에 메세지를 전달하는 기능을 가짐
    }
}
