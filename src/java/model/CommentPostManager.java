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
public class CommentPostManager {
    ArrayList<CommentPost> List;

    public CommentPostManager() {
        List = CommentPostDao.getAllCommentPosts();
    }
    
    public CommentPost getCommentPostById(int id) {
        for (CommentPost facc : List) {
            if (id == facc.getComment_id()) {
                return facc;
            }
        }
        return null;
    }
}
