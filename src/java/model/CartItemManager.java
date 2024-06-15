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
public class CartItemManager {
    private ArrayList<CartItem> List;

    public CartItemManager() {
        List = CartItemDao.getAllCartItems();
    }

    public ArrayList<CartItem> getList() {
        return List;
    }
    
    
    
    public CartItem getCartItemById(int id) {
        for (CartItem facc : List) {
            if (id == facc.getCartitemId()) {
                return facc;
            }
        }
        return null;
    }
    
    public static void main(String[] args) {
        CartItemManager cm = new CartItemManager();
        for(CartItem c : cm.getList()){
            System.out.println(c);
        }
    }
}
