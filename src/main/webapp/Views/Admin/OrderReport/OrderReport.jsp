<%-- 
    Document   : ReportOrder
    Created on : Nov 2, 2023, 9:01:18 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Blank Page</title>
        <jsp:include page="/Views/head.jsp"/>
        <style>
            .waittingTitle{
                font-size: 1.1em;
                font-weight: bold;
                text-align: center;
            }
            .finishTitle{
                font-size: 1.8em;
                font-weight: bold;
                text-align: center;
            }
            .terminateTitle{
                font-size: 1.3em;
                font-weight: bold;
            }
            .boxTitle{
                color: black;
                font-weight: bold;
                background-color: white;
                width: 32%;
                border-bottom-right-radius:10px;
                border-top-left-radius: 5px;

            }

            .waitting{
                background-color: #fdf5dd;
                color: #cfa00c;
                border-radius: 10px;
                padding: 5px;
            }
            .finish{
                background-color: white;
                color: black;
                font-weight: bold;
                border-radius: 10px;
                padding: 3px;
                border: 2px solid #668CD4;
            }
            .terminate{
                background-color:#FFDADA;
                color: #EF4848;
                border-radius: 10px;
                padding: 5px;
            }

            tbody tr {
                cursor: pointer;

            }
            .tach{
                margin-left: 3px;
            }
            #chartButton{
                padding: 5px;
                border-radius: 15px;
                color: white;
                font-weight: bold;
                font-size: 1.1em;
                background-image: linear-gradient(to right,#FEB82C, #EF7C57);
                border: 2px solid #EF7C57;
            }
            #chartButton:hover{
                background-image: linear-gradient(to right,#EC4585, #B555A3);
                font-weight: bold;
                font-size: 1.1em;
                border: 2px solid #B555A3;
            }
        </style>
    </head>

    <body>
       <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light d-flex">
            <jsp:include page="/Views/aside.jsp"/>
            
            <div class="container">
                <div class="mt-2">
                    <div class="row d-flex justify-content-between">
                        <div class="col-md-4 p-2 ">
                            <div class="shadow pb-2 pr-2 rounded" style=" background-image: linear-gradient(to right,#EC4585, #B555A3);">  
                                <div class="boxTitle p-1" style=" border: 2px solid #B555A3;" >Tuần này</div>
                                <div class="d-flex justify-content-around">
                                    <div class="p-2 m-2 text-white">
                                        <div class="waittingTitle">Đơn đã đặt</div>
                                        <div class="finishTitle">${requestScope.waittingCounnt}</div>
                                    </div>
                                    <div class=" p-2 m-2 text-white">
                                        <div class="waittingTitle" >Đơn thành công</div>
                                        <div class="finishTitle">${requestScope.finishCounnt}</div>
                                    </div>
                                    <div class="p-2 m-2 text-white">
                                        <div  class="waittingTitle"> Đơn đã hủy</div>
                                        <div class="finishTitle">${requestScope.terminateCounnt}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 p-2">
                            <div class="shadow pb-2 pr-2  rounded" style=" background-image: linear-gradient(to right,#49C6F1, #668CD4);">  
                                <div class="boxTitle p-1" style=" border: 2px solid #668CD4;">Tháng này</div>
                                <div class="d-flex justify-content-around">
                                    <div class="p-2 m-2 text-white">
                                        <div  class="waittingTitle">Đơn đã đặt</div>
                                        <div class="finishTitle">${requestScope.waittingMonth}</div>
                                    </div>
                                    <div class=" p-2 m-2 text-white">
                                        <div  class="waittingTitle" >Đơn thành công</div>
                                        <div class="finishTitle">${requestScope.finishMonth}</div>
                                    </div>
                                    <div class="p-2 m-2 text-white">
                                        <div  class="waittingTitle"> Đơn đã hủy</div>
                                        <div class="finishTitle">${requestScope.terminateMonth}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 p-2">
                            <div class="shadow pb-2 pr-2 rounded" style=" background-image: linear-gradient(to right,#FEB82C, #EF7C57);">  
                                <div class="boxTitle p-1" style=" border: 2px solid #EF7C57;">Tổng đơn hàng</div>
                                <div class="d-flex justify-content-around">
                                    <div class="p-2 m-2 text-white">
                                        <div  class="waittingTitle">Đơn đã đặt</div>
                                        <div class="finishTitle">${requestScope.waittingAll}</div>
                                    </div>
                                    <div class=" p-2 m-2 text-white">
                                        <div  class="waittingTitle">Đơn thành công</div>
                                        <div class="finishTitle">${requestScope.finishAll}</div>
                                    </div>
                                    <div class="p-2 m-2 text-white">
                                        <div  class="waittingTitle"> Đơn đã hủy</div>
                                        <div class="finishTitle">${requestScope.terminateAll}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 bg-white p-3 shadow rounded-3">
                        <div class="col-md-12">
                            <h5 class="pt-3">Chọn khoảng thống kê</h5>
                            <form action="/Manager/Report" method="post" onsubmit="return validateDateRange();">
                                <div class="d-flex">
                                    <div class="d-flex align-items-center m-2">
                                        <label class="text-nowrap m-2">Từ ngày</label>
                                        <input type="date" class="form-control" value="${(requestScope.UserStartDate != null) ? requestScope.UserStartDate : StartWeek}" name="dateStart" id="dateStart">

                                    </div>
                                    <div class="d-flex align-items-center m-2">
                                        <div class="text-nowrap m-2">đến ngày</div>
                                        <input type="date" class="form-control" value="${(requestScope.UserEndDate != null) ? requestScope.UserEndDate : EndWeel}" name="dateEnd" id="dateEnd">
                                    </div>
                                    <button type="submit" class="btn btn-primary m-2">Xác nhận</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-10" id="chart"></div>
                        <div class="col-md-2 d-flex justify-content-start card p-2 align-items-center"style=" background-image: linear-gradient(to bottom,#49C6F1, #668CD4);">
                            <div class="d-flex justify-content-around">
                                <div class="finish ">${(requestScope.UserStartDate != null) ? requestScope.UserStartDate : StartWeek}</div>
                                <div class="finish tach">${(requestScope.UserEndDate != null) ? requestScope.UserEndDate : EndWeel}</div>
                            </div>
                            <div class="">
                                <div class=" p-2">
                                    <div class="waittingTitle text-white" >Đơn đã đặt</div>
                                    <div class="finishTitle text-white">${requestScope.waittingChart}</div>
                                    <hr>
                                </div>
                                <div class=" p-2">
                                    <div  class="waittingTitle text-white">Đơn thành công</div>
                                    <div class="finishTitle text-white">${requestScope.finishChart}</div>
                                    <hr>
                                </div>
                                <div class="p-2">
                                    <div  class="waittingTitle text-white">Đơn đã hủy</div>
                                    <div class="finishTitle text-white">${requestScope.terminateChart}</div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="hr">
                    <div class="row mt-2 pt-3 pb-3 d-flex justify-content-around">
                        <div class="col-md-7 rounded-1" >
                            <div class="shadow  rounded" style=" background-image: linear-gradient(to right,#49C6F1, #668CD4);">
                                <div class="p-3 text-white terminateTitle" style="text-align: center;" >Các đơn hàng lâu chưa được xử lý</div>
                                <div style="height: 280px; overflow-y: auto; background-color: white">
                                    <table class="table p-2 table-responsive-sm table-hover">
                                        <thead class="p-2">
                                            <tr data-link="">
                                                <th scope="col">ID đơn hàng</th>
                                                <th scope="col">khách hàng</th>
                                                <th scope="col">Ngày đặt</th>
                                                <th scope="col">Trạng thái</th>
                                            </tr>
                                        </thead>

                                        <c:set var="orderDAO" value="${requestScope.orderDAO}" />
                                        <tbody>
                                            <c:forEach items="${requestScope.orders}" var="order">
                                                <tr data-link="OrderStatusUpdate?id=${order.getId()}" >
                                                    <th scope="row">${order.getId()}</th>
                                                    <td>${order.getCustomerId()}</td>
                                                    <td class="date">${order.getDate()}</td>
                                                    <td> <span class="status"> ${orderDAO.getOrderStatusName(order.getId())} </span></td>
                                                </tr>
                                            </c:forEach>  
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-5 p-2 bg-white shadow rounded-1" >
                            <button id="chartButton" class="btn">Change</button>
                            <canvas id="userChart" style="display: block; box-sizing: border-box;"></canvas>
                            <canvas id="myChart" style="display: none; box-sizing: border-box;"></canvas>


                        </div>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <jsp:include page="/Views/foot.jsp"/>
        
        <script>
            var options = {
                series: [{
                        name: 'Đã hoàn thành',
                        data: [${requestScope.finishForChart}]
                    }, {
                        name: 'Đã đặt',
                        data: [${requestScope.WaitForChart}]
                    }, {
                        name: 'Đã hủy',
                        data: [${requestScope.TerForChart}]
                    }],
                chart: {
                    height: 370,
                    type: 'area'
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'straight'
                },
                xaxis: {
                    type: 'datetime',
                    categories: [${requestScope.datesForChart}]
                },
                yaxis: {
                    labels: {
                        formatter: function (value) {
                            // Format the y-axis label with a comma as a thousand separator
                            return value.toLocaleString();
                        }
                    }
                },
                tooltip: {
                    x: {
                        format: 'dd/MM/yy'
                    },

                    y: {
                        formatter: function (value) {
                            // Format the tooltip value with a comma as a thousand separator
                            return value.toLocaleString();
                        }
                    }
                },
            };

            var chart = new ApexCharts(document.querySelector("#chart"), options);
            chart.render();
        </script>

        <script>
            const xValues = ["Đã thành công", "Đang thực hiện", "Đã hủy"];
            const yValues = [${requestScope.finishPie}, ${(requestScope.waittingPie)-(requestScope.finishPie)-(requestScope.finishPie)}, ${requestScope.terminatePie}];
            const yUserValues = [${requestScope.finishChart}, ${(requestScope.waittingChart)-(requestScope.finishChart)-(requestScope.terminateChart)}, ${requestScope.terminateChart}];
            const barColors = [
                "#B555A3",
                "#668CD4",
                "#EF7C57"
            ];

            new Chart("myChart", {
                type: "doughnut",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: barColors,
                            data: yValues
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: "Đơn hàng trong 3 tháng gần nhất",
                        fontSize: 24
                    }
                }
            });

            new Chart("userChart", {
                type: "doughnut",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: barColors,
                            data: yUserValues
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: "Đơn hàng từ ${(requestScope.UserStartDate != null) ? requestScope.UserStartDate : StartWeek} đến ${(requestScope.UserEndDate != null) ? requestScope.UserEndDate : EndWeel} ",
                        fontSize: 24
                    }
                }
            });

            function validateDateRange() {
                var dateStart = document.getElementById('dateStart').value;
                var dateEnd = document.getElementById('dateEnd').value;

                if (dateStart >= dateEnd) {
                    alert("Vui lòng chọn ngày kết thúc lớn hơn ngày bắt đầu.");
                    return false;
                }

                return true;
            }

            document.addEventListener("DOMContentLoaded", function () {
                var cancels = document.querySelectorAll(".status");
                cancels.forEach(function (subElement) {
                    var statusText = subElement.textContent.trim();
                    if (statusText === 'Đã hủy') {

                        subElement.classList.add("terminate");
                    } else if (statusText === 'Thành công') {

                        subElement.classList.add("finish");
                    } else {
                        subElement.classList.add("waitting");

                    }
                });

                var dates = document.querySelectorAll('.date');
                dates.forEach(function (dateElement) {
                    var dateText = dateElement.textContent;
                    var formattedDate = dateText.replace(/\.\d+/g, ''); // Remove the dot and numbers after it
                    dateElement.textContent = formattedDate;
                });

                var button = document.getElementById("chartButton");
                var userCanvas = document.getElementById("userChart");
                var myCanvas = document.getElementById("myChart");

                // Add a click event listener to the button
                button.addEventListener("click", function () {
                    if (userCanvas.style.display === "none") {
                        // Switch to userChart
                        userCanvas.style.display = "block";
                        myCanvas.style.display = "none";
                    } else {
                        // Switch to myChart
                        userCanvas.style.display = "none";
                        myCanvas.style.display = "block";
                    }
                });

            });

            var rows = document.querySelectorAll("table tbody tr");

            // Add a click event listener to each row
            rows.forEach(function (row) {
                row.addEventListener("click", function () {
                    // Extract the link from the data-link attribute
                    var link = row.getAttribute("data-link");

                    // Navigate to the link
                    if (link) {
                        window.location.href = link;
                    }
                });
            });
        </script>
    </body>
</html>