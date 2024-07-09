/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lenovo
 */
public class Districts {
    private int id;
    private String name;
    private Provinces province;

    // Constructor

    public Districts(int id, String name, Provinces province) {
        this.id = id;
        this.name = name;
        this.province = province;
    }
    

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Provinces getProvince() {
        return province;
    }

    public void setProvince(Provinces province) {
        this.province = province;
    }

    @Override
    public String toString() {
        return "Districts{" + "id=" + id + ", name=" + name + ", province=" + province + '}';
    }
  
}

