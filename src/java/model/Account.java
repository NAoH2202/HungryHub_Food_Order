/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author lenovo
 */
public class Account {

    private int account_id;
    private String username;
    private String password;
    private String name;
    private String Detail;
    private String email;
    private String phoneNumber; //new
    private String address;
    private Provinces provinces;
    private Districts district;
    private Date date_of_birth;
    private boolean active_status;
    private String background_picture;
    private String profile_picture;
    private String role;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();
    private String maxacthuc;
    private boolean trangthaixacthuc;
    private LocalDateTime thoigianhieuluc;

    public Account(int account_id, String username, String password, String name, String Detail, String email, String phoneNumber, String address, Provinces provinces, Districts district, Date date_of_birth, boolean active_status, String profile_picture,String Background_picture, String role, String maxacthuc, boolean trangthaixacthuc, LocalDateTime thoigianhieuluc) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.Detail = Detail;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.provinces = provinces;
        this.district = district;
        this.date_of_birth = date_of_birth;
        this.active_status = active_status;
        this.profile_picture = profile_picture;
        this.background_picture = Background_picture;
        this.role = role;
        this.maxacthuc = maxacthuc;
        this.trangthaixacthuc = trangthaixacthuc;
        this.thoigianhieuluc = thoigianhieuluc;
    }

    
    public Account(int account_id, String maxacthuc, boolean trangthaixacthuc, LocalDateTime thoigianhieuluc) {
        this.account_id = account_id;
        this.maxacthuc = maxacthuc;
        this.trangthaixacthuc = trangthaixacthuc;
        this.thoigianhieuluc = thoigianhieuluc;
    }

    public Account(int account_id, String username, String password, String name, String Detail, String email, String phoneNumber, String address, Date date_of_birth, boolean active_status, String profile_picture, String role, String maxacthuc, boolean trangthaixacthuc, LocalDateTime thoigianhieuluc) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.Detail = Detail;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.date_of_birth = date_of_birth;
        this.active_status = active_status;
        this.profile_picture = profile_picture;
        this.role = role;
        this.maxacthuc = maxacthuc;
        this.trangthaixacthuc = trangthaixacthuc;
        this.thoigianhieuluc = thoigianhieuluc;
    }

    
    
    public Account(int account_id, String username, String password, String name, String email, String phoneNumber, String address, Date date_of_birth, String profile_picture, String role, boolean active_status) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.date_of_birth = date_of_birth;
        this.profile_picture = profile_picture;
        this.role = role;
        this.active_status = active_status;
    }

    public Account(String name, String email, String phoneNumber, String address) {
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }
    public Account(String name, String username,String password,String email, String role, String address) {
        this.name = name;
        this.email = email;
        this.username = username;
        this.password = password;
        this.role = role;
        this.address = address;
    }


    public Account(int account_id, String username, String password, String name, String email, String phoneNumber, String address, Date date_of_birth, String profile_picture, String role, String maxacthuc, boolean trangthaixacthuc, LocalDateTime thoigianhieuluc) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.date_of_birth = date_of_birth;
        this.profile_picture = profile_picture;
        this.role = role;
        this.maxacthuc = maxacthuc;
        this.trangthaixacthuc = trangthaixacthuc;
        this.thoigianhieuluc = thoigianhieuluc;
    }

    public Account() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }



    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public boolean isActive_status() {
        return active_status;
    }

    public void setActive_status(boolean active_status) {
        this.active_status = active_status;
    }

    public String getProfile_picture() {
        return profile_picture;
    }

    public void setProfile_picture(String profile_picture) {
        this.profile_picture = profile_picture;
    }

    public String getBackground_picture() {
        return background_picture;
    }

    public void setBackground_picture(String background_picture) {
        this.background_picture = background_picture;
    }

    
    
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getMaxacthuc() {
        return maxacthuc;
    }

    public void setMaxacthuc(String maxacthuc) {
        this.maxacthuc = maxacthuc;
    }

    public boolean isTrangthaixacthuc() {
        return trangthaixacthuc;
    }

    public void setTrangthaixacthuc(boolean trangthaixacthuc) {
        this.trangthaixacthuc = trangthaixacthuc;
    }
    public boolean getTrangthaixacthuc() {
        return trangthaixacthuc;
    }
    public LocalDateTime getThoigianhieuluc() {
        return thoigianhieuluc;
    }

    public void setThoigianhieuluc(LocalDateTime thoigianhieuluc) {
        this.thoigianhieuluc = thoigianhieuluc;
    }

    public String getDetail() {
        return Detail;
    }

    public void setDetail(String Detail) {
        this.Detail = Detail;
    }

    public Provinces getProvinces() {
        return provinces;
    }

    public void setProvinces(Provinces provinces) {
        this.provinces = provinces;
    }

    public Districts getDistrict() {
        return district;
    }

    public void setDistrict(Districts district) {
        this.district = district;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", name=" + name + ", address=" + address + ", provinces=" + provinces + ", district=" + district + '}';
    }


}
