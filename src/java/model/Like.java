/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lenovo
 */
public class Like {
    private int likeID;
    private int postID;
    private int userID;

    public Like(int likeID, int postID, int userID) {
        this.likeID = likeID;
        this.postID = postID;
        this.userID = userID;
    }

    public int getLikeID() {
        return likeID;
    }

    public void setLikeID(int likeID) {
        this.likeID = likeID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    @Override
    public String toString() {
        return "Like{" + "likeID=" + likeID + ", postID=" + postID + ", userID=" + userID + '}';
    }
    
}
