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
public class Follower {
    private int follower_id;
    private Account account;
    private Account followerUser;
    private LocalDateTime created_at = LocalDateTime.now();

    public Follower(int follower_id, Account account, Account followerUser) {
        this.follower_id = follower_id;
        this.account = account;
        this.followerUser= followerUser;
    }

    public int getFollower_id() {
        return follower_id;
    }

    public void setFollower_id(int follower_id) {
        this.follower_id = follower_id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Account getFollowerUser() {
        return followerUser;
    }

    public void setFollowerUser(Account followerUser) {
        this.followerUser = followerUser;
    }

    

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Follower{" + "follower_id=" + follower_id + ", account=" + account + ", followerUser=" + followerUser + ", created_at=" + created_at + '}';
    }
}
