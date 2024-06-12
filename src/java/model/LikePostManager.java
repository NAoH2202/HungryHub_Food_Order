/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class LikePostManager {
     ArrayList<LikePost> List;

    public LikePostManager() {
        List = LikePostDao.getAllLikePosts();
    }
    
    public LikePost getLikeById(int id) {
        for (LikePost facc : List) {
            if (id == facc.getLikeID()) {
                return facc;
            }
        }
        return null;
    }
    
    public static void main(String[] args) {
        LikePostManager lm = new LikePostManager();
        for(LikePost l : lm.List){
            System.out.println(l);
        }
    }
}
