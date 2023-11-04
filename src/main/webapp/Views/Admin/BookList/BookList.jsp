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
        <jsp:include page="/Views/head.jsp"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="d-flex bg-light">
            <jsp:include page="/Views/aside.jsp"/>
            
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
    </body>
</html>
