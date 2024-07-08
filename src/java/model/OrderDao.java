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
        OrderItemManager otm = new OrderItemManager();
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
                int diner_id = rs.getInt("Diner_id");
                Account diner = am.getAccountById(diner_id);
                int shipper_id = rs.getInt("shipper_id");
                Account shipper = am.getAccountById(shipper_id);
                String order_status = rs.getString("order_status");
                String payment_method = rs.getString("payment_method");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                double total_price = otm.getTotalPriceOrderId(order_id);
                Order order = new Order(order_id, customer, diner, shipper, order_status, payment_method, total_price);
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

    public static int addOrder(Order order) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "INSERT INTO [Order] (customer_id, diner_id, order_status, payment_method, created_at, updated_at) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            statement = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setInt(1, order.getCustomer().getAccount_id());
            statement.setInt(2, order.getDiner().getAccount_id());
            statement.setString(3, order.getOrder_status());
            statement.setString(4, order.getPayment_method());
            statement.setTimestamp(5, java.sql.Timestamp.valueOf(order.getCreated_at()));
            statement.setTimestamp(6, java.sql.Timestamp.valueOf(order.getUpdated_at()));
            statement.executeUpdate();
            rs = statement.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
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

        return -1;
    }

    public static boolean updateOrderStatus1(int orderId, String newOrderStatus) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE [Order] SET order_status = ? WHERE order_id = ?";
            statement = conn.prepareStatement(query);
            statement.setString(1, newOrderStatus);
            statement.setInt(2, orderId);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
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
        return false;
    }

}
