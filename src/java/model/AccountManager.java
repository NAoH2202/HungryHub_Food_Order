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
public class AccountManager {

    ArrayList<Account> List;

    public AccountManager() {
        List = AccountDAO.getAllAccounts();
    }

    public Account Login(String u, String p) {
        for (Account facc : List) {
            if (u.equalsIgnoreCase(facc.getUsername()) && p.equalsIgnoreCase(facc.getPassword())) {
                return facc;
            }
        }
        return null;
    }
    
    public Account getAccountById(int id) {
        for (Account facc : List) {
            if (id == facc.getId()) {
                return facc;
            }
        }
        return null;
    }
    public boolean checkUsername(String usernameIn) {
        if (List.isEmpty()) {
            return true;
        }

        for (Account facc : List) {
            if (usernameIn.equalsIgnoreCase(facc.getUsername())) {
                return false;
            }
        }

        return true;
    }

    public static void main(String[] args) {
        AccountManager am = new AccountManager();
        if (am.checkUsername("hai")) {
            System.out.println("chua ton tai");
        } else {
            System.out.println("da ton tai");
        }
        
//        for (Account facc : am.List) {
//            System.out.println(facc);
//        }
    }
}
