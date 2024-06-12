/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lenovo
 */
import java.time.LocalDateTime;

public class Comment {
    private int commentId;
    private Account account;
    private Dish dish;
    private Account diner;
    private FoodAd post;
    private String content;
    private int rating;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();

    // Constructor
    public Comment(int commentId, Account account, Dish dish, Account diner, FoodAd post, String content, int rating, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.commentId = commentId;
        this.account = account;
        this.dish = dish;
        this.diner = diner;
        this.post = post;
        this.content = content;
        this.rating = rating;
        this.created_at = createdAt;
        this.updated_at = updatedAt;
    }

    // Getters and Setters
    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    public Account getDiner() {
        return diner;
    }

    public void setDiner(Account diner) {
        this.diner = diner;
    }

    public FoodAd getPost() {
        return post;
    }

    public void setPost(FoodAd post) {
        this.post = post;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public LocalDateTime getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(LocalDateTime updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "Comment{" + "commentId=" + commentId + ", account=" + account + ", dish=" + dish + ", diner=" + diner + ", post=" + post + ", content=" + content + ", rating=" + rating + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
    
}