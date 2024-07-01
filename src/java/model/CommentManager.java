/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author lenovo
 */
public class CommentManager {
    private ArrayList<Comment> List;

    public CommentManager() {
        List = CommentDao.getAllComments();
    }

    public ArrayList<Comment> sortByCreatedAt(ArrayList<Comment> comments) {
        comments.sort(Comparator.comparing(Comment::getCreated_at));
        return comments;
    }
    public static ArrayList<Comment> sortCommentsByTimeDesc(ArrayList<Comment> comments) {
        // Sử dụng Collections.sort với Comparator để sắp xếp
        Collections.sort(comments, new Comparator<Comment>() {
            @Override
            public int compare(Comment c1, Comment c2) {
                // So sánh dựa trên thời gian created_at
                return c2.getCreated_at().compareTo(c1.getCreated_at());
            }
        });
        return comments;
    }
    public ArrayList<Comment> getList() {
        return sortCommentsByTimeDesc(List);
    }
    
    public Comment getCommentById(int id) {
        for (Comment facc : List) {
            if (id == facc.getCommentId()) {
                return facc;
            }
        }
        return null;
    }
}
