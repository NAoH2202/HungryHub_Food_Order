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
public class VoucherDao {
    public static ArrayList<Voucher> getAllVouchers() {
        ArrayList<Voucher> VoucherList = new ArrayList<>();
        AccountManager am = new AccountManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [Voucher]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int voucher_id = rs.getInt("voucher_id");
                String code = rs.getString("code");
                double discount_percentage = rs.getDouble("discount_percentage");
                Date valid_from = rs.getTimestamp("valid_from");
                Date valid_to = rs.getTimestamp("valid_to");
                int created_by = rs.getInt("created_by");
                Account cb = am.getAccountById(created_by);
                Date expiration_date = rs.getTimestamp("expiration_date");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                
                Voucher voucher = new Voucher(voucher_id, code, discount_percentage, valid_from, valid_to, cb, expiration_date);
                voucher.setCreated_at(created_at);
                voucher.setUpdated_at(updated_at);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(VoucherDao.class.getName()).log(Level.SEVERE, null, ex);
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
        return VoucherList;
    }
}
