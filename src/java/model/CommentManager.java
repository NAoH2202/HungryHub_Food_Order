/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author lenovo
 */
public class CommentManager {
    private ArrayList<Comment> List;

    public CommentManager() {
        List = CommentDao.getAllComments();
    }

    public ArrayList<Comment> getList() {
        return List;
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
