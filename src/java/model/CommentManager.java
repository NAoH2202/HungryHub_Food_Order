/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author lenovo
 */
public class CommentManager {

    private ArrayList<Comment> List;

    public CommentManager() {
        List = CommentDao.getAllComments();
    }

    public ArrayList<Comment> sortByCreatedAt(ArrayList<Comment> comments) {
        comments.sort(Comparator.comparing(Comment::getCreated_at));
        return comments;
    }

    public static ArrayList<Comment> sortCommentsByTimeDesc(ArrayList<Comment> comments) {
        // Sử dụng Collections.sort với Comparator để sắp xếp
        Collections.sort(comments, new Comparator<Comment>() {
            @Override
            public int compare(Comment c1, Comment c2) {
                // So sánh dựa trên thời gian created_at
                return c2.getCreated_at().compareTo(c1.getCreated_at());
            }
        });
        return comments;
    }

    public ArrayList<Comment> getList() {
        return sortCommentsByTimeDesc(List);
    }

    public double ratingDiner(int dinerId) {
        ArrayList<Comment> clist1 = getCommentByDinerId(dinerId);
        if (clist1 == null || clist1.isEmpty()) {
            return 0.0; // Trả về 0 nếu không có đánh giá
        }
        int totalRate = 0;
        for (Comment comment : clist1) {
            totalRate += comment.getRating();
        }
        return (double) totalRate / clist1.size();
    }

    public double ratingDish(int dishId) {
        ArrayList<Comment> clist1 = getCommentByDishId(dishId);
        if (clist1 == null || clist1.isEmpty()) {
            return 0.0; // Trả về 0 nếu không có đánh giá
        }
        int totalRate = 0;
        for (Comment comment : clist1) {
            totalRate += comment.getRating();
        }
        return (double) totalRate / clist1.size();
    }

    public double ratingTotal(int dinerId) {
        double ratingDiner = ratingDiner(dinerId);
        DishManager dm = new DishManager();
        ArrayList<Dish> dlist = dm.getDishByDinerId(dinerId);
        double totalDishrate = 0;
        for (Dish d : dlist) {
            totalDishrate += ratingDish(d.getDish_id());
        }
        double ratingDish = totalDishrate / dlist.size();
        return (ratingDiner + ratingDish) / 2;
    }

    public Comment getCommentById(int id) {
        for (Comment facc : List) {
            if (id == facc.getCommentId()) {
                return facc;
            }
        }
        return null;
    }

    public ArrayList<Comment> getCommentByDinerId(int id) {
        ArrayList<Comment> clist = new ArrayList<>();
        for (Comment facc : List) {
            if (facc.getDiner() != null) {
                if (id == facc.getDiner().getAccount_id()) {
                    clist.add(facc);
                }
            }
        }
        return clist;
    }

    public ArrayList<Comment> getCommentByDishId(int id) {
        ArrayList<Comment> clist = new ArrayList<>();
        for (Comment facc : List) {
            if (facc.getDish() != null) {
                if (id == facc.getDish().getDish_id()) {
                    clist.add(facc);
                }
            }
        }
        return clist;
    }

    public static void main(String[] args) {
        CommentManager cm = new CommentManager();
        System.out.println(cm.ratingTotal(3));
//        for(Comment cmt : cm.getList()){
//            System.out.println(cmt);
//        }
    }
}
