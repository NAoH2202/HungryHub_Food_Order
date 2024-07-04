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
public class ReplyCommentManager {
    private ArrayList<ReplyComment> List;

    public ReplyCommentManager() {
        List = ReplyCommentDao.getAllReplyComments();
    }

    public ArrayList<ReplyComment> getList() {
        return List;
    }
    
    public ReplyComment getCommentById(int id) {
        for (ReplyComment facc : List) {
            if (id == facc.getRepcommentId()) {
                return facc;
            }
        }
        return null;
    }
}
