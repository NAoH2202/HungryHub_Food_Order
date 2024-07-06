/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author lenovo
 */
public class Chat {
    private int chat_id;
    private Account sender;
    private Account receiver;
    private String message;
    private LocalDateTime sent_at = LocalDateTime.now();

    public Chat(int chat_id, Account sender, Account receiver, String message) {
        this.chat_id = chat_id;
        this.sender = sender;
        this.receiver = receiver;
        this.message = message;
    }

    public int getChat_id() {
        return chat_id;
    }

    public void setChat_id(int chat_id) {
        this.chat_id = chat_id;
    }

    public Account getSender() {
        return sender;
    }

    public void setSender(Account sender) {
        this.sender = sender;
    }

    public Account getReceiver() {
        return receiver;
    }

    public void setReceiver(Account receiver) {
        this.receiver = receiver;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getSent_at() {
        return sent_at;
    }

    public void setSent_at(LocalDateTime sent_at) {
        this.sent_at = sent_at;
    }

    @Override
    public String toString() {
        return "Chat{" + "chat_id=" + chat_id + ", sender=" + sender.getAccount_id() + ", receiver=" + receiver.getAccount_id() + ", message=" + message + ", sent_at=" + sent_at + '}';
    }

    
}
