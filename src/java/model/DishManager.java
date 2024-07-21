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
        String sql = "INSERT INTO Dish (Account_id, name, Picture, description, price, type, ingredients, dislocal, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())";
        try (Connection conn = ConnectDB.getInstance().openConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, dish.getAccount().getAccount_id());
            pstmt.setString(2, dish.getName());
            pstmt.setString(3, dish.getPicture());
            pstmt.setString(4, dish.getDescription());
            pstmt.setDouble(5, dish.getPrice());
            pstmt.setString(6, dish.getType());
            pstmt.setString(7, dish.getIngredients());
            pstmt.setBoolean(8, dish.isDislocal());
            pstmt.executeUpdate();

            // Sau khi thêm món ăn vào cơ sở dữ liệu, cập nhật danh sách
            List.add(dish);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public boolean deleteDish(int dishId) {
        String sql = """
                     DELETE FROM Likes WHERE CommentID IN (SELECT comment_id FROM Comment WHERE dish_id = ?);
                     DELETE FROM LikeReps WHERE CommentID IN (SELECT replycomment_id FROM ReplyComment WHERE comment_id IN (SELECT comment_id FROM Comment WHERE dish_id = ?));
                     DELETE FROM ReplyComment WHERE comment_id IN (SELECT comment_id FROM Comment WHERE dish_id = ?);
                     DELETE FROM Comment WHERE dish_id = ?;
                     DELETE FROM Dish WHERE dish_id = ?;""";
        try (Connection conn = ConnectDB.getInstance().openConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, dishId);
            pstmt.setInt(2, dishId);
            pstmt.setInt(3, dishId);
            pstmt.setInt(4, dishId);
            pstmt.setInt(5, dishId);
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
        String sql = "UPDATE Dish SET name = ?, Picture = ?, description = ?, price = ?, type = ?, ingredients = ?, dislocal = ?, updated_at = GETDATE() WHERE Dish_id = ?";
        try (Connection conn = ConnectDB.getInstance().openConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dish.getName());
            pstmt.setString(2, dish.getPicture());
            pstmt.setString(3, dish.getDescription());
            pstmt.setDouble(4, dish.getPrice());
            pstmt.setString(5, dish.getType());
            pstmt.setString(6, dish.getIngredients());
            pstmt.setBoolean(7, dish.isDislocal());
            pstmt.setInt(8, dish.getDish_id());
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                // Cập nhật danh sách Dish nếu cần
                for (Dish d : List) {
                    if (d.getDish_id() == dish.getDish_id()) {
                        d.setName(dish.getName());
                        d.setPicture(dish.getPicture());
                        d.setDescription(dish.getDescription());
                        d.setPrice(dish.getPrice());
                        d.setType(dish.getType());
                        d.setIngredients(dish.getIngredients());
                        d.setUpdated_at(dish.getUpdated_at());
                        d.setDislocal(dish.isDislocal());
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
    public static void main(String[] args) {
        // Khởi tạo DishManager
        DishManager dishManager = new DishManager();
        
        // Lấy danh sách các món ăn
        ArrayList<Dish> dishes = dishManager.getList();
        
        // In thông tin của từng món ăn
        for (Dish dish : dishes) {
            System.out.println("Dish ID: " + dish.getDish_id());
            System.out.println("Account ID: " + dish.getAccount().getAccount_id());
            System.out.println("Name: " + dish.getName());
            System.out.println("Picture: " + dish.getPicture());
            System.out.println("Description: " + dish.getDescription());
            System.out.println("Price: " + dish.getPrice());
            System.out.println("Type: " + dish.getType());
            System.out.println("Ingredients: " + dish.getIngredients());
            System.out.println("Dislocal: " + dish.isDislocal());
            System.out.println("Created At: " + dish.getCreated_at());
            System.out.println("Updated At: " + dish.getUpdated_at());
            System.out.println("--------------------------");
        }
    }
}
