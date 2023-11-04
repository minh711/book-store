<%-- 
    Document   : BookList
    Created on : Nov 3, 2023, 12:15:31 AM
    Author     : mummykiara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Book Analysis</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/orderDetailCustomer/style.css">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

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

                <div class="row justify-content-center mb-3">
                    <div class="col-md-12">
                        <div class="row mt-2">
                            <div class="col-md-10"><canvas id="myChart" style="width:100%;max-width:800px"></canvas></div>
                            <div class="col-md-2 d-flex justify-content-start card p-2 align-items-end">
                                <div>
                                    <div class="text-center text-info" style="font-size: 20px">Tổng kết</div>
                                    <div>
                                        <div class="card p-2 m-3">
                                            <div class="text-success">Còn hàng</div>
                                            <div class="text-center">${requestScope.dataBookAvailable}</div>
                                        </div>
                                        <div class="card p-2 m-3">
                                            <div class="text-warning">Hết hàng</div>
                                            <div class="text-center">${requestScope.dataBookNotAvailable}</div>
                                        </div>
                                        <div class="card p-2 m-3">
                                            <div class="text-danger">Ngưng bán</div>
                                            <div class="text-center"> ${requestScope.dataBookOutStock}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-2 d-flex justify-content-center">
                    <div class="col-md-4 ">
                        <h5>Top những cuốn sách bán chạy</h5>
                        <form action="/Book/Analysis" method="post">
                            <div class="d-block">
                                <div class="d-flex align-items-center m-2">
                                    <label class="text-nowrap m-2">Từ ngày</label>
                                    <input type="date" id ="startdate" class="form-control" name="startdate" value="${(requestScope.UserStartDate != null) ? requestScope.UserStartDate : StartDate}">
                                </div>
                                <div class="d-flex align-items-center m-2">
                                    <div class="text-nowrap m-2">đến ngày</div>
                                    <input type="date" id ="enddate" class="form-control" name="enddate" value="${(requestScope.UserEndDate != null) ? requestScope.UserEndDate : EndDate}">
                                </div>
                                <button type="submit" class="btn btn-primary m-2 btnFilter">Xác nhận</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-8">

                        <div style="height: 280px; overflow-y: auto; background-color: white">
                            <table class="table p-2 table-responsive-sm table-hover">
                                <thead class="p-2">
                                    <tr data-link="">
                                        <th scope="col">ID</th>
                                        <th scope="col">Tên sách</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.BookDetail}" var="detail" varStatus="loopStatus">
                                        <tr style="cursor: pointer">
                                            <th scope="row">${loopStatus.index + 1}</th>
                                            <td>${detail.getTitle()}</td>
                                        </tr>
                                    </c:forEach>  
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            

        </main>

        <jsp:include page="/Views/footer.jsp"/>


        <script>

            $(document).ready(function () {
                var xValues = ["Còn hàng", "Ngưng bán", "Hết hàng"];
                var yValues = [${requestScope.dataBookAvailable}, ${requestScope.dataBookNotAvailable}, ${requestScope.dataBookOutStock}];
                var barColors = [
                    "#b91d47",
                    "#00aba9",
                    "#2b5797"
                ];

                new Chart("myChart", {
                    type: "pie",
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
                            text: "Thống kê số liệu sách của cửa hàng",
                            fontSize: 25,
                            fontColor: "#4242f5"
                        }
                    }
                });

                $(".btnFilter").on("click", function () {
                    var startDate = new Date($("#startdate").val());
                    var endDate = new Date($("#enddate").val());

                    if (startDate > endDate) {
                        alert("Ngày bắt đầu không thể sau ngày kết thúc!");
                        event.preventDefault();
                    } else {

                    }
                });
            });
        </script>
    </body>

</html>