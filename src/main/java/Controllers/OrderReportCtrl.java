/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.OrderDAO;
import Models.DBModels.Order;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author PC
 */
public class OrderReportCtrl extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int role = (int) session.getAttribute("role");
        if (role != 4) {
            response.sendRedirect("/Home");
            return;
        }
        
        OrderDAO dao = new OrderDAO();
        ArrayList<Order> orders = dao.getOrderListDateASC();
        List<Order> filteredOrders = new ArrayList<>();
        List<Order> MonthOrders = dao.getOrderListByMonth(Utilities.DateMethods.getCurrentMonth());
        List<Order> ChartOrders = new ArrayList<>();
        List<Order> PieOrders = new ArrayList<>();
        List<Order> ProcrastOrders = new ArrayList<>();
        ArrayList<String> listDate = new ArrayList<>();
        ArrayList<String> listFinish = new ArrayList<>();
        ArrayList<String> listWait = new ArrayList<>();
        ArrayList<String> listTer = new ArrayList<>();
        // Get the current timestamp
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentTimestamp);
        calendar.add(Calendar.MONTH, -3);
        Timestamp threeMonthsAgo = new Timestamp(calendar.getTimeInMillis());
        String inputDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(new Date(currentTimestamp.getTime()));

        String StartWeek = "2023-10-30";
        String EndWeel = "2023-11-05";
        String[] dateStrings = Utilities.DateMethods.getWeekRange(inputDate);
        System.out.println(dateStrings[0]);

        // Convert the formatted date strings to Timestamp objects
        Timestamp startDate = Timestamp.valueOf(dateStrings[0]);
        Timestamp endDate = Timestamp.valueOf(dateStrings[1]);

        int finishAll = 0;
        int terminateAll = 0;
        int waittingAll = 0;
        for (Order order : orders) {
            waittingAll++;
            if (order.getDate().compareTo(startDate) >= 0 && order.getDate().compareTo(endDate) <= 0) {
                filteredOrders.add(order);
            }
            if (order.getDate().compareTo(startDate) >= 0 && order.getDate().compareTo(endDate) <= 0) {
                ChartOrders.add(order);
            }
            if (order.getDate().compareTo(threeMonthsAgo) >= 0 && order.getDate().compareTo(currentTimestamp) <= 0) {
                PieOrders.add(order);
            }
            
            if (dao.getOrderStatusName(order.getId()).equals("Thành công")) {
                finishAll++;
            } else if (dao.getOrderStatusName(order.getId()).equals("Đã hủy")) {
                terminateAll++;
            }else{
               if(Utilities.DateMethods.isGreaterThanSixDays(currentTimestamp, order.getDate())== true){
                   ProcrastOrders.add(order);
               }
            }

        }
        

        int finish = 0;
        int terminate = 0;
        int waitting = 0;
        for (Order filteredOrder : filteredOrders) {
            waitting++;
            if (dao.getOrderStatusName(filteredOrder.getId()).equals("Thành công")) {
                finish++;
            } else if (dao.getOrderStatusName(filteredOrder.getId()).equals("Đã hủy")) {
                terminate++;
            }

        }
        int finishMonth = 0;
        int terminateMonth = 0;
        int waittingMonth = 0;
        for (Order MonthOrder : MonthOrders) {
            waittingMonth++;
            if (dao.getOrderStatusName(MonthOrder.getId()).equals("Thành công")) {
                finishMonth++;
            } else if (dao.getOrderStatusName(MonthOrder.getId()).equals("Đã hủy")) {
                terminateMonth++;
            }

        }
        int finishChartDiv = 0;
        int terminateChartDiv = 0;
        int waittingChartDiv = 0;
        for (Order MonthOrder : ChartOrders) {
            waittingChartDiv++;
            if (dao.getOrderStatusName(MonthOrder.getId()).equals("Thành công")) {
                finishChartDiv++;
            } else if (dao.getOrderStatusName(MonthOrder.getId()).equals("Đã hủy")) {
                terminateChartDiv++;
            }

        }

        int finishChart = 0;
        int terminateChart = 0;
        int waittingChart = 0;
        String previousDate = null; // Initialize the previous date
        int WaitIndex = 0;
        int WaitPreValue = 0;
        int TerIndex = 0;
        int TerPreValue = 0;
        int FiIndex = 0;
        int FiPreValue = 0;
        for (int i = 0; i < ChartOrders.size(); i++) {
            String currentDateStr = Utilities.DateMethods.timestampToString(ChartOrders.get(i).getDate());

            // Compare the current date with the previous date
            if (!currentDateStr.equals(previousDate)) {
                // Add the unique date to listDate
                listDate.add(currentDateStr);
                waittingChart++;
                if (dao.getOrderStatusName(ChartOrders.get(i).getId()).equals("Thành công")) {
                    finishChart++;
                } else if (dao.getOrderStatusName(ChartOrders.get(i).getId()).equals("Đã hủy")) {
                    terminateChart++;
                }
                listWait.add(waittingChart + "");
                WaitIndex = listWait.size() - 1;
                WaitPreValue = waittingChart;
                waittingChart = 0;
                listTer.add(terminateChart + "");
                TerIndex = listTer.size() - 1;
                TerPreValue = terminateChart;
                terminateChart = 0;
                listFinish.add(finishChart + "");
                FiIndex = listFinish.size() - 1;
                FiPreValue = finishChart;
                finishChart = 0;

            } else {

                listWait.set(WaitIndex, (WaitPreValue + 1) + "");
                if (dao.getOrderStatusName(ChartOrders.get(i).getId()).equals("Thành công")) {
                    listFinish.set(FiIndex, (FiPreValue + 1) + "");
                } else if (dao.getOrderStatusName(ChartOrders.get(i).getId()).equals("Đã hủy")) {
                    listTer.set(TerIndex, (TerPreValue + 1) + "");
                }
            }
            previousDate = currentDateStr;
        }

        int finishPie = 0;
        int terminatePie = 0;
        int waittingPie = 0;
        for (Order MonthOrder : PieOrders) {

            if (dao.getOrderStatusName(MonthOrder.getId()).equals("Thành công")) {
                finishPie++;
            } else if (dao.getOrderStatusName(MonthOrder.getId()).equals("Đã hủy")) {
                terminatePie++;
            } else {
                waittingPie++;
            }

        }

        request.setAttribute("finishCounnt", finish);
        request.setAttribute("terminateCounnt", terminate);
        request.setAttribute("waittingCounnt", waitting);

        request.setAttribute("finishMonth", finishMonth);
        request.setAttribute("terminateMonth", terminateMonth);
        request.setAttribute("waittingMonth", waittingMonth);

        request.setAttribute("finishAll", finishAll);
        request.setAttribute("terminateAll", terminateAll);
        request.setAttribute("waittingAll", waittingAll);

        request.setAttribute("finishChart", finishChartDiv);
        request.setAttribute("terminateChart", terminateChartDiv);
        request.setAttribute("waittingChart", waittingChartDiv);
        String datesForChart = Utilities.DateMethods.convertListToString(listDate).replace("/", "-");
        String finishForChart = Utilities.DateMethods.convertListToStringNumber(listFinish);
        String TerForChart = Utilities.DateMethods.convertListToStringNumber(listTer);
        String WaitForChart = Utilities.DateMethods.convertListToStringNumber(listWait);
        request.setAttribute("datesForChart", datesForChart);
        request.setAttribute("finishForChart", finishForChart);
        request.setAttribute("TerForChart", TerForChart);
        request.setAttribute("WaitForChart", WaitForChart);

        request.setAttribute("finishPie", finishPie);
        request.setAttribute("terminatePie", terminatePie);
        request.setAttribute("waittingPie", waittingPie);

        request.setAttribute("StartWeek", StartWeek);
        request.setAttribute("EndWeel", EndWeel);
        
        if (ProcrastOrders.size() < 5) {
            request.setAttribute("orders", ProcrastOrders.subList(0, ProcrastOrders.size()));
        } else {
            request.setAttribute("orders", ProcrastOrders.subList(0, 5));
        }
        
        request.setAttribute("orderDAO", dao);

        request.getRequestDispatcher("/Views/Admin/OrderReport/OrderReport.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String UserStartDate = request.getParameter("dateStart");
        String UserEndDate = request.getParameter("dateEnd");

        OrderDAO dao = new OrderDAO();
        ArrayList<Order> orders = dao.getOrderListDateASC();
        List<Order> filteredOrders = new ArrayList<>();
        List<Order> MonthOrders = dao.getOrderListByMonth(Utilities.DateMethods.getCurrentMonth());
        List<Order> ChartOrders = new ArrayList<>();
        List<Order> PieOrders = new ArrayList<>();
        ArrayList<String> listDate = new ArrayList<>();
        ArrayList<String> listFinish = new ArrayList<>();
        ArrayList<String> listWait = new ArrayList<>();
        ArrayList<String> listTer = new ArrayList<>();
         List<Order> ProcrastOrders = new ArrayList<>();
        // Get the current timestamp
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentTimestamp);
        calendar.add(Calendar.MONTH, -3);
        Timestamp threeMonthsAgo = new Timestamp(calendar.getTimeInMillis());
        String inputDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(new Date(currentTimestamp.getTime()));

        String[] dateStrings = Utilities.DateMethods.getWeekRange(inputDate);
        System.out.println(dateStrings[0]);

        // Convert the formatted date strings to Timestamp objects
        Timestamp startDate = Timestamp.valueOf(dateStrings[0]);
        Timestamp endDate = Timestamp.valueOf(dateStrings[1]);

        Timestamp ChosenStartDate = Timestamp.valueOf(UserStartDate + " 00:00:00");
        Timestamp ChosenendDate = Timestamp.valueOf(UserEndDate + " 23:59:00");

        int finishAll = 0;
        int terminateAll = 0;
        int waittingAll = 0;
        for (Order order : orders) {
            waittingAll++;
            if (order.getDate().compareTo(startDate) >= 0 && order.getDate().compareTo(endDate) <= 0) {
                filteredOrders.add(order);
            }
            if (order.getDate().compareTo(ChosenStartDate) >= 0 && order.getDate().compareTo(ChosenendDate) <= 0) {
                ChartOrders.add(order);
            }
            if (order.getDate().compareTo(threeMonthsAgo) >= 0 && order.getDate().compareTo(currentTimestamp) <= 0) {
                PieOrders.add(order);
            }
            switch (dao.getOrderStatusName(order.getId())) {
                case "Thành công":
                    finishAll++;
                    break;
                case "Đã hủy":
                    terminateAll++;
                    break;
                default:
                    if(Utilities.DateMethods.isGreaterThanSixDays(currentTimestamp, order.getDate())== true){
                        ProcrastOrders.add(order);
                    }   
                    break;
            }
        }

        int finish = 0;
        int terminate = 0;
        int waitting = 0;
        for (Order filteredOrder : filteredOrders) {
            waitting++;
            if (dao.getOrderStatusName(filteredOrder.getId()).equals("Thành công")) {
                finish++;
            } else if (dao.getOrderStatusName(filteredOrder.getId()).equals("Đã hủy")) {
                terminate++;
            }
        }
        int finishMonth = 0;
        int terminateMonth = 0;
        int waittingMonth = 0;
        for (Order MonthOrder : MonthOrders) {
            waittingMonth++;
            if (dao.getOrderStatusName(MonthOrder.getId()).equals("Thành công")) {
                finishMonth++;
            } else if (dao.getOrderStatusName(MonthOrder.getId()).equals("Đã hủy")) {
                terminateMonth++;
            }
        }

        int finishChartDiv = 0;
        int terminateChartDiv = 0;
        int waittingChartDiv = 0;
        for (Order MonthOrder : ChartOrders) {
            waittingChartDiv++;
            if (dao.getOrderStatusName(MonthOrder.getId()).equals("Thành công")) {
                finishChartDiv++;
            } else if (dao.getOrderStatusName(MonthOrder.getId()).equals("Đã hủy")) {
                terminateChartDiv++;
            }
        }

        int finishChart = 0;
        int terminateChart = 0;
        int waittingChart = 0;
        String previousDate = null; // Initialize the previous date
        int WaitIndex = 0;
        int WaitPreValue = 0;
        int TerIndex = 0;
        int TerPreValue = 0;
        int FiIndex = 0;
        int FiPreValue = 0;
        for (int i = 0; i < ChartOrders.size(); i++) {
            String currentDateStr = Utilities.DateMethods.timestampToString(ChartOrders.get(i).getDate());

            // Compare the current date with the previous date
            if (!currentDateStr.equals(previousDate)) {
                // Add the unique date to listDate
                listDate.add(currentDateStr);
                waittingChart++;
                if (dao.getOrderStatusName(ChartOrders.get(i).getId()).equals("Thành công")) {
                    finishChart++;
                } else if (dao.getOrderStatusName(ChartOrders.get(i).getId()).equals("Đã hủy")) {
                    terminateChart++;
                }
                listWait.add(waittingChart + "");
                WaitIndex = listWait.size() - 1;
                WaitPreValue = waittingChart;
                waittingChart = 0;
                listTer.add(terminateChart + "");
                TerIndex = listTer.size() - 1;
                TerPreValue = terminateChart;
                terminateChart = 0;
                listFinish.add(finishChart + "");
                FiIndex = listFinish.size() - 1;
                FiPreValue = finishChart;
                finishChart = 0;
            } else {
                listWait.set(WaitIndex, (WaitPreValue + 1) + "");
                if (dao.getOrderStatusName(ChartOrders.get(i).getId()).equals("Thành công")) {
                    listFinish.set(FiIndex, (FiPreValue + 1) + "");
                } else if (dao.getOrderStatusName(ChartOrders.get(i).getId()).equals("Đã hủy")) {
                    listTer.set(TerIndex, (TerPreValue + 1) + "");
                }
            }
            previousDate = currentDateStr;
        }

        int finishPie = 0;
        int terminatePie = 0;
        int waittingPie = 0;
        for (Order MonthOrder : PieOrders) {
            if (dao.getOrderStatusName(MonthOrder.getId()).equals("Thành công")) {
                finishPie++;
            } else if (dao.getOrderStatusName(MonthOrder.getId()).equals("Đã hủy")) {
                terminatePie++;
            } else {
                waittingPie++;
            }
        }

        request.setAttribute("finishCounnt", finish);
        request.setAttribute("terminateCounnt", terminate);
        request.setAttribute("waittingCounnt", waitting);

        request.setAttribute("finishMonth", finishMonth);
        request.setAttribute("terminateMonth", terminateMonth);
        request.setAttribute("waittingMonth", waittingMonth);

        request.setAttribute("finishAll", finishAll);
        request.setAttribute("terminateAll", terminateAll);
        request.setAttribute("waittingAll", waittingAll);

       request.setAttribute("finishChart", finishChartDiv);
        request.setAttribute("terminateChart", terminateChartDiv);
        request.setAttribute("waittingChart", waittingChartDiv);
        String datesForChart = Utilities.DateMethods.convertListToString(listDate).replace("/", "-");
        String finishForChart = Utilities.DateMethods.convertListToStringNumber(listFinish);
        String TerForChart = Utilities.DateMethods.convertListToStringNumber(listTer);
        String WaitForChart = Utilities.DateMethods.convertListToStringNumber(listWait);
        request.setAttribute("datesForChart", datesForChart);
        request.setAttribute("finishForChart", finishForChart);
        request.setAttribute("TerForChart", TerForChart);
        request.setAttribute("WaitForChart", WaitForChart);

        request.setAttribute("finishPie", finishPie);
        request.setAttribute("terminatePie", terminatePie);
        request.setAttribute("waittingPie", waittingPie);

        request.setAttribute("UserStartDate", UserStartDate);
        request.setAttribute("UserEndDate", UserEndDate);
        
        if (ProcrastOrders.size() < 5) {
            request.setAttribute("orders", ProcrastOrders.subList(0, ProcrastOrders.size()));
        } else {
            request.setAttribute("orders", ProcrastOrders.subList(0, 5));
        }
        request.setAttribute("orderDAO", dao);

        request.getRequestDispatcher("/Views/Admin/OrderReport/OrderReport.jsp").forward(request, response);
    }
}
