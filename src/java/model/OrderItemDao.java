/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dbconnext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class OrderItemDao {
    public static ArrayList<OrderItem> getAllOrderItems() {
        ArrayList<OrderItem> OrderItemList = new ArrayList<>();
        OrderManager om = new OrderManager();
        DishManager dm = new DishManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [OrderItem]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                 int order_item_id = rs.getInt("order_item_id");
                int order_id = rs.getInt("order_id");
                Order order = om.getOderById(order_id);
                int dish_id = rs.getInt("dish_id");
                Dish dish = dm.getDishById(dish_id);
                int quantity = rs.getInt("quantity");
 //               double price = rs.getDouble("price");
                Date created_at = rs.getTimestamp("created_at");
                Date updated_at = rs.getTimestamp("updated_at");
                OrderItem orderItem = new OrderItem(order_item_id, order, dish, quantity);
                orderItem.setCreated_at(created_at);
                orderItem.setUpdated_at(updated_at);
                OrderItemList.add(orderItem);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderItemDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }
        return OrderItemList;
    }
    
    public void updateOrderStatus(Order order) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE [Order] SET order_status = ?, updated_at = ? WHERE order_id = ?";
            statement = conn.prepareStatement(query);
            statement.setString(1, order.getOrder_status());
             
            statement.setInt(2, order.getOrder_id());
            statement.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }
}
