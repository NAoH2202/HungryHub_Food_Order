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
public class LikeDao {
    public static ArrayList<Like> getAllLikes() {
        ArrayList<Like> LikeList = new ArrayList<>();
        CommentManager cm = new CommentManager();
        AccountManager am = new AccountManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [Likes]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int likeID = rs.getInt("LikeID");
                int commentID = rs.getInt("CommentID");
                Comment comment = cm.getCommentById(commentID);
                int userID = rs.getInt("UserID");
                Account acc = am.getAccountById(userID);
                LikeList.add(new Like(likeID, comment, acc));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LikeDao.class.getName()).log(Level.SEVERE, null, ex);
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
        return LikeList;
    }
    public static boolean addLike(int commentID, int userID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        boolean isSuccess = false;
        
        try {
            conn = db.openConnection();
            String query = "INSERT INTO [Likes] (CommentID, UserID) VALUES (?, ?)";
            statement = conn.prepareStatement(query);
            statement.setInt(1, commentID);
            statement.setInt(2, userID);
            int rowsInserted = statement.executeUpdate();
            isSuccess = rowsInserted > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LikeDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }
        
        return isSuccess;
    }
}
