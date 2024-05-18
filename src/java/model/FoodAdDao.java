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
public class FoodAdDao {
    public static ArrayList<FoodAd> getAllFoodAds() {
        ArrayList<FoodAd> FoodAdList = new ArrayList<>();
        AccountManager am = new AccountManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [FoodAd]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int ad_id = rs.getInt("ad_id");
                int dinner_manager_id = rs.getInt("dinner_manager_id");
                Account account = am.getAccountById(dinner_manager_id);
                String title = rs.getString("title");
                String content = rs.getString("content");
                String image_url = rs.getString("image_url");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                FoodAd foodAd = new FoodAd(ad_id, account, title, content, image_url);
                foodAd.setCreated_at(created_at);
                foodAd.setUpdated_at(updated_at);

                FoodAdList.add(foodAd);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodAdDao.class.getName()).log(Level.SEVERE, null, ex);
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
        return FoodAdList;
    }
}
