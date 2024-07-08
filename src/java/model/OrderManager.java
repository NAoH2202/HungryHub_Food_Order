/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class OrderManager {
    private ArrayList<Order> List;

    public OrderManager() {
        List = OrderDao.getAllOrders();
    }
    
    public Order getOderById(int id) {
        for (Order facc : List) {
            if (id == facc.getOrder_id()) {
                return facc;
            }
        }
        return null;
    }
    public int searchOrderId(int customer, int diner, String order_status, String payment_method, double total_price, LocalDateTime created_at) {
        for (Order order : List) {
            boolean matches = true;

            // Check each parameter if not null/empty, otherwise ignore
            if (customer != 0 && order.getCustomer().getAccount_id() != customer) {
                matches = false;
            }

            if (diner != 0 && order.getDiner().getAccount_id() != diner) {
                matches = false;
            }

            if (order_status != null && !order_status.isEmpty() && !order.getOrder_status().equals(order_status)) {
                matches = false;
            }

            if (payment_method != null && !payment_method.isEmpty() && !order.getPayment_method().equals(payment_method)) {
                matches = false;
            }

            if (total_price > 0 && order.getTotal_price() != total_price) {
                matches = false;
            }

            if (created_at != null && !order.getCreated_at().equals(created_at)) {
                matches = false;
            }

            if (matches) {
                return order.getOrder_id();
            }
        }

        return -1;
    }


    public ArrayList<Order> getList() {
        return List;
    }
    
    
    public static void main(String[] args) {
        OrderManager om = new OrderManager();
        for(Order od : om.getList()){
            System.out.println(od);
        }
    }
}
