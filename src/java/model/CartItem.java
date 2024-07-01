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
public class CartItem {
    private int cartitemId;
    private Account user;
    private Dish dish;
    private int quantity;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();

    public CartItem(int cartitemId, Account user, Dish dish, int quantity) {
        this.cartitemId = cartitemId;
        this.user = user;
        this.dish = dish;
        this.quantity = quantity;
    }

    public int getCartitemId() {
        return cartitemId;
    }

    public void setCartitemId(int cartitemId) {
        this.cartitemId = cartitemId;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }

    

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
        return "CartItem{" + "cartitemId=" + cartitemId + ", user=" + user + ", dish=" + dish + ", quantity=" + quantity + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }

}
