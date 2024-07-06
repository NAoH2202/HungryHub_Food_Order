// ChatEndpoint.java
package webSocket;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import model.Account;
import model.AccountManager;
import model.Chat;
import model.ChatDao;

@ServerEndpoint(value = "/chat", configurator = ChatEndpointConfigurator.class)
public class ChatEndpoint {

    private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
    private static final ConcurrentMap<String, Session> userSessions = new ConcurrentHashMap<>();
    private static final ConcurrentMap<String, Integer> userIdMap = new ConcurrentHashMap<>(); // Map username to userId

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        if (config.getUserProperties().get("userid") == null) {
            try {
                session.close(new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, "Unauthorized"));
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }
        int userid = (int) config.getUserProperties().get("userid");
        AccountManager am = new AccountManager();
        Account account = am.getAccountById(userid);
        userSessions.put(account.getName(), session);
        userIdMap.put(account.getName(), account.getAccount_id());
        sessions.add(session);
        System.out.println("New connection: " + session.getId() + " - " + account.getName());
    }

    @OnClose
    public void onClose(Session session) {
        sessions.remove(session);
        userSessions.values().remove(session);
        System.out.println("Connection closed: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        String username = getUsernameBySession(session);
        if (username == null) {
            session.close(new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, "Unauthorized"));
            return;
        }

        // Parse the incoming message to get the recipient and the message content
        Message incomingMessage = Message.fromJson(message);
        int receiverId = incomingMessage.getRecipient();
        String messageContent = incomingMessage.getMessage();

        // Get sender and receiver IDs
        Integer senderId = userIdMap.get(username);
        if (senderId == null) {
            session.getBasicRemote().sendText("{\"type\":\"error\", \"message\":\"Sender or receiver not found.\"}");
            return;
        }

        AccountManager am = new AccountManager();
        Account rec = am.getAccountById(receiverId);
        // Prepare the message to be sent
        String jsonMessage = String.format("{\"type\":\"received\", \"message\":\"%s\", \"sender\":\"%s\"}", messageContent.replace("\"", "\\\""), username);

        // Send the message to the recipient if they are connected
        Session recipientSession = userSessions.get(rec.getName());
        if (recipientSession != null && recipientSession.isOpen()) {
            recipientSession.getBasicRemote().sendText(jsonMessage);
        }

        // Send confirmation back to the sender
        String senderMessage = String.format("{\"type\":\"sent\", \"message\":\"%s\", \"recipient\":\"%s\"}", messageContent.replace("\"", "\\\""), username);
        session.getBasicRemote().sendText(senderMessage);

        // Save the message to the database
        Account sender = am.getAccountById(senderId);
        Account receiver = am.getAccountById(receiverId);
        Chat chat = new Chat(0, sender, receiver, messageContent.replace("\"", "\\\""));
        chat.setSent_at(LocalDateTime.now());
        ChatDao.saveChat(chat);
    }

    private String getUsernameBySession(Session session) {
        for (ConcurrentMap.Entry<String, Session> entry : userSessions.entrySet()) {
            if (entry.getValue().equals(session)) {
                return entry.getKey();
            }
        }
        return null;
    }
}
