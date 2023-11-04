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
        <title>Blank Page</title>
        <jsp:include page="/Views/head.jsp"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light d-flex">
            <jsp:include page="/Views/aside.jsp"/>

            <div class="container">
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
                                        <td class="text-success">${account.roleName}</td>
                                        <c:set var="TextColor" value="text-success"></c:set>
                                        <c:if test="${account.isAvailString == 'Đã xóa'}">
                                            <c:set var="TextColor" value="text-danger"></c:set>
                                        </c:if>
                                        <td class="${TextColor}">${account.isAvailString}</td>

                                        <td> <a style="text-decoration: none;" href="/Manager/Account/Detail?id=${account.id}">Chi tiết</a></td>
                                    </tr>s
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
