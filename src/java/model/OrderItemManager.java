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
    public ArrayList<OrderItem> getOderItemByOrderId(int id) {
        ArrayList<OrderItem> list = new ArrayList<>();
        for (OrderItem facc : List) {
            if (id == facc.getOrder_id()) {
                list.add(facc);
            }
        }
        return list;
    }
    
    public double getTotalPriceOrderId(int id){
        ArrayList<OrderItem> oiList = getOderItemByOrderId(id);
        double total = 0;
        for(OrderItem oi : oiList){
            total += oi.getPrice();
        }
        return total;
    }
     public ArrayList<OrderItem> getList() {
        return List;
    }
    public static void main(String[] args) {
        OrderItemManager om = new OrderItemManager();
        for(OrderItem o : om.getList()){
            System.out.println(o);
        }
    }
}
