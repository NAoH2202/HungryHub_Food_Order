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
public class DishManager {
    ArrayList<Dish> List;

    public DishManager() {
        List = DishDao.getAllAccounts();
    }
    
    public Dish getDishById(int id) {
        for (Dish facc : List) {
            if (id == facc.getDish_id()) {
                return facc;
            }
        }
        return null;
    }
}
