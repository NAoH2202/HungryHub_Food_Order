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
    private ArrayList<Dish> List;

    public DishManager() {
        List = DishDao.getAllDishs();
    }
    
    public Dish getDishById(int id) {
        for (Dish facc : List) {
            if (id == facc.getDish_id()) {
                return facc;
            }
        }
        return null;
    }
    
    public ArrayList<Dish> getList() {
        return List;
    }

    public Dish getFirstDish(Account acc) {
        for (Dish facc : List) {
            if (acc.getAccount_id() == facc.getAccount().getAccount_id()) {
                return facc;
            }
        }
        return null;
    }
}
