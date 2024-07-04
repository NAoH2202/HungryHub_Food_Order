/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lenovo
 */
public class LikePost {
    private int likeID;
    private FoodAd post;
    private Account user;

    public LikePost(int likeID, FoodAd post, Account user) {
        this.likeID = likeID;
        this.post = post;
        this.user = user;
    }

    public int getLikeID() {
        return likeID;
    }

    public void setLikeID(int likeID) {
        this.likeID = likeID;
    }

    public FoodAd getPost() {
        return post;
    }

    public void setPost(FoodAd post) {
        this.post = post;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }

    

    @Override
    public String toString() {
        return "Like{" + "likeID=" + likeID + ", post=" + post+ ", user=" + user + '}';
    }
    
}
