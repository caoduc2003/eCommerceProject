package com.ecommerce.controllers.socket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import com.ecommerce.DAO.OrderProductsDAO;
import com.ecommerce.models.jsonModels.WSRequest;
import com.google.gson.Gson;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/notification")
public class NotificationEndpoint {

    static Set<Session> users = Collections.synchronizedSet(new HashSet<>());
    @OnOpen
    public void onOpen(Session session) {
        users.add(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        try{
            Gson gson = new Gson();
            OrderProductsDAO dao = new OrderProductsDAO();
            WSRequest wsr = gson.fromJson(message, WSRequest.class);
            if (wsr.getAction().equals("order-toast")) {
                String orderToast = gson.toJson(dao.getOrderToastInfo(wsr.getUserID()));
                for (Session s : users) {
                    s.getBasicRemote().sendText(orderToast);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @OnClose
    public void onClose(Session session) {
        users.remove(session);
    }

    @OnError
    public void onError(Throwable e) {
        e.printStackTrace();
    }

}
