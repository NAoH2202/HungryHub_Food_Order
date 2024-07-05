/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package webSocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.Session;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author lenovo
 */
@ServerEndpoint("/endpoint")
public class OrderTrackingWebSocket {
private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());

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
        // This example simply echoes the received message
        // In a real application, you'd handle the message appropriately
        System.out.println("Received message: " + message);
        for (Session client : clients) {
            if (client.isOpen()) {
                client.getBasicRemote().sendText("Echo from server: " + message);
            }
        }
    }

    // Method to send updates to all connected clients
    public static void sendOrderUpdate(String update) throws IOException {
        for (Session client : clients) {
            if (client.isOpen()) {
                client.getBasicRemote().sendText(update);
            }
        }
    }
}
