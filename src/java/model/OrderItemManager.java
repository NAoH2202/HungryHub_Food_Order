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
public class OrderItemManager {
         private  ArrayList<OrderItem> List;

    public OrderItemManager() {
        List = OrderItemDao.getAllOrderItems();
    }
    public OrderItem getOderItemById(int id) {
        for (OrderItem facc : List) {
            if (id == facc.getOrder_item_id()) {
                return facc;
            }
            
        }
        return null;
    }
     public ArrayList<OrderItem> getList() {
        return List;
    }
}
