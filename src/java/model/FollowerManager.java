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
   private ArrayList<Follower> List;

    public ArrayList<Follower> getList() {
        return List;
    }
    

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
     public ArrayList<Follower> getFollowerByAccountId(int id) {
         ArrayList<Follower> Flist = new ArrayList<>();
        for (Follower facc : List) {
            if (id == facc.getFollowerUser().getAccount_id()) {
                Flist.add(facc);
            }
        }
        return Flist;
    }
    public static void main(String[] args) {
        FollowerManager fm = new FollowerManager();
        for(Follower f : fm.getList()){
            System.out.println(f);
        }
        
    }
}
