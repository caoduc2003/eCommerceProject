package com.ecommerce.controllers;

import com.ecommerce.models.User;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/cart-preview")
public class CartEndpoint {
    @OnOpen
    public void onOpen(Session session) {
        String sessionId = session.getId();
        System.out.println("Open Connection ... " + sessionId);
//        // Get cart data for user
//        int cartCount = getCartCount(session.getId());
//        double total = getCartTotal(session.getId());
//
//        // Send initial data
//        session.getBasicRemote().sendText(jsonData);

    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("Message from the client: " + message);
    }

    @OnError
    public void onError(Throwable e) {
        e.printStackTrace();
    }

    @OnClose
    public void onClose() {
        System.out.println("Close Connection ...");
    }
}
