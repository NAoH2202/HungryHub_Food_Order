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
public class CommentDishManager {
    ArrayList<CommentDish> List;

    public CommentDishManager() {
        List = CommentDishDao.getAllCommentDishs();
    }
    
    public CommentDish getCommentDishById(int id) {
        for (CommentDish facc : List) {
            if (id == facc.getComment_id()) {
                return facc;
            }
        }
        return null;
    }
}
