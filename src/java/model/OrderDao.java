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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class OrderDao {

    public static ArrayList<Order> getAllOrders() {
        ArrayList<Order> OrderList = new ArrayList<>();
        AccountManager am = new AccountManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [Order]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int customer_id = rs.getInt("customer_id");
                Account customer = am.getAccountById(customer_id);
                int diner_id = rs.getInt("diner_id");
                Account diner = am.getAccountById(diner_id);
                int shipper_id = rs.getInt("shipper_id");
                Account shipper = am.getAccountById(shipper_id);
                String order_status = rs.getString("order_status");
                String payment_method = rs.getString("payment_method");
                String reason = rs.getString("reason");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                int total_price =0;
                Order order = new Order(order_id, customer, diner, shipper, order_status, payment_method,reason, total_price);
                order.setCreated_at(created_at);
                order.setUpdated_at(updated_at);
                OrderList.add(order);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
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
        return OrderList;
    }
      public void updateOrderStatus(Order order) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE [Order] SET order_status = ? WHERE order_id = ?";
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
      public void updateReason(Order order) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE [Order] SET reason = ? WHERE order_id = ?";
            statement = conn.prepareStatement(query);
            statement.setString(1, order.getReason());
             
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
       public void updateShipperId(Order order) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE [Order] SET shipper_id = ? WHERE order_id = ?";
            statement = conn.prepareStatement(query);
             statement.setInt(1, order.getShipper().getAccount_id());
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
