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
  private ArrayList<Account> List;

    public AccountManager() {
        List = AccountDao.getAllAccounts();
    }

    public Account Login(String u, String p) {
        for (Account facc : List) {
            if ((u.equalsIgnoreCase(facc.getUsername())||u.equalsIgnoreCase(facc.getEmail()) )&& p.equalsIgnoreCase(facc.getPassword())) {
                return facc;
            }
        }
        return null;
    }
     public ArrayList<Account> getList() {
        return List;
    }
      public Account getAccountById(int id) {
        for (Account facc : List) {
            if (id == facc.getAccount_id()) {
                return facc;
            }
        }
        return null;
    }
      public Account getAccountByEmail(String email) {
        for (Account facc : List) {
            if (email.equalsIgnoreCase(facc.getEmail())) {
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
    public boolean checkGmail(String gmailIn) {
        if (List.isEmpty()) {
            return true;
        }

        for (Account facc : List) {
            if (gmailIn.equalsIgnoreCase(facc.getEmail())) {
                return false;
            }
        }

        return true;
    }
}
