/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dbconnext.ConnectDB;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class AccountDao {

    public static ArrayList<Account> getAllAccounts() {
        ArrayList<Account> AccountList = new ArrayList<>();
        ProvincesManager pm = new ProvincesManager();
        DistrictsManager dim = new DistrictsManager();
        int account_id;
        String username;
        String password;
        String name;
        String detail;
        String email;
        String phoneNumber;
        String address;
        int proId, disId;
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
            String query = "SELECT * FROM Account";
            statement = conn.prepareStatement(query);
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
                proId = rs.getInt("provincesId");
                Provinces provinces = pm.getProvincesById(proId);
                disId = rs.getInt("districtsId");
                Districts districts = dim.getDistrictById(disId);
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

                Account Acc = new Account(account_id, username, password, name, detail, email, phoneNumber, address, provinces, districts, date_of_birth, active_status, profile_picture, role, maxacthuc, trangthaixacthuc, tghl);
                AccountList.add(Acc);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }
        return AccountList;
    }

    public static boolean updateAccount(Account account) {
        if (account.getDate_of_birth() != null) {
            // Gọi hàm cập nhật ngày sinh nếu không null
            updateDateOfBirth(account);
        }

        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE Account SET name = ?, email = ?, PhoneNumber = ?, address = ?, profile_picture = ?, role = ?, active_status = ? WHERE account_id = ?";
            statement = conn.prepareStatement(query);
            statement.setString(1, account.getName());
            statement.setString(2, account.getEmail());
            statement.setString(3, account.getPhoneNumber());
            statement.setString(4, account.getAddress());
            statement.setString(5, account.getProfile_picture());
            statement.setString(6, account.getRole());
            statement.setBoolean(7, account.isActive_status());
            statement.setInt(8, account.getAccount_id());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
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
        return false;
    }

    private static void updateDateOfBirth(Account account) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE Account SET date_of_birth = ? WHERE account_id = ?";
            statement = conn.prepareStatement(query);
            statement.setDate(1, new java.sql.Date(account.getDate_of_birth().getTime()));
            statement.setInt(2, account.getAccount_id());
            statement.executeUpdate();
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
    }

    public static boolean addAccount(Account account) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "INSERT INTO Account (username, password, name, email, PhoneNumber, address, date_of_birth, profile_picture, role, active_status, maxacthuc, thoigianhieuluc, trangthaixacthuc) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, account.getUsername());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getName());
            statement.setString(4, account.getEmail());
            statement.setString(5, account.getPhoneNumber());
            statement.setString(6, account.getAddress());
            statement.setDate(7, (java.sql.Date) account.getDate_of_birth());
            statement.setString(8, account.getProfile_picture());
            statement.setString(9, account.getRole());
            statement.setBoolean(10, account.isActive_status());
            statement.setString(11, account.getMaxacthuc());
            statement.setTimestamp(12, Timestamp.valueOf(account.getThoigianhieuluc()));
            statement.setBoolean(13, account.getTrangthaixacthuc());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
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
        return false;
    }

    //trung le
    public static void edit(Account ac) {
        String sql = """
                    UPDATE contacts
                    SET Name=?, Email=?, Adress = ?, PhoneNumber=?
                    WHERE id = ?""";
        ConnectDB db = ConnectDB.getInstance();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, ac.getName());
            statement.setString(2, ac.getEmail());
            statement.setString(3, ac.getAddress());
            statement.setString(4, ac.getPhoneNumber());
            statement.setInt(5, ac.getAccount_id());
            statement.executeUpdate();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static boolean updateAccountVerify(Account account) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE Account SET maxacthuc = ?, thoigianhieuluc = ?, trangthaixacthuc = ? WHERE account_id = ?";
            statement = conn.prepareStatement(query);
            statement.setString(1, account.getMaxacthuc());
            statement.setTimestamp(2, Timestamp.valueOf(account.getThoigianhieuluc()));
            statement.setBoolean(3, account.isTrangthaixacthuc());
            statement.setInt(4, account.getAccount_id());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
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
        return false;
    }

    public static boolean updateVerificationStatusToTrue(int accountId) {
        ConnectDB db = ConnectDB.getInstance();
        String query = "UPDATE Account SET trangthaixacthuc = ? WHERE account_id = ?";

        try (Connection conn = db.openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setBoolean(1, true);
            statement.setInt(2, accountId);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean updatePassword(int accountId, String newPassword) {
        ConnectDB db = ConnectDB.getInstance();
        String query = "UPDATE Account SET password = ? WHERE account_id = ?";

        try (Connection conn = db.openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setString(1, newPassword);
            statement.setInt(2, accountId);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void updateActiveStatus(Account account) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query = "UPDATE Account SET active_status = ? WHERE account_id = ? AND role = 'Shipper'";
            statement = conn.prepareStatement(query);
            statement.setBoolean(1, account.isActive_status());
            statement.setInt(2, account.getAccount_id());
            statement.executeUpdate();
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
    }

    public static boolean updateAccountLocation(int accountId, Integer provincesId, Integer districtsId, String address) {
        ConnectDB db = ConnectDB.getInstance();
        String query = "UPDATE Account SET provincesId = ?, districtsId = ?, address = ? WHERE account_id = ?";

        try (Connection conn = db.openConnection(); PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setObject(1, provincesId, java.sql.Types.INTEGER);
            statement.setObject(2, districtsId, java.sql.Types.INTEGER);
            statement.setString(3, address);
            statement.setInt(4, accountId);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String[] args) {
        ArrayList<Account> test = AccountDao.getAllAccounts();
        Account sc = test.get(0);
        sc.setPhoneNumber("09222222");
        AccountDao.updateAccount(sc);
//        for (Account account : test) {
//            System.out.println(account);
//        }
//        Account acc = new Account(10,"123456",false,LocalDateTime.now());
//        AccountDao.updateAccountVerify(acc);
    }
}
