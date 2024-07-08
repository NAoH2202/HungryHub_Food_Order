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
public class ReplyCommentDao {

    public static ArrayList<ReplyComment> getAllReplyComments() {
        ArrayList<ReplyComment> CommentDishList = new ArrayList<>();
        AccountManager am = new AccountManager();
        CommentManager cm = new CommentManager();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [ReplyComment]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int repcomment_id = rs.getInt("replycomment_id");
                int account_id = rs.getInt("Account_id");
                Account account = am.getAccountById(account_id);
                int comment_id = rs.getInt("comment_id");
                Comment comment = cm.getCommentById(comment_id);
                int rep_id = rs.getInt("reply_id");
                String content = rs.getString("content");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updated_at = rs.getTimestamp("updated_at").toLocalDateTime();
                ReplyComment Repcomment = new ReplyComment(repcomment_id, account, comment, rep_id, content);
                Repcomment.setCreated_at(created_at);
                Repcomment.setUpdated_at(updated_at);

                CommentDishList.add(Repcomment);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ReplyCommentDao.class.getName()).log(Level.SEVERE, null, ex);
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

    public static boolean addReplyComment(ReplyComment replyComment) {
        ConnectDB db = ConnectDB.getInstance();
        String query = "INSERT INTO [ReplyComment] (Account_id, comment_id, content, created_at, updated_at) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = db.openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, replyComment.getAccount().getAccount_id());
            statement.setInt(2, replyComment.getComment().getCommentId());
            statement.setString(3, replyComment.getContent());
            statement.setTimestamp(4, java.sql.Timestamp.valueOf(replyComment.getCreated_at()));
            statement.setTimestamp(5, java.sql.Timestamp.valueOf(replyComment.getUpdated_at()));

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ReplyCommentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public static boolean addReplyCommentReply(ReplyComment replyComment) {
        ConnectDB db = ConnectDB.getInstance();
        String query = "INSERT INTO [ReplyComment] (Account_id, reply_id, content, created_at, updated_at) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = db.openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, replyComment.getAccount().getAccount_id());
            statement.setInt(2, replyComment.getRep_id());
            statement.setString(3, replyComment.getContent());
            statement.setTimestamp(4, java.sql.Timestamp.valueOf(replyComment.getCreated_at()));
            statement.setTimestamp(5, java.sql.Timestamp.valueOf(replyComment.getUpdated_at()));

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ReplyCommentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean deleteReplyCommentById(int replyCommentId) {
        ConnectDB db = ConnectDB.getInstance();
        String query = """
                       DELETE FROM LikeReps WHERE CommentID = ?
                       DELETE FROM [ReplyComment] WHERE replycomment_id = ?""";

        try (Connection conn = db.openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, replyCommentId);
            statement.setInt(2, replyCommentId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ReplyCommentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
