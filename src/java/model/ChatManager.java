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
    ArrayList<Chat> List;

    public ChatManager() {
        List = ChatDao.getAllChats();
    }
    
    public Chat getChatById(int id) {
        for (Chat facc : List) {
            if (id == facc.getChat_id()) {
                return facc;
            }
        }
        return null;
    }
}
