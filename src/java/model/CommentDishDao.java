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
public class CommentDishDao {
    public static ArrayList<CommentDish> getAllCommentDishs() {
        ArrayList<CommentDish> CommentDishList = new ArrayList<>();
        AccountManager am = new AccountManager();
        DishManager dm = new DishManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [Comment]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int comment_id = rs.getInt("comment_id");
                int account_id = rs.getInt("account_id");
                Account account = am.getAccountById(account_id);
                int dish_id = rs.getInt("dish_id");
                Dish dish = dm.getDishById(dish_id);
                String content = rs.getString("content");
                int rating = rs.getInt("rating");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                CommentDish comment = new CommentDish(comment_id, account, dish, content, rating);
                comment.setCreated_at(created_at);
                comment.setUpdated_at(updated_at);
                
                CommentDishList.add(comment);                
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CommentDishDao.class.getName()).log(Level.SEVERE, null, ex);
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
        return CommentDishList;
    }
}
