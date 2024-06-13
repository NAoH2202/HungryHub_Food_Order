/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author lenovo
 */
public class ReplyComment {
    private int repcommentId;
    private Account account;
    private Comment comment;
    private String content;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();

    public ReplyComment(int repcommentId, Account account, Comment comment,String content, LocalDateTime created_at, LocalDateTime updated_at) {
        this.repcommentId = repcommentId;
        this.account = account;
        this.comment = comment;
        this.content = content;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public ReplyComment(int repcommentId, Account account, Comment comment, String content) {
        this.repcommentId = repcommentId;
        this.account = account;
        this.comment = comment;
        this.content = content;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public int getRepcommentId() {
        return repcommentId;
    }

    public void setRepcommentId(int repcommentId) {
        this.repcommentId = repcommentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
        return "ReplyComment{" + "repcommentId=" + repcommentId + ", account=" + account + ", comment=" + comment + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
}
