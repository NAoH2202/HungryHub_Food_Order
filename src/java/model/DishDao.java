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
public class DishDao {
    public static ArrayList<Dish> getAllDishs() {
        ArrayList<Dish> DishtList = new ArrayList<>();
        AccountManager am = new AccountManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [Dish]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int dish_id = rs.getInt("dish_id");
                int account_id = rs.getInt("account_id");
                Account account = am.getAccountById(account_id);
                String name = rs.getString("name");
                String picture = rs.getString("Picture");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                String type = rs.getString("type");
                String ingredients = rs.getString("ingredients");
                boolean dislocal = rs.getBoolean("dislocal");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                Dish dish = new Dish(dish_id, account, name, picture, description, price, picture, type, ingredients, dislocal);
                dish.setCreated_at(created_at);
                dish.setUpdated_at(updated_at);

                DishtList.add(dish);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DishDao.class.getName()).log(Level.SEVERE, null, ex);
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
        return DishtList;
    }
    
}
