/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import model.Account;
import model.AccountDao;

/**
 *
 * @author lenovo
 */
public class NumVerify {

    public static String getNumVerify() {
        Random rd = new Random();
        String s = "";
        for (int i = 0; i < 6; i++) {
            s += rd.nextInt(9) + "";
        }
        return s;
    }

    public static void main(String[] args) {
        String maxacthuc = NumVerify.getNumVerify();
        Account account = new Account(12, "123456", false, LocalDateTime.now());
        //thoi gian hieu luc
        LocalDateTime ThoiGianHieuLuc = LocalDateTime.now().plusHours(1);

        //Trang thai xac thuc = false
        boolean trangThaiXacThuc = false;
        account.setMaxacthuc(maxacthuc);
        account.setThoigianhieuluc(ThoiGianHieuLuc);
        account.setTrangthaixacthuc(trangThaiXacThuc);
        System.out.println(account);
        AccountDao.updateAccountVerify(account);
    }
}
