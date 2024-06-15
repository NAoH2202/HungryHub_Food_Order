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
                int dish_id = rs.getInt("dish_id");
                Dish dish = dm.getDishById(dish_id);
                int quantity = rs.getInt("quantity");
                double price = rs.getInt("price");
                Date created_at = rs.getTimestamp("created_at");
                Date updated_at = rs.getTimestamp("updated_at");
                OrderItem orderItem = new OrderItem(order_item_id, order_id, dish, quantity, price);
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
    public static void addOrderItem(OrderItem orderItem) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        
        try {
            conn = db.openConnection();
            String query = "INSERT INTO OrderItem (order_id, dish_id, quantity) VALUES (?, ?, ?)";
            statement = conn.prepareStatement(query);
            statement.setInt(1, orderItem.getOrder_id());
            statement.setInt(2, orderItem.getDish().getDish_id());
            statement.setInt(3, orderItem.getQuantity());
            
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new order item was inserted successfully.");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderItemDao.class.getName()).log(Level.SEVERE, "Error executing SQL: " , ex);
        } finally {
            try {
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                Logger.getLogger(OrderItemDao.class.getName()).log(Level.WARNING, "Error closing database resources", e);
            }
        }
    }
}
