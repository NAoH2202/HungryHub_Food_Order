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
    private Order order;
    private Dish dish;
    private int quantity;
    private double price;
    private Date created_at = new Date();
    private Date updated_at = new Date();

    public OrderItem(int order_item_id, Order order, Dish dish, int quantity, double price) {
        this.order_item_id = order_item_id;
        this.order = order;
        this.dish = dish;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrder_item_id() {
        return order_item_id;
    }

    public void setOrder_item_id(int order_item_id) {
        this.order_item_id = order_item_id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
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
        return "OrderItem{" + "order_item_id=" + order_item_id + ", order=" + order + ", dish=" + dish + ", quantity=" + quantity + ", price=" + price + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
}
