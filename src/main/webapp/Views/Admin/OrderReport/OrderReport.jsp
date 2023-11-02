<%-- 
    Document   : ReportOrder
    Created on : Nov 2, 2023, 9:01:18 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Blank Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>     
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    </head>

    <body>
      

        <header class="d-flex justify-content-between" style="padding: 10px;">
            <div class="d-flex align-items-center justify-content-between">
                <img src="/image/logo.png" style="height: 40px;">
            </div>

            <div class="d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <a class="text-dark text-center nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-bell mx-2"></i><br>
                        Thông báo <span class="text-danger">(3)</span>
                    </a>
                    <div class="dropdown">
                        <a class="text-dark nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Xin chào,<br>Admin
                        </a>
                        <ul class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item p-2" href="#">Đơn hàng</a></li>
                            <li><a class="dropdown-item p-2" href="#">Thông tin tài khoản</a></li>
                            <li><a class="dropdown-item p-2" href="#">Đăng xuất <i class="fa fa-sign-out"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <main class="bg-light d-flex">
            <aside>
                <div class="flex-shrink-0 p-3" style="width: 280px;">
                    <a href="#"
                       class="text-dark d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                        Quản trị
                    </a>
                    <ul class="list-unstyled ps-0">
                        <li class="mb-1  bg-primary rounded">
                            <a class="text-light nav-link">Thống kê</a>
                        </li>
                        <li class="mb-1">
                            <a class="text-dark nav-link">Danh sách Sách</a>
                        </li>
                        <li class="mb-1">
                            <a class="text-dark nav-link">Danh mục Sách</a>
                        </li>
                        <li class="mb-1">
                            <a class="text-dark nav-link">Danh sách Đơn hàng</a>
                        </li>
                        <li class="mb-1">
                            <a class="text-dark nav-link">Danh sách tài khoản</a>
                        </li>
                        <li class="mb-1">
                            <a class="text-dark nav-link">Danh sách Thông báo</a>
                        </li>
                    </ul>
                </div>
            </aside>
            <div class="container">
                <div class="mt-2">
                    <h5>Thống kê thu nhập?</h5>
                    <div class="row d-flex justify-content-between">
                    <div class="col-md-4 p-2 ">
                        <div class="shadow p-2 rounded" style=" background-image: linear-gradient(to right,#EC4585, #B555A3);">  
                            <div>Tuần này</div>
                            <div class="d-flex justify-content-around">
                                <div class="card p-2 m-2">
                                    <div>Đơn đã đặt</div>
                                    <div>${requestScope.waittingCounnt}</div>
                                </div>
                                <div class="card p-2 m-2">
                                    <div>Đơn thành công</div>
                                   <div>${requestScope.finishCounnt}</div>
                                </div>
                                <div class="card p-2 m-2">
                                    <div>Đơn đã hủy</div>
                                  <div>${requestScope.terminateCounnt}</div>
                                </div>
                            </div>   
                        </div>
                    </div>
                    <div class="col-md-4 p-2">
                          <div class="shadow p-2 rounded" style=" background-image: linear-gradient(to right,#49C6F1, #668CD4);">  
                            <div>Tháng này</div>
                            <div class="d-flex justify-content-around">
                                <div class="card p-2 m-2">
                                    <div>Đơn đã đặt</div>
                                    <div>${requestScope.waittingMonth}</div>
                                </div>
                                <div class="card p-2 m-2">
                                    <div>Đơn thành công</div>
                                   <div>${requestScope.finishMonth}</div>
                                </div>
                                <div class="card p-2 m-2">
                                    <div>Đơn đã hủy</div>
                                    <div>${requestScope.terminateMonth}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 p-2">
                         <div class="shadow p-2 rounded" style=" background-image: linear-gradient(to right,#FEB82C, #EF7C57);">  
                            <div>Tổng đơn hàng</div>
                            <div class="d-flex justify-content-around">
                                <div class="card p-2 m-2">
                                    <div>Đơn đã đặt</div>
                                   <div>${requestScope.waittingAll}</div>
                                </div>
                                <div class="card p-2 m-2">
                                    <div>Đơn thành công</div>
                                   <div>${requestScope.finishAll}</div>
                                </div>
                                <div class="card p-2 m-2">
                                    <div>Đơn đã hủy</div>
                                <div>${requestScope.terminateAll}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="mt-2">
                        <h5 class="pt-3">Chọn khoản thống kê</h5>
                        <form action="/OrderReport" method="post" onsubmit="return validateDateRange();">
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
                             
                    <div class="row mt-2">
                        <div class="col-md-10" id="chart"></div>
                        <div class="col-md-2 d-flex justify-content-start card p-2 align-items-end">
                        <div>
                            <div>${(requestScope.UserStartDate != null) ? requestScope.UserStartDate : StartWeek} đến ${(requestScope.UserEndDate != null) ? requestScope.UserEndDate : EndWeel}</div>
                            <div>
                                <div class="card p-2 m-3">
                                    <div>Đơn đã đặt</div>
                                    <div>${requestScope.waittingChart}</div>
                                </div>
                                <div class="card p-2 m-3">
                                    <div>Đơn thành công</div>
                                   <div>${requestScope.finishChart}</div>
                                </div>
                                <div class="card p-2 m-3">
                                    <div>Đơn đã hủy</div>
                                     <div>${requestScope.terminateChart}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    
                    <div class="row mt-2 pt-3 d-flex justify-content-between">
                         <div class="col-md-2 d-flex justify-content-start card p-2 align-items-end">
                        <div>
                            <div>01-09-2023 đến 30-09-2023</div>
                            <div>
                                <div class="card p-2 m-3">
                                    <div>Đơn đã đặt</div>
                                    <div>99,999</div>
                                </div>
                                <div class="card p-2 m-3">
                                    <div>Đơn thành công</div>
                                    <div>99,999</div>
                                </div>
                                <div class="card p-2 m-3">
                                    <div>Đơn đã hủy</div>
                                    <div>99,999</div>
                                </div>
                            </div>
                        </div>
                             
                    </div>
                        
                         <div class="col-md-6  card p-2">
                            <canvas id="myChart" style="display: block; box-sizing: border-box;"></canvas>
                        </div>
                    </div>
                </div>
                <hr class="hr">

            </div>
        </main>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 p-4">
                        <img src="/image/logo.png" alt="" style="height: 40px;">
                        <div>
                            <i class="fa fa-map-marker mx-2"></i>Địa chỉ: 600 Nguyễn Văn Cừ nối dài, An Bình, Ninh Kiều, Cần Thơ 
                        </div>
                    </div>
                    <div class="col-md-4 p-4">
                        <div class="d-flex">
                            <i class="fa fa-envelope d-flex justify-content-center align-items-center mx-2"></i>
                            <div>
                                business@oceanbook.com
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 d-flex justify-content-between p-4">
                        <i class="fa-brands fa-facebook"></i>
                        <i class="fa-brands fa-facebook-messenger"></i>
                        <i class="fa-brands fa-youtube"></i>
                    </div>
                </div>
            </div>
        </footer>
 
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
                    height: 350,
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
const xValues = ["Đã hoàn thành", "Đang thực hiện", "Đã hủy"];
const yValues = [${requestScope.finishPie}, ${requestScope.waittingPie}, ${requestScope.terminatePie}];
const barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797"
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
      text: "Đơn hàng trong 3 tháng gần nhất"
    }
    
  }
});

  function validateDateRange() {
        var dateStart = document.getElementById('dateStart').value;
        var dateEnd = document.getElementById('dateEnd').value;

        if (dateStart >= dateEnd) {
            alert("Please select a valid date range. 'dateStart' must be less than 'dateEnd'.");
            return false;
        }

        return true;
    }

</script>
    </body>

</html>