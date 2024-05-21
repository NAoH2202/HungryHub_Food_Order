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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class AccountDao {

    public static ArrayList<Account> getAllAccounts() {
        ArrayList<Account> AccountList = new ArrayList<>();
        int account_id;
        String username;
        String password;
        String name;
        String email;
        String phoneNumber;
        String address;
        String date_of_birth;
        boolean active_status = true;
        String profile_picture;
        String role;
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM Account";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                account_id = rs.getInt("account_id");
                username = rs.getString("username");
                password = rs.getString("password");
                name = rs.getString("name");
                email = rs.getString("email");
                phoneNumber = rs.getString("PhoneNumber");
                address = rs.getString("address");
                role = rs.getString("role");
                date_of_birth = rs.getString("date_of_birth");
                active_status = rs.getBoolean("active_status");
                profile_picture = rs.getString("profile_picture");
                Account Acc = new Account(account_id, username, password, name, email, phoneNumber, address, date_of_birth, profile_picture, role, active_status);
                AccountList.add(Acc);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
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
    public static boolean updateAccount(Account account) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE Account SET username = ?, password = ?, name = ?, email = ?, PhoneNumber = ?, address = ?, date_of_birth = ?, profile_picture = ?, role = ?, active_status = ? WHERE account_id = ?";
            statement = conn.prepareStatement(query);
            statement.setString(1, account.getUsername());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getName());
            statement.setString(4, account.getEmail());
            statement.setString(5, account.getPhoneNumber());
            statement.setString(6, account.getAddress());
            statement.setString(7, account.getDate_of_birth());
            statement.setString(8, account.getProfile_picture());
            statement.setString(9, account.getRole());
            statement.setBoolean(10, account.isActive_status());
            statement.setInt(11, account.getAccount_id());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return false;
    }

    public static boolean addAccount(Account account) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "INSERT INTO Account (username, password, name, email, PhoneNumber, address, date_of_birth, profile_picture, role, active_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, account.getUsername());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getName());
            statement.setString(4, account.getEmail());
            statement.setString(5, account.getPhoneNumber());
            statement.setString(6, account.getAddress());
            statement.setString(7, account.getDate_of_birth());
            statement.setString(8, account.getProfile_picture());
            statement.setString(9, account.getRole());
            statement.setBoolean(10, account.isActive_status());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return false;
    }

    public static void edit(Account ac) {
        String sql = """
                    UPDATE contacts
                    SET Name=?, Email=?, Adress = ?, PhoneNumber=?
                    WHERE id = ?""";
        ConnectDB db = ConnectDB.getInstance();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, ac.getName());
            statement.setString(2, ac.getEmail());
            statement.setString(3, ac.getAddress());
            statement.setString(4, ac.getPhoneNumber());
            statement.setInt(5, ac.getAccount_id());
            statement.executeUpdate();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        ArrayList<Account> test = AccountDao.getAllAccounts();
        Account sc = test.get(0);
        sc.setPhoneNumber("091111111111");
        AccountDao.updateAccount(sc);
    }
}
