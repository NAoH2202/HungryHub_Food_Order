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
import org.apache.tomcat.jni.Library;

/**
 *
 * @author PC
 */
public class LikePostDao {

    public static ArrayList<LikePost> getAllLikePosts() {
        ArrayList<LikePost> LikeList = new ArrayList<>();
        FoodAdManager fam = new FoodAdManager();
        AccountManager am = new AccountManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [LikesPost]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int likeID = rs.getInt("LikeID");
                int postID = rs.getInt("PostID");
                FoodAd post = fam.getFoodAdById(postID);
                int userID = rs.getInt("UserID");
                Account acc = am.getAccountById(userID);
                LikeList.add(new LikePost(likeID, post, acc));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LikePostDao.class.getName()).log(Level.SEVERE, null, ex);
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
}
