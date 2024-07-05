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
    
    public ArrayList<ReplyComment> getReplyCommentByCommentId(int id) {
        ArrayList<ReplyComment> listRC= new ArrayList<>();
        for (ReplyComment facc : List) {
            if (id == facc.getComment().getCommentId()) {
                listRC.add(facc);
            }
        }
        return listRC;
    }
    public static void main(String[] args) {
        ReplyCommentDao.deleteReplyCommentById(1);
        ReplyCommentManager rcm = new ReplyCommentManager();
        for (ReplyComment en : rcm.getList()) {
            System.out.println(en);
        }
        
    }
}
