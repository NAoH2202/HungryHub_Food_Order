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
public class Voucher {
    private int voucher_id;
    private String code;
    private double discount_percentage;
    private Date valid_from;
    private Date valid_to;
    private int created_by;
    private Date expiration_date;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();

    public Voucher(int voucher_id, String code, double discount_percentage, Date valid_from, Date valid_to, int created_by, Date expiration_date) {
        this.voucher_id = voucher_id;
        this.code = code;
        this.discount_percentage = discount_percentage;
        this.valid_from = valid_from;
        this.valid_to = valid_to;
        this.created_by = created_by;
        this.expiration_date = expiration_date;
    }

    public int getVoucher_id() {
        return voucher_id;
    }

    public void setVoucher_id(int voucher_id) {
        this.voucher_id = voucher_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getDiscount_percentage() {
        return discount_percentage;
    }

    public void setDiscount_percentage(double discount_percentage) {
        this.discount_percentage = discount_percentage;
    }

    public Date getValid_from() {
        return valid_from;
    }

    public void setValid_from(Date valid_from) {
        this.valid_from = valid_from;
    }

    public Date getValid_to() {
        return valid_to;
    }

    public void setValid_to(Date valid_to) {
        this.valid_to = valid_to;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public Date getExpiration_date() {
        return expiration_date;
    }

    public void setExpiration_date(Date expiration_date) {
        this.expiration_date = expiration_date;
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

    @Override
    public String toString() {
        return "Voucher{" + "voucher_id=" + voucher_id + ", code=" + code + ", discount_percentage=" + discount_percentage + ", valid_from=" + valid_from + ", valid_to=" + valid_to + ", created_by=" + created_by + ", expiration_date=" + expiration_date + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
    
    
}
