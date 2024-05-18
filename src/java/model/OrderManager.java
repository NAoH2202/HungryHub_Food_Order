/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class OrderManager {
     ArrayList<Order> List;

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
}
