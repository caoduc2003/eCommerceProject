package com.ecommerce.controllers;

import com.ecommerce.DAO.CartDAO;
import com.ecommerce.models.jsonModels.WSRequest;
import com.ecommerce.models.jsonModels.WSCartUpdate;
import com.google.gson.Gson;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/cart-preview")
public class CartEndpoint {
    static Set<Session> users = Collections.synchronizedSet(new HashSet<>());
    @OnOpen
    public void onOpen(Session session) {
        users.add(session);
        System.out.println("Active Connections: " + users.size());
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        try {
            Gson gson = new Gson();
            WSRequest wscr = gson.fromJson(message, WSRequest.class);
            CartDAO dao = new CartDAO();
            if (wscr.getAction().equals("update-cart")) {
                int itemCount = dao.getTotalCartItemsByUserID(wscr.getUserID());
                int cartTotal = dao.getTotalCartItemsPriceByUserID(wscr.getUserID());
                String cartUpdate = gson.toJson(new WSCartUpdate(itemCount, cartTotal));
                for (Session s : users) {
                    s.getBasicRemote().sendText(cartUpdate);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @OnError
    public void onError(Throwable e) {
        e.printStackTrace();
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("Close Connection ...");
        users.remove(session);
    }
}
