package com.myweb.www.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class StompConfig implements WebSocketMessageBrokerConfigurer {
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        //클라이언트로 메세지를 응답 해 줄 때 prefix 정의 - 클라이언트가 메세지를 받을 때
        registry.enableSimpleBroker("/sub"); //ex) stomp.subscribe("/sub/chat/room/",function(){})
        //클라이언트에서 메세지 송신 시 붙일 prefix 정의 - 클라이언트가 메세지를 보낼때
        registry.setApplicationDestinationPrefixes("/pub"); //ex) stomp.send("/sub/chat/room/",function(){})
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        //the url is for Websocket handshake
        registry.addEndpoint("/echo") //handshake가 될 endpoint지정
                .withSockJS(); //SockJS사용
    }
}