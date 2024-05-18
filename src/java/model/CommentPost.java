/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author lenovo
 */
public class CommentPost {
    private int comment_id;
    private Account account;
    private FoodAd post;
    private String content;
    private int rating;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();

    public CommentPost(int comment_id, Account account, FoodAd post, String content, int rating) {
        this.comment_id = comment_id;
        this.account = account;
        this.post = post;
        this.content = content;
        this.rating = rating;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
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
        return "CommentPost{" + "comment_id=" + comment_id + ", account=" + account + ", post=" + post + ", content=" + content + ", rating=" + rating + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }

}
