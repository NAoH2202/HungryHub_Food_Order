/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import model.Account;
import model.AccountManager;
import model.AccountDao;
import model.Dish;
import model.DishManager;
import model.DishDao;

/**
 *
 * @author lenovo
 */
public class CheckLocation {

    public static boolean CheckDishLocation(Dish dish, Account customer) {
        if (dish.isDislocal()) {
            if (!dish.getAccount().getProvinces().equals(customer.getProvinces())) {
                return false;
            }
        }
        return true;
    }

    public static boolean CheckDinerLocation(Account diner, Account customer) {
        return diner.getProvinces().equals(customer.getProvinces());
    }
}
