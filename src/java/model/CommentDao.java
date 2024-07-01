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
import java.sql.Timestamp;

/**
 *
 * @author lenovo
 */
public class CommentDao {

    public static ArrayList<Comment> getAllComments() {
        ArrayList<Comment> CommentDishList = new ArrayList<>();
        AccountManager am = new AccountManager();
        DishManager dm = new DishManager();
        FoodAdManager fam = new FoodAdManager();
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
                int diner_id = rs.getInt("diner_id");
                Account diner = am.getAccountById(diner_id);
                int Post_id = rs.getInt("Post_id");
                FoodAd Post = fam.getFoodAdById(Post_id);
                String content = rs.getString("content");
                int rating = rs.getInt("rating");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                Comment comment = new Comment(comment_id, account, dish, diner, Post, content, rating);
                comment.setCreated_at(created_at);
                comment.setUpdated_at(updated_at);

                CommentDishList.add(comment);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CommentDao.class.getName()).log(Level.SEVERE, null, ex);
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

    // Phương thức thêm bình luận cho khách hàng
    public static boolean addCommentDiner(Comment cm) {
        String query = "INSERT INTO [Comment] (account_id, diner_id, content, rating, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)";
        LocalDateTime now = LocalDateTime.now();

        try (Connection conn = ConnectDB.getInstance().openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, cm.getAccount().getAccount_id());
            statement.setInt(2, cm.getDiner().getAccount_id());
            statement.setString(3, cm.getContent());
            statement.setInt(4, cm.getRating());
            statement.setTimestamp(5, Timestamp.valueOf(now));
            statement.setTimestamp(6, Timestamp.valueOf(now));

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CommentDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    // Phương thức thêm bình luận cho món ăn
    public static boolean addCommentDish(Comment cm) {
        String query = "INSERT INTO [Comment] (account_id, dish_id, content, rating, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)";
        LocalDateTime now = LocalDateTime.now();

        try (Connection conn = ConnectDB.getInstance().openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, cm.getAccount().getAccount_id());
            statement.setInt(2, cm.getDish().getDish_id());
            statement.setString(3, cm.getContent());
            statement.setInt(4, cm.getRating());
            statement.setTimestamp(5, Timestamp.valueOf(now));
            statement.setTimestamp(6, Timestamp.valueOf(now));

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CommentDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    // Phương thức thêm bình luận cho bài đăng quảng cáo
    public static boolean addCommentPost(Comment cm) {
        String query = "INSERT INTO [Comment] (account_id, post_id, content, created_at, updated_at) VALUES (?, ?, ?, ?, ?)";
        LocalDateTime now = LocalDateTime.now();

        try (Connection conn = ConnectDB.getInstance().openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, cm.getAccount().getAccount_id());
            statement.setInt(2, cm.getPost().getAd_id());
            statement.setString(3, cm.getContent());
            statement.setTimestamp(4, Timestamp.valueOf(now));
            statement.setTimestamp(6, Timestamp.valueOf(now));

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CommentDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public static boolean deleteComment(int commentId) {
        String query = """
                       DELETE FROM Likes WHERE CommentID = ?
                       DELETE FROM [Comment] WHERE comment_id = ?""";

        try (Connection conn = ConnectDB.getInstance().openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, commentId);
            statement.setInt(2, commentId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CommentDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public static boolean updateComment(int commentId, String newContent, int newRating) {
        String query = "UPDATE [Comment] SET content = ?, rating = ?, updated_at = ? WHERE comment_id = ?";
        LocalDateTime now = LocalDateTime.now();

        try (Connection conn = ConnectDB.getInstance().openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setString(1, newContent);
            statement.setInt(2, newRating);
            statement.setTimestamp(3, Timestamp.valueOf(now));
            statement.setInt(4, commentId);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CommentDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
