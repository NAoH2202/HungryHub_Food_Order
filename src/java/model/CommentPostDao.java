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
public class CommentPostDao {
    public static ArrayList<CommentPost> getAllCommentPosts() {
        ArrayList<CommentPost> CommentPostList = new ArrayList<>();
        AccountManager am = new AccountManager();
        FoodAdManager fam = new FoodAdManager();
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
                int comment_id = rs.getInt("comment_id");
                int account_id = rs.getInt("account_id");
                Account account = am.getAccountById(account_id);
                int post_id = rs.getInt("post_id");
                FoodAd post = fam.getFoodAdById(post_id);
                String content = rs.getString("content");
                int rating = rs.getInt("rating");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();

                // Tạo đối tượng CommentPost và thêm vào danh sách
                CommentPost commentPost = new CommentPost(comment_id, account, post, content, rating);
                commentPost.setCreated_at(created_at);
                commentPost.setUpdated_at(updated_at);

                CommentPostList.add(commentPost);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CommentPostDao.class.getName()).log(Level.SEVERE, null, ex);
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
        return CommentPostList;
    }
}
