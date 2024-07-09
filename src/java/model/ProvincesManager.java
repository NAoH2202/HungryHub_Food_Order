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
public class ProvincesManager {
    private ArrayList<Provinces> List;

    public ProvincesManager() {
        List = ProvincesDao.getAllProvinces();
    }

    public ArrayList<Provinces> getList() {
        return List;
    }
    
    public Provinces getProvincesById(int id) {
        for (Provinces facc : List) {
            if (id == facc.getId()) {
                return facc;
            }
        }
        return null;
    }
    
    public static void main(String[] args) {
       ProvincesManager cm = new ProvincesManager();
        for(Provinces c : cm.getList()){
            System.out.println(c);
        }
    }
}
