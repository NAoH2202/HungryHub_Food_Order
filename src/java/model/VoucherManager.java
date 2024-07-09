package model;

import dbconnext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class VoucherManager {

    private ArrayList<Voucher> voucherList;

    public VoucherManager() {
        voucherList = VoucherDao.getAllVouchers();
    }

    public ArrayList<Voucher> getAllVouchers() {
        return voucherList;
    }

    public Voucher getVoucherById(int id) {
        for (Voucher voucher : voucherList) {
            if (voucher.getVoucher_id() == id) {
                return voucher;
            }
        }
        return null;
    }

    public ArrayList<Voucher> getVouchersByDinerId(int id) {
        ArrayList<Voucher> vouchers = new ArrayList<>();
        for (Voucher voucher : voucherList) {
            if (voucher.getCreated_by().getAccount_id() == id) {
                vouchers.add(voucher);
            }
        }
        return vouchers;
    }

    public void addVoucher(Voucher voucher) {
        String sql = "INSERT INTO Voucher (code, discount_percentage, valid_from, valid_to, created_by) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = ConnectDB.getInstance().openConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, voucher.getCode());
            pstmt.setDouble(2, voucher.getDiscount_percentage());
            pstmt.setTimestamp(3, new Timestamp(voucher.getValid_from().getTime()));
            pstmt.setTimestamp(4, new Timestamp(voucher.getValid_to().getTime()));
            pstmt.setInt(5, voucher.getCreated_by().getAccount_id());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                voucherList.add(voucher);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to add voucher: " + e.getMessage());
        }
    }
    public void deleteVoucher(int voucherId) {
        String sql = "DELETE FROM Voucher WHERE voucher_id = ?";
        try (Connection conn = ConnectDB.getInstance().openConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, voucherId);

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                voucherList.removeIf(voucher -> voucher.getVoucher_id() == voucherId);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to delete voucher: " + e.getMessage());
        }
    }
  public void updateVoucher(Voucher voucher) {
    String sql = "UPDATE Voucher SET code = ?, discount_percentage = ?, valid_from = ?, valid_to = ? WHERE voucher_id = ?";
    try (Connection conn = ConnectDB.getInstance().openConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

        pstmt.setString(1, voucher.getCode());
        pstmt.setDouble(2, voucher.getDiscount_percentage());
        pstmt.setTimestamp(3, new Timestamp(voucher.getValid_from().getTime()));
        pstmt.setTimestamp(4, new Timestamp(voucher.getValid_to().getTime()));
        pstmt.setInt(5, voucher.getVoucher_id());

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            // Update voucher in the local list if it exists
            Voucher existingVoucher = getVoucherById(voucher.getVoucher_id());
            if (existingVoucher != null) {
                existingVoucher.setCode(voucher.getCode());
                existingVoucher.setDiscount_percentage(voucher.getDiscount_percentage());
                existingVoucher.setValid_from(voucher.getValid_from());
                existingVoucher.setValid_to(voucher.getValid_to());
            }
            // Reload voucher list from the database
            voucherList = VoucherDao.getAllVouchers();
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        throw new RuntimeException("Failed to update voucher: " + e.getMessage());
    }
}

    public static void main(String[] args) {
        VoucherManager asManager = new VoucherManager();

        // In ra danh sách tất cả các voucher
        System.out.println("All vouchers:");
        for (Voucher voucher : asManager.getAllVouchers()) {
            System.out.println(voucher);
        }

        // In ra danh sách các voucher của người dùng có id = 3
        ArrayList<Voucher> dList = asManager.getVouchersByDinerId(3);
        System.out.println("\nVouchers for diner with id 3:");
        for (Voucher voucher : dList) {
            System.out.println(voucher);
        }
    }
}
