/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author lenovo
 */
public class OrderItem {
    private int order_item_id;
    private int order_id;
     
    private int dishId;
    private String dishName;
    private String dishPicture;
    private String dishDescription;
    private int dishPrice;
    private String dishType;
    private String dishIngredients;
    
    private int quantity;
    private int price;
    private Date created_at = new Date();
    private Date updated_at = new Date();

    public OrderItem() {
    }

    public OrderItem(int order_item_id, int order_id,int dishId, String dishName, String dishPicture, String dishDescription, int dishPrice, String dishType, String dishIngredients, int quantity, int price) {
        this.order_item_id = order_item_id;
        this.dishId = dishId;
        this.order_id = order_id;
        this.dishName = dishName;
        this.dishPicture = dishPicture;
        this.dishDescription = dishDescription;
        this.dishPrice = dishPrice;
        this.dishType = dishType;
        this.dishIngredients = dishIngredients;
        this.quantity = quantity;
        this.price = price;
    }
 
    public OrderItem(int order_item_id,int dishId, String dishName, String dishPicture, String dishDescription, int dishPrice, String dishType, String dishIngredients, int quantity, int price) {
        this.order_item_id = order_item_id;
        this.dishId = dishId;
        this.dishName = dishName;
        this.dishPicture = dishPicture;
        this.dishDescription = dishDescription;
        this.dishPrice = dishPrice;
        this.dishType = dishType;
        this.dishIngredients = dishIngredients;
        this.quantity = quantity;
        this.price = price;
    }
    
 
    public int getOrder_item_id() {
        return order_item_id;
    }

    public void setOrder_item_id(int order_item_id) {
        this.order_item_id = order_item_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }
    
    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public String getDishPicture() {
        return dishPicture;
    }

    public void setDishPicture(String dishPicture) {
        this.dishPicture = dishPicture;
    }

    public String getDishDescription() {
        return dishDescription;
    }

    public void setDishDescription(String dishDescription) {
        this.dishDescription = dishDescription;
    }

    public int getDishPrice() {
        return dishPrice;
    }

    public void setDishPrice(int dishPrice) {
        this.dishPrice = dishPrice;
    }

    public String getDishType() {
        return dishType;
    }

    public void setDishType(String dishType) {
        this.dishType = dishType;
    }

    public String getDishIngredients() {
        return dishIngredients;
    }

    public void setDishIngredients(String dishIngredients) {
        this.dishIngredients = dishIngredients;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "order_item_id=" + order_item_id + ", order_id=" + order_id + ", dishName=" + dishName + ", dishPicture=" + dishPicture + ", dishDescription=" + dishDescription + ", dishPrice=" + dishPrice + ", dishType=" + dishType + ", dishIngredients=" + dishIngredients + ", quantity=" + quantity + ", price=" + price + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
}
