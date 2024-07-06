/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package webSocket;
import com.google.gson.Gson;

/**
 *
 * @author lenovo
 */
public class Message {
    private int recipient;
    private String message;

    // Constructor, getters, and setters
    public Message() {
    }

    public Message(int recipient, String message) {
        this.recipient = recipient;
        this.message = message;
    }

    public int getRecipient() {
        return recipient;
    }

    public void setRecipient(int recipient) {
        this.recipient = recipient;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    // Method to parse JSON string to Message object
    public static Message fromJson(String json) {
        Gson gson = new Gson();
        return gson.fromJson(json, Message.class);
    }
    public static void main(String[] args) {
        // Chuỗi JSON đại diện cho một tin nhắn
        String json = "{\"recipient\":\"2\",\"message\":\"Hello, Alice!\"}";

        // Chuyển đổi từ JSON thành đối tượng Message
        Message message = Message.fromJson(json);

        // In ra thông tin của tin nhắn đã được chuyển đổi
        System.out.println("Recipient: " + message.getRecipient());
        System.out.println("Message: " + message.getMessage());
    }
}