/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author lenovo
 */
public class Dish {
    private int dish_id;
    private Account account;
    private String name;
    private String picture; //new
    private String description;
    private int price;
    private String priceString;
    private String type;
    private String ingredients;
    private boolean dislocal;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();

    public Dish(int dish_id, Account account, String name, String picture, String description, int price, String priceString, String type, String ingredients, boolean dislocal) {
        this.dish_id = dish_id;
        this.account = account;
        this.name = name;
        this.picture = picture;
        this.description = description;
        this.price = price;
        this.priceString = priceString;
        this.type = type;
        this.ingredients = ingredients;
        this.dislocal = dislocal;
    }

    public Dish(int dish_id, Account account, String name,String picture, String description, int price, String type, String ingredients) {
        this.dish_id = dish_id;
        this.picture = picture;
        this.account = account;
        this.name = name;
        this.description = description;
        this.price = price;
        this.type = type;
        this.ingredients = ingredients;
    }

    public int getDish_id() {
        return dish_id;
    }

    public void setDish_id(int dish_id) {
        this.dish_id = dish_id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public String getPriceString() {
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        return numberFormat.format(price);
    }
    
    public void setPrice(int price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public boolean isDislocal() {
        return dislocal;
    }

    public void setDislocal(boolean dislocal) {
        this.dislocal = dislocal;
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

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "Dish{" + "dish_id=" + dish_id + ", account=" + account + ", name=" + name + ", picture=" + picture + ", description=" + description + ", price=" + price + ", type=" + type + ", ingredients=" + ingredients + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }

}
