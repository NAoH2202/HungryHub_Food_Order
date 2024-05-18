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
public class LikeManager {
     ArrayList<Like> List;

    public LikeManager() {
        List = LikeDao.getAllLikes();
    }
    
    public Like getLikeById(int id) {
        for (Like facc : List) {
            if (id == facc.getLikeID()) {
                return facc;
            }
        }
        return null;
    }
}
