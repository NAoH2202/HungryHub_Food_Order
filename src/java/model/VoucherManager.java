/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class VoucherManager {
     ArrayList<Voucher> List;

    public VoucherManager() {
        List = VoucherDao.getAllVouchers();
    }
    
    public Voucher getVoucherById(int id) {
        for (Voucher facc : List) {
            if (id == facc.getVoucher_id()) {
                return facc;
            }
            
        }
        return null;
    }
}
