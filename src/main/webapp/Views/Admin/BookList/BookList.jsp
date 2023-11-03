<%-- 
    Document   : BookList
    Created on : Nov 2, 2023, 11:04:58 AM
    Author     : ASP_REF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Blank Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            .mockup-image {
                text-align: center;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                border: 1px solid #000;
                background-color: #bbbbbb;
                text-decoration: none;
                color: #000;
            }</style>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="d-flex bg-light">
            <!-- Sidebar -->
       
            <aside>
                <div class="flex-shrink-0 p-3" style="width: 280px;">
                    <a href="#"
                       class="text-dark d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                        Bộ phận Quản lý Sách
                    </a>
                    <ul class="list-unstyled ps-0">

                        <li class="mb-1 bg-primary rounded">
                            <a href="#" class="text-light nav-link">Danh sách Sách</a>
                        </li>
                        <li class="mb-1">
                            <a href="#" class="text-dark nav-link">Danh mục Sách</a>
                        </li>
                    </ul>
                </div>
            </aside>
            <div class="container">
                <h1 class="text-center mt-3">Danh sách Sách</h1>
                <button class="btn btn-primary mb-3">Thêm Sách mới</button>
                <div class="row justify-content-center mb-3">
                    <div class="col-md-12">
                        <table id="example" class="display text-center mt-3">
                            <thead>
                            <th>ID</th>
                            <th>Tên sách</th>
                            <th>Đơn giá</th>
                            <th>Số lượng còn</th>
                            <th>Trạng thái</th>
                            <th></th>
                            </thead>
                            <tbody class="">

                                <c:forEach var="book" items="${booklistadmin}">
                                    <tr>
                                        <td>${book.id}</td>

                                        <td>
                                            <div class="insach d-flex p-2">

                                                <img src="${pageContext.request.contextPath}/Images${book.thumbnail}" style="width: 100px; height: 100px; object-fit: contain;"></img>
                                                <div class="text-start fs-5 mx-2 d-flex align-items-start">
                                                    ${book.title}
                                                </div>

                                            </div>
                                        </td>

                                        <td>${book.price}</td>

                                        <td>${book.quantity}</td>

                                        <c:if test="${book.isAvailable == 'Ngừng bán'}">
                                            <c:set var="TextColor" value="text-danger"></c:set>
                                        </c:if>
                                        <c:set var="TextColor" value="text-success"></c:set>
                                        <td class="${TextColor}">${book.isAvailable}</td>
                                        <td> <a style="text-decoration: none;" href="/Book?id=${book.id}">Chi tiết</a></td>


                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>

          <jsp:include page="/Views/footer.jsp"/>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
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


    </body>

</html>
