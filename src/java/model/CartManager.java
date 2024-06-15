/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author lenovo
 */
public class CartManager {
    private ArrayList<Cart> List;

    public CartManager() {
        List = CartDao.getAllCarts();
    }

    public ArrayList<Cart> getList() {
        return List;
    }
    
    public Cart getCartById(int id) {
        for (Cart facc : List) {
            if (id == facc.getCartId()) {
                return facc;
            }
        }
        return null;
    }
    public static void main(String[] args) {
        CartManager cm = new CartManager();
        for(Cart c : cm.getList()){
            System.out.println(c);
        }
    }
}
