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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class DistrictsDao {
        public static ArrayList<Districts> getAllDistricts() {
        ArrayList<Districts> districtsList = new ArrayList<>();
        ProvincesManager pm = new ProvincesManager();
        String sql = "SELECT * FROM districts";

        try (Connection conn = ConnectDB.getInstance().openConnection();
             PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int provinceId = rs.getInt("province_id");
                Provinces pr = pm.getProvincesById(provinceId);
                Districts district = new Districts(id, name, pr);
                districtsList.add(district);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return districtsList;
    }
}
