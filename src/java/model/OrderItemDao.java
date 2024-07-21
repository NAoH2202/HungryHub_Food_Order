/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dbconnext.ConnectDB;
import java.sql.Timestamp;
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

        String query = "SELECT * FROM [OrderItem]";
        try (Connection conn = ConnectDB.getInstance().openConnection(); PreparedStatement statement = conn.prepareStatement(query); ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                int order_item_id = rs.getInt("order_item_id");
                int order_id = rs.getInt("order_id");
                int dish_id = rs.getInt("Dish_id");
                Dish dish = dm.getDishById(dish_id);

                String dishName = rs.getString("Dish_name");
                String dishPicture = rs.getString("Dish_Picture");
                String dishDescription = rs.getString("Dish_description");
                int dishPrice = rs.getInt("Dish_price");
                String dishType = rs.getString("Dish_type");
                String dishIngredients = rs.getString("Dish_ingredients");

                int quantity = rs.getInt("quantity");
                int price = rs.getInt("price");
                Date created_at = rs.getTimestamp("created_at");
                Date updated_at = rs.getTimestamp("updated_at");

                OrderItem orderItem = new OrderItem(order_item_id, order_id, dish_id, dishName, dishPicture, dishDescription, dishPrice, dishType, dishIngredients, quantity, price);
                orderItem.setCreated_at(created_at);
                orderItem.setUpdated_at(updated_at);

                OrderItemList.add(orderItem);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderItemDao.class.getName()).log(Level.SEVERE, null, ex);
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
            statement.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            statement.setInt(3, order.getOrder_id());
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

    public static boolean addOrderItem(OrderItem orderItem) {
        String query = "INSERT INTO [OrderItem] (order_id, Dish_id, Dish_name, Dish_Picture, Dish_description, Dish_price, Dish_type, Dish_ingredients, quantity, price, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectDB.getInstance().openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, orderItem.getOrder_id());
            statement.setInt(2, orderItem.getDishId());
            statement.setString(3, orderItem.getDishName());
            statement.setString(4, orderItem.getDishPicture());
            statement.setString(5, orderItem.getDishDescription());
            statement.setInt(6, orderItem.getDishPrice());
            statement.setString(7, orderItem.getDishType());
            statement.setString(8, orderItem.getDishIngredients());
            statement.setInt(9, orderItem.getQuantity());
            statement.setInt(10, orderItem.getPrice());
            statement.setTimestamp(11, new Timestamp(orderItem.getCreated_at().getTime()));
            statement.setTimestamp(12, new Timestamp(orderItem.getUpdated_at().getTime()));

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderItemDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
