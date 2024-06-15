/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import dbconnext.ConnectDB;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class CartItemDao {
    public static ArrayList<CartItem> getAllCartItems() {
        ArrayList<CartItem> cartItemList = new ArrayList<>();
        CartManager cm = new CartManager();
        DishManager dm = new DishManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM CartItem";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            
            while (rs.next()) {
                int cart_item_id = rs.getInt("cart_item_id");
                int cart_id = rs.getInt("cart_id");
                Cart cart = cm.getCartById(cart_id);
                int dish_id = rs.getInt("dish_id");
                Dish dish = dm.getDishById(dish_id);
                int quantity = rs.getInt("quantity");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                
                CartItem cartItem = new CartItem(cart_item_id, cart, dish, quantity);
                cartItem.setCreated_at(created_at);
                cartItem.setUpdated_at(updated_at);
                cartItemList.add(cartItem);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CartItemDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) rs.close();
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(CartItemDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return cartItemList;
    }

    public static boolean addCartItem(CartItem cartItem) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        
        try {
            conn = db.openConnection();
            String query = "INSERT INTO CartItem (cart_id, dish_id, quantity) VALUES (?, ?, ?)";
            statement = conn.prepareStatement(query);
            statement.setInt(1, cartItem.getCart().getCartId());
            statement.setInt(2, cartItem.getDish().getDish_id());
            statement.setInt(3, cartItem.getQuantity());
            
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CartItemDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(CartItemDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return false;
    }
}
