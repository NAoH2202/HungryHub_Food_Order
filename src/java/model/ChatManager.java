/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author lenovo
 */
public class ChatManager {
    private ArrayList<Chat> List;

    public ChatManager() {
        List = ChatDao.getAllChats();
    }

    public ArrayList<Chat> getList() {
        return List;
    }
    
    public Chat getChatById(int id) {
        for (Chat facc : List) {
            if (id == facc.getChat_id()) {
                return facc;
            }
        }
        return null;
    }
    public ArrayList<Chat> getChatHistory(int senderId, int receiverId) {
        ArrayList<Chat> chatHistory = new ArrayList<>();
        for (Chat chat : List) {
            if ((chat.getSender().getAccount_id() == senderId && chat.getReceiver().getAccount_id() == receiverId) ||
                (chat.getSender().getAccount_id() == receiverId && chat.getReceiver().getAccount_id() == senderId)) {
                chatHistory.add(chat);
            }
        }
        return chatHistory;
    }
    
    public static void main(String[] args) {
        ChatManager cm = new ChatManager();
        for(Chat c : cm.getChatHistory(1, 2)){
            System.out.println(c);
        }
    }
}
