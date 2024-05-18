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
public class FoodAd {
    private int ad_id;
    private Account dinner_manager;
    private String title;
    private String content;
    private String image_url;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();

    public FoodAd(int ad_id, Account dinner_manager, String title, String content, String image_url) {
        this.ad_id = ad_id;
        this.dinner_manager = dinner_manager;
        this.title = title;
        this.content = content;
        this.image_url = image_url;
    }

    public int getAd_id() {
        return ad_id;
    }

    public void setAd_id(int ad_id) {
        this.ad_id = ad_id;
    }

    public Account getDinner_manager() {
        return dinner_manager;
    }

    public void setDinner_manager(Account dinner_manager) {
        this.dinner_manager = dinner_manager;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
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
        return "FoodAd{" + "ad_id=" + ad_id + ", dinner_manager=" + dinner_manager + ", title=" + title + ", content=" + content + ", image_url=" + image_url + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
    
}
