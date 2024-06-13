/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import static java.nio.file.Files.list;
import java.util.ArrayList;
import static java.util.Collections.list;

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
     public ArrayList<OrderItem> getOderItemByOrderId(int id) {
        ArrayList<OrderItem> listOI = new ArrayList<>();
        for (OrderItem orderItem : List) {
            if (id == orderItem.getOrder().getOrder_id()) {
                listOI.add(orderItem);
            }
        }
        return listOI;
    }
     public ArrayList<OrderItem> getList() {
        return List;
    }
     
     
    public static void main(String[] args) {
        OrderManager om = new OrderManager();
        for(Order o : om.getList()){
            System.out.println(o);
        }
    }
}
