/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import com.sun.net.httpserver.Authenticator;
import dbconnext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

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
            if ((u.equalsIgnoreCase(facc.getUsername()) || u.equalsIgnoreCase(facc.getEmail())) && p.equalsIgnoreCase(facc.getPassword())) {
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

    //quan an
    public ArrayList<Account> getAllDiner() {
        ArrayList<Account> listDiner = new ArrayList<>();
        for (Account facc : List) {
            if (facc.getRole().equalsIgnoreCase("DinerManager")) {
                listDiner.add(facc);
            }
        }
        return listDiner;
    }

    public ArrayList<Dish> getAllDishByDiner(Account acc) {
        ArrayList<Dish> listDish = new ArrayList<>();
        DishManager dm = new DishManager();
        for (Dish dish : dm.getList()) {
            if (dish.getAccount().getAccount_id() == acc.getAccount_id()) {
                listDish.add(dish);
            }
        }
        return listDish;
    }

    public boolean checkDishInDiner(String input, Account acc) {
        ArrayList<Dish> listDish = getAllDishByDiner(acc);
        for (Dish dish : listDish) {
            if (matchesInput(input, dish)) {
                return true;
            }
        }
        return false;
    }

    private boolean matchesInput(String input, Dish dish) {
        String check = input.trim().toLowerCase();
        return dish.getName().toLowerCase().contains(check)
                || dish.getType().toLowerCase().contains(check)
                || dish.getDescription().toLowerCase().contains(check);
    }

    public ArrayList<Account> searchDiner(String input) {
        if (input == null || input.trim().isEmpty()) {
            return new ArrayList<>(); // hoặc null hoặc trả về danh sách trống
        }
        ArrayList<Account> listDiner = getAllDiner();
        ArrayList<Account> resultDiner = new ArrayList<>();
        for (Account acc : listDiner) {
            if (matchesInput(input, acc) || checkDishInDiner(input, acc)) {
                resultDiner.add(acc);
            }
        }
        return resultDiner;
    }

    private boolean matchesInput(String input, Account acc) {
        String check = input.trim().toLowerCase();
        return acc.getName().toLowerCase().contains(check)
                || acc.getAddress().toLowerCase().contains(check);
    }

    public ArrayList<Account> getNext3Accounts(int amout) {
        ArrayList<Account> listDiner = new ArrayList<>();
        int account_id;
        String username;
        String password;
        String name;
        String detail;
        String email;
        String phoneNumber;
        String address;
        Date date_of_birth;
        boolean active_status;
        String profile_picture;
        String role;
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = """
                           SELECT *
                           FROM Account
                           WHERE role = 'DinerManager'
                           ORDER BY id
                           OFFSET ? ROWS 
                           FETCH NEXT 3 ROWS ONLY;""";
            statement = conn.prepareStatement(query);
            statement.setInt(1, amout);
            rs = statement.executeQuery();
            while (rs.next()) {
                account_id = rs.getInt("account_id");
                username = rs.getString("username");
                password = rs.getString("password");
                name = rs.getString("name");
                detail = rs.getString("Detail");
                email = rs.getString("email");
                phoneNumber = rs.getString("PhoneNumber");
                address = rs.getString("address");
                role = rs.getString("role");
                date_of_birth = rs.getDate("date_of_birth");
                active_status = rs.getBoolean("active_status");
                profile_picture = rs.getString("profile_picture");
                String maxacthuc = rs.getString("maxacthuc");
                Timestamp thoigianhieuluc = rs.getTimestamp("thoigianhieuluc");
                LocalDateTime tghl;
                if (thoigianhieuluc != null) {
                    tghl = thoigianhieuluc.toLocalDateTime();
                } else {
                    tghl = null;
                }
                boolean trangthaixacthuc = rs.getBoolean("trangthaixacthuc");

                Account Acc = new Account(account_id, username, password, name, detail, email, phoneNumber, address, date_of_birth, active_status, profile_picture, role, maxacthuc, trangthaixacthuc, tghl);
                listDiner.add(Acc);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listDiner;
    }

    //end quan an
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

    public ArrayList<Account> getAllAccountsExcept(int accountId) {
        ArrayList<Account> result = new ArrayList<>();
        for (Account acc : List) {
            if (acc.getAccount_id() != accountId) {
                result.add(acc);
            }
        }
        return result;
    }
    
    public static void main(String[] args) {
        AccountManager am = new AccountManager();
        ArrayList<Account> diner = am.searchDiner("c");
        for (Account a : am.getList()) {
            System.out.println(a);
        }
    }
}
