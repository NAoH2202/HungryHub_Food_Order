/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package webSocket;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import com.google.gson.Gson;

@ServerEndpoint("/orderStatus")
public class OrderStatusWebSocket {

    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static Gson gson = new Gson();

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("New connection opened: " + session.getId());
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("Connection closed: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        OrderStatusMessage orderStatusMessage = gson.fromJson(message, OrderStatusMessage.class);

        String jsonResponse = gson.toJson(orderStatusMessage);

        synchronized (clients) {
            for (Session client : clients) {
                if (client.isOpen()) {
                    client.getBasicRemote().sendText(jsonResponse);
                }
            }
        }
        System.out.println("Message received: " + message);
    }
}
