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
    private int likeId;
    private Comment comment;
    private Account User;

    public Like(int likeId, Comment comment, Account User) {
        this.likeId = likeId;
        this.comment = comment;
        this.User = User;
    }

    public int getLikeId() {
        return likeId;
    }

    public void setLikeId(int likeId) {
        this.likeId = likeId;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public Account getUser() {
        return User;
    }

    public void setUser(Account User) {
        this.User = User;
    }

    @Override
    public String toString() {
        return "Like{" + "likeId=" + likeId + ", comment=" + comment + ", UserId=" + User + '}';
    }
}
