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
 * @author lenovo
 */
public class FollowerDao {
    public static ArrayList<Follower> getAllFollowers() {
        ArrayList<Follower> FollowerList = new ArrayList<>();
        AccountManager am = new AccountManager();
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
                int follower_id = rs.getInt("follower_id");
                int account_id = rs.getInt("account_id");
                Account account = am.getAccountById(account_id);
                int followerUser_id = rs.getInt("followerUser_id");
                Account follower = am.getAccountById(followerUser_id);
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();

                Follower fl = new Follower(follower_id, account, follower);
                fl.setCreated_at(created_at);
                FollowerList.add(fl);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FollowerDao.class.getName()).log(Level.SEVERE, null, ex);
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
        return FollowerList;
    }
}
