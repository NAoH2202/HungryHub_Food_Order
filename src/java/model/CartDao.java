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
public class CartDao {
    public static ArrayList<Cart> getAllCarts() {
        AccountManager am = new AccountManager();
        ArrayList<Cart> cartList = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM Cart";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            
            while (rs.next()) {
                int cart_id = rs.getInt("cart_id");
                int account_id = rs.getInt("account_id");
                Account customer = am.getAccountById(account_id);
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                
                Cart cart = new Cart(cart_id, customer);
                cart.setCreated_at(created_at);
                cart.setUpdated_at(updated_at);
                cartList.add(cart);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CartDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) rs.close();
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(CartDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return cartList;
    }

    public static boolean addCart(Cart cart) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        
        try {
            conn = db.openConnection();
            String query = "INSERT INTO Cart (account_id) VALUES (?)";
            statement = conn.prepareStatement(query);
            statement.setInt(1, cart.getCustomer().getAccount_id());
            
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CartDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(CartDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return false;
    }
}
