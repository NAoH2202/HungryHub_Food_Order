/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dbconnext.ConnectDB;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class ChatDao {

    public static ArrayList<Chat> getAllChats() {
        ArrayList<Chat> ChatList = new ArrayList<>();
        AccountManager am = new AccountManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [Chat]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int chat_id = rs.getInt("chat_id");
                int sender_id = rs.getInt("sender_id");
                Account sender = am.getAccountById(sender_id);
                int receiver_id = rs.getInt("receiver_id");
                Account receiver = am.getAccountById(receiver_id);
                String message = rs.getString("message");
                LocalDateTime sent_at = rs.getTimestamp("sent_at").toLocalDateTime();
                Chat chat = new Chat(chat_id, sender, receiver, message);
                chat.setSent_at(sent_at);
                ChatList.add(chat);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ChatDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }
        return ChatList;
    }

    public static void saveChat(Chat chat) {
        ConnectDB db = ConnectDB.getInstance();
        String query = "INSERT INTO Chat (sender_id, receiver_id, message, sent_at) VALUES (?, ?, ?, ?)";

        try (Connection conn = db.openConnection();
             PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, chat.getSender().getAccount_id());
            statement.setInt(2, chat.getReceiver().getAccount_id());
            statement.setString(3, chat.getMessage());
            statement.setTimestamp(4, Timestamp.valueOf(chat.getSent_at()));

            statement.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ChatDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
