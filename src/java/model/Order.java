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
public class Order {
    private int order_id;
    private int customer_id;
    private int diner_id;
    private int shipper_id;
    private String order_status;
    private String payment_method;
    private double total_price;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();

    public Order(int order_id, int customer_id, int diner_id, int shipper_id, String order_status, String payment_method, double total_price) {
        this.order_id = order_id;
        this.customer_id = customer_id;
        this.diner_id = diner_id;
        this.shipper_id = shipper_id;
        this.order_status = order_status;
        this.payment_method = payment_method;
        this.total_price = total_price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getDiner_id() {
        return diner_id;
    }

    public void setDiner_id(int diner_id) {
        this.diner_id = diner_id;
    }

    public int getShipper_id() {
        return shipper_id;
    }

    public void setShipper_id(int shipper_id) {
        this.shipper_id = shipper_id;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public LocalDateTime getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(LocalDateTime updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", customer_id=" + customer_id + ", diner_id=" + diner_id + ", shipper_id=" + shipper_id + ", order_status=" + order_status + ", payment_method=" + payment_method + ", total_price=" + total_price + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
    
}
