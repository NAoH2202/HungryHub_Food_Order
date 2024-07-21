/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

/**
 *
 * @author lenovo
 */
public class Datetime {
    public static LocalDateTime convertToLocalDateTime(Date date) {
        // Chuyển đổi từ Date sang ZonedDateTime
        ZonedDateTime zonedDateTime = date.toInstant().atZone(ZoneId.systemDefault());
        
        // Chuyển đổi từ ZonedDateTime sang LocalDateTime
        return zonedDateTime.toLocalDateTime();
    }
}
