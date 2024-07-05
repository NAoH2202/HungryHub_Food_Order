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
public class LikeManager {
    private ArrayList<Like> List;

    public LikeManager() {
        List = LikeDao.getAllLikes();
    }
    
    public Like getLikeById(int id) {
        for (Like facc : List) {
            if (id == facc.getLikeId()) {
                return facc;
            }
        }
        return null;
    }

    public ArrayList<Like> getList() {
        return List;
    }
    
    public ArrayList<Like> getLikesByAccountId(int id) {
        ArrayList<Like> likeList = new ArrayList<>();
        for (Like facc : List) {
            if (id == facc.getUser().getAccount_id()) {
                likeList.add(facc);
            }
        }
        return likeList;
    }
    
    public static void main(String[] args) {
        LikeManager lm = new LikeManager();
        for(Like l : lm.getLikesByAccountId(1)){
            if(l.getComment().getCommentId()==1 && l.getUser().getAccount_id()==1)
            System.out.println(l);
        }
    }
}
