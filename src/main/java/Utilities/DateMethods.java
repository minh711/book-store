/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utilities;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author PC
 */
public class DateMethods {
 public static String[] getWeekRange(String inputDate) {
        String[] weekRange = new String[2];
        try {
            SimpleDateFormat sdfInput = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            SimpleDateFormat sdfOutput = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            
            Date date = sdfInput.parse(inputDate);

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);

            // Set to the start of the week (Monday)
            calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);

            // Get the start date of the week (Monday)
            weekRange[0] = sdfOutput.format(calendar.getTime());

            // Add 6 days to get the end date of the week (Sunday)
            calendar.add(Calendar.DATE, 6);
            calendar.set(Calendar.HOUR_OF_DAY, 23);
            calendar.set(Calendar.MINUTE, 59);
            calendar.set(Calendar.SECOND, 59);

            // Get the end date of the week (Sunday)
            weekRange[1] = sdfOutput.format(calendar.getTime());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return weekRange;
    }
     
      public static int getCurrentMonth() {
        Calendar calendar = Calendar.getInstance();
        int currentMonth = calendar.get(Calendar.MONTH) + 1; 
        return currentMonth;
    }
      
       public static String timestampToString(Timestamp timestamp) {
        // Define the desired date format
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

        // Format the timestamp to a string
        String formattedDate = dateFormat.format(timestamp);

        return formattedDate;
    }
       
        public static String convertListToString(ArrayList<String> dateList) {
        if (dateList == null || dateList.isEmpty()) {
            return "";
        }

        StringBuilder result = new StringBuilder();
        for (String date : dateList) {
            result.append('"').append(date).append('"').append(", ");
        }

        // Remove the trailing ", " from the result
        result.setLength(result.length() - 2);

        return result.toString();
    }
          public static String convertListToStringNumber(ArrayList<String> dateList) {
        if (dateList == null || dateList.isEmpty()) {
            return "";
        }

        StringBuilder result = new StringBuilder();
        for (String date : dateList) {
            result.append(date).append(", ");
        }

        // Remove the trailing ", " from the result
        result.setLength(result.length() - 2);

        return result.toString();
    }
          
        public static boolean isGreaterThanSixDays(Timestamp dateNow, Timestamp dateCompare) {
        long millisecondsPerDay = 24 * 60 * 60 * 1000;
        long dateNowMillis = dateNow.getTime();
        long dateCompareMillis = dateCompare.getTime();
        long differenceInMillis = dateNowMillis - dateCompareMillis;
        int differenceInDays = (int) (differenceInMillis / millisecondsPerDay);

        return differenceInDays > 6;
    }
        
        public static void main(String[] args) {
    // Example usage
        Timestamp dateNow = new Timestamp(System.currentTimeMillis()); // Current timestamp
        Timestamp dateCompare = Timestamp.valueOf("2023-11-14 00:00:00"); // Example comparison date

        boolean result = isGreaterThanSixDays(dateNow, dateCompare);
        System.out.println("Is the difference greater than 6 days? " + result);
    }
}
