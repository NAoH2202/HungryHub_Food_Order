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
public class FollowerManager {
    ArrayList<Follower> List;

    public FollowerManager() {
        List = FollowerDao.getAllFollowers();
    }
    
    public Follower getFollowerById(int id) {
        for (Follower facc : List) {
            if (id == facc.getFollower_id()) {
                return facc;
            }
        }
        return null;
    }
}
