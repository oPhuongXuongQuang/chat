package com.fsoft.chat.service;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

@Service
@Scope(WebApplicationContext.SCOPE_REQUEST)
public class ChatService {
	public String example;
	public ChatService(){
		example = "Hello world!";
	}
	
	
}
