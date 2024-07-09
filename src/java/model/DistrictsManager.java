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
public class DistrictsManager {
        private ArrayList<Districts> List;

    public DistrictsManager() {
        List = DistrictsDao.getAllDistricts();
    }

    public ArrayList<Districts> getList() {
        return List;
    }
    
    public Districts getDistrictById(int id) {
        for (Districts facc : List) {
            if (id == facc.getId()) {
                return facc;
            }
        }
        return null;
    }
    
    public ArrayList<Districts> getDistrictByProvinces(int id) {
        ArrayList<Districts> dlist = new ArrayList<>();
        for (Districts facc : List) {
            if (id == facc.getProvince().getId()) {
                dlist.add(facc);
            }
        }
        return dlist;
    }
    public Districts getDistrictByName(String name) {
        for (Districts facc : List) {
            if (facc.getName().equalsIgnoreCase(name)) {
                return facc;
            }
        }
        return null;
    }
    
    public static void main(String[] args) {
       DistrictsManager cm = new DistrictsManager();
        for(Districts c : cm.getList()){
            System.out.println(c);
        }
    }
}
