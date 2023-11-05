<%-- 
    Document   : AccountList
    Created on : Oct 7, 2023, 10:50:52 PM
    Author     : DuyenLTM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh sách tài khoản</title>
        <jsp:include page="/Views/head.jsp"/>
        <style>
            /*vàng nh?t*/
            .waitting{
                background-color: #fdf5dd;
                color: #cfa00c;
                border-radius: 10px;
                padding: 5px;
            }
            /*xanh nh?t*/
            .finish{
                background-color: #cff6dd;
                color: #1fa750;
                border-radius: 10px;
                padding: 5px;
            }
            /*h?ng nh?t*/
            .terminate{
                background-color:#cafaf4;
                color: #EF4848;
                border-radius: 10px;
                padding: 5px;
            }
            .mamamia{
                background-color:#cad2fa;
                color: #EF4848;
                border-radius: 10px;
                padding: 5px;
            }
            .anime{
                background-color:#e2faca;
                color: #EF4848;
                border-radius: 10px;
                padding: 5px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light d-flex">
            <jsp:include page="/Views/aside.jsp"/>

            <div class="container">
                <div class="row pb-3">
                    <div class="col-md-3 pt-2 pb-2 ">
                        <div class=" card border text-light rounded" style=" background: #fa05c9;">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <li style="width: 75%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                        <i class="fa   text-light" style="font-size: 1.8em;"></i>
                                    </li>
                                </div>
                                <div class="text-end">
                                    <h2 ><strong id="countAll">0</strong></h2>
                                    <h6>Tất cả</h6>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 pt-2 pb-2 ">
                        <div class=" card border text-light rounded" style=" background: #48bbde;">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <li style="width: 75%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                        <i class="fa   text-light" style="font-size: 1.8em;"></i>
                                    </li>
                                </div>
                                <div class="text-end">
                                    <h2 ><strong id="countAvailable">0</strong></h2>
                                    <h6>Hoạt động</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 pt-2 pb-2 ">
                        <div class=" card border text-light" style=" background: #d44a43 ;">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                        <i class="far   text-light" style="font-size: 1.8em;"></i>
                                    </li>
                                </div>
                                <div class="text-end">
                                    <h2><strong id="countUnavailable">0</strong></h2>
                                    <h6>Đã xóa</h6>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-3 pt-2 pb-2 ">
                        <div class=" card border text-light" style=" background: #33B440 ;">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                        <i class="fas   text-light" style="font-size: 1.8em;"></i>
                                    </li>
                                </div>
                                <div class="text-end">
                                    <h2><strong id="countCustomer">0</strong></h2>
                                    <h6>Khách hàng</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 pt-2 pb-2 ">
                        <div class=" card border text-light" style=" background: #f3b61f ;">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                        <i class="far text-light" style="font-size: 1.8em;"></i>
                                    </li>
                                </div>
                                <div class="text-end">
                                    <h2><strong id="countBookManager">0</strong></h2>
                                    <h6>Quản lý Sách</h6>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 pt-2 pb-2 ">
                        <div class=" card border text-light" style=" background: #ab04cc ;">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                        <i class="far   text-light" style="font-size: 1.8em;"></i>
                                    </li>
                                </div>
                                <div class="text-end">
                                    <h2><strong id="countOrderManager">0</strong></h2>
                                    <h6>Quản lý Đơn</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <h1 class="text-center mt-3">Danh sách tài khoản</h1>
                <a href="/Account" class="btn btn-primary mb-3">Thêm Tài khoản mới</a>
                <div class="row justify-content-center mb-3">
                    <div class="col-md-12">
                        <table id="example" class="display mt-3">
                            <thead>
                            <th>ID</th>
                            <th>Tên đăng nhập</th>
                            <th>Họ và tên</th>
                            <th>Chức vụ</th>
                            <th>Trạng thái</th>
                            <th></th>
                            </thead>
                            <tbody class="align-middle">

                                <c:forEach var="account" items="${accountList}">
                                    <tr>
                                        <td>${account.id}</td>
                                        
                                        <td>${account.username}</td>
                                        
                                        <td>${account.fullName}</td>
                                        
                                        <td class="text-success">
                                            <span class="status">${account.roleName}</span>
                                        </td>
                                        
                                        <c:set var="TextColor" value="text-success"></c:set>
                                        <c:if test="${account.isAvailString == 'Đã xóa'}">
                                            <c:set var="TextColor" value="text-danger"></c:set>
                                        </c:if>
                                        <td class="${TextColor}">
                                            <span class="status">${account.isAvailString}</span>
                                        </td>

                                        <td> 
                                            <a style="text-decoration: none;" href="/Manager/Account/Detail?id=${account.id}&&isAvailString=${account.isAvailString}">Chi tiết</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <jsp:include page="/Views/foot.jsp"/>
        <script>
            $(document).ready(function () {
                $('#example').DataTable({
                    "language": {
                        "search": "Bộ lọc",
                        "paginate": {
                            "first": "Đầu",
                            "last": "Cuối",
                            "next": "Tiếp",
                            "previous": "Trước"
                        },
                        "info": "Hiển thị _START_ - _END_ trên _TOTAL_ kết quả",
                        "infoEmpty": "Hiển thị 0 - 0 trên 0 kết quả",
                        "lengthMenu": "Hiển thị _MENU_ kết quả",
                        "emptyTable": "Không có dữ liệu",
                        "zeroRecords": "Không tìm thấy"
                    }
                });
            });
        </script>
        <script>
            var AllValue = 0;
            var ActiveValue = 0;
            var NonActiveValue = 0;
            var CustomerValue = 0;
            var BookManagerValue = 0;
            var OrderManagerValue = 0;
            document.addEventListener("DOMContentLoaded", function () {
                var cancels = document.querySelectorAll(".status");
                cancels.forEach(function (subElement) {
                   
                    var statusText = subElement.textContent.trim();
                    console.log(statusText);
                    if (statusText === 'Đã xóa') {
                        NonActiveValue++;
                         AllValue++;
                        subElement.classList.add("terminate");
                    } else if (statusText === 'Hoạt động') {
                        ActiveValue++;
                        AllValue++;
                        subElement.classList.add("finish");
                    } else if (statusText === 'Quản lý Sách') {
                        BookManagerValue++;
                        subElement.classList.add("mamamia");
                    } else if (statusText === 'Quản lý Đơn') {
                        OrderManagerValue++;
                        subElement.classList.add("anime");
                    }else {
                        subElement.classList.add("waitting");
                        CustomerValue++;
                    }
                });
                document.getElementById("countAvailable").textContent = ActiveValue.toString();
                document.getElementById("countUnavailable").textContent = NonActiveValue.toString();
                document.getElementById("countCustomer").textContent = CustomerValue.toString();
                document.getElementById("countBookManager").textContent = BookManagerValue.toString();
                document.getElementById("countOrderManager").textContent = OrderManagerValue.toString();
                document.getElementById("countAll").textContent = AllValue.toString();
            });
        </script>
    </body>
</html>
