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
public class FoodAdManager {
    ArrayList<FoodAd> List;

    public FoodAdManager() {
        List = FoodAdDao.getAllFoodAds();
    }
    
    public FoodAd getFoodAdById(int id) {
        for (FoodAd facc : List) {
            if (id == facc.getAd_id()) {
                return facc;
            }
        }
        return null;
    }
}
