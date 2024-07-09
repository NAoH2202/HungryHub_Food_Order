/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


import dbconnext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lenovo
 */
public class DishManager {
    private ArrayList<Dish> List;

    public DishManager() {
        List = DishDao.getAllDishs();
    }
    
    public Dish getDishById(int id) {
        for (Dish facc : List) {
            if (id == facc.getDish_id()) {
                return facc;
            }
        }
        return null;
    }
    public ArrayList<Dish> getDishByDinerId(int id) {
        ArrayList<Dish> dishList = new ArrayList<>();
        for (Dish facc : List) {
            if (id == facc.getAccount().getAccount_id()) {
                dishList.add(facc);
            }
        }
        return dishList;
    }
    public void addDish(Dish dish) {
        String sql = "INSERT INTO Dish (Account_id, name, Picture, description, price, type, ingredients, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())";
        try (Connection conn = ConnectDB.getInstance().openConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, dish.getAccount().getAccount_id());
            pstmt.setString(2, dish.getName());
            pstmt.setString(3, dish.getPicture());
            pstmt.setString(4, dish.getDescription());
            pstmt.setDouble(5, dish.getPrice());
            pstmt.setString(6, dish.getType());
            pstmt.setString(7, dish.getIngredients());
            pstmt.executeUpdate();

            // Sau khi thêm món ăn vào cơ sở dữ liệu, cập nhật danh sách
            List.add(dish);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public boolean deleteDish(int dishId) {
        String sql = "DELETE FROM Dish WHERE Dish_id = ?";
        try (Connection conn = ConnectDB.getInstance().openConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, dishId);
            int rowsAffected = pstmt.executeUpdate();

            // Xóa thành công nếu có ít nhất một dòng bị ảnh hưởng
            if (rowsAffected > 0) {
                List.removeIf(d -> d.getDish_id() == dishId);
                return true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
 
        public boolean updateDish(Dish dish) {
        String sql = "UPDATE Dish SET name = ?, Picture = ?, description = ?, price = ?, type = ?, ingredients = ?, updated_at = GETDATE() WHERE Dish_id = ?";
        try (Connection conn = ConnectDB.getInstance().openConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dish.getName());
            pstmt.setString(2, dish.getPicture());
            pstmt.setString(3, dish.getDescription());
            pstmt.setDouble(4, dish.getPrice());
            pstmt.setString(5, dish.getType());
            pstmt.setString(6, dish.getIngredients());
            pstmt.setInt(7, dish.getDish_id());
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                for (Dish d : List) {
                    if (d.getDish_id() == dish.getDish_id()) {
                        d.setName(dish.getName());
                        d.setPicture(dish.getPicture());
                        d.setDescription(dish.getDescription());
                        d.setPrice(dish.getPrice());
                        d.setType(dish.getType());
                        d.setIngredients(dish.getIngredients());
                        d.setUpdated_at(dish.getUpdated_at());
                        break;
                    }
                }
                return true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
    public ArrayList<Dish> getList() {
        return List;
    }

    public Dish getFirstDish(Account acc) {
        for (Dish facc : List) {
            if (acc.getAccount_id() == facc.getAccount().getAccount_id()) {
                return facc;
            }
        }
        return null;
    }
}
