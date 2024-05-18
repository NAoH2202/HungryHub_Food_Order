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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class AccountDAO {
    public static ArrayList<Account> getAllAccounts() {
        ArrayList<Account> AccountList = new ArrayList<>();
        int id, role;
        String username, password, displayname,gender,phone,email,bd;
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [User]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                role = rs.getInt("role");
                username = rs.getString("username");
                password = rs.getString("password");
                displayname = rs.getString("name");
                gender = rs.getString("Gender");
                phone = rs.getString("PhoneNumber");
                email = rs.getString("email");
                bd = rs.getString("BirthDay");

                Account Acc = new Account(id,role, username, password, displayname, gender, phone, email, bd);
                AccountList.add(Acc);
            }
        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return AccountList;
    }
    
    public static void updateAccount(Account ac) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [User]";
            statement = conn.prepareStatement(query);
            statement.setString(1, query);
            statement.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    }
}
