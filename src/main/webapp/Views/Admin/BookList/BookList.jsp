<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Blank Page</title>
        <jsp:include page="/Views/head.jsp"/>
        <style>
            .book-item {
                transition: transform 0.3s;
            }

            .book-item:hover {
                cursor: pointer;
                transform: scale(1.05);
            }
        </style>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="d-flex bg-light">
            <jsp:include page="/Views/aside.jsp"/>
            
            <div class="container">
                <div class="mb-3">
                    <div>
                        <div class="row mt-2 justify-content-center">
                            <div class="d-flex card p-2 align-items-center">
                                <div>
                                    <div class="text-center text-info" style="font-size: 20px">Tổng kết</div>
                                    <div class="d-flex justify-content-center">
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
                                        
                <div class="bg-white shadow rounded mt-4 p-4">
                    <h5>Top những cuốn sách bán chạy</h5>
                    <form action="/Manager/Book/List" method="post">
                        <div class="d-flex">
                            <div class="d-flex align-items-center m-2">
                                <label class="text-nowrap m-2">Từ ngày</label>
                                <input type="date" id ="startdate" class="form-control" name="startdate" value="${(requestScope.UserStartDate != null) ? requestScope.UserStartDate : StartDate}">
                            </div>
                            <div class="d-flex align-items-center m-2">
                                <div class="text-nowrap m-2">đến ngày</div>
                                <input type="date" id ="enddate" class="form-control" name="enddate" value="${(requestScope.UserEndDate != null) ? requestScope.UserEndDate : EndDate}">
                            </div>
                            <input type="submit" class="btn btn-primary m-2 btnFilter" name="selectDate" value="Xác nhận">
                        </div>
                    </form>
                                
                    <div class="row">
                                                
                        <c:forEach var="book" items="${BookDetail}" >
                            <div onclick="goToBookDetail(${book.id});" class="book-item col-lg-3 col-md-4 col-sm-6 p-4">
                                <div class="card border-0 shadow">
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <div class="d-flex justify-content-center">
                                            <img style="width: 160px; height: 200px; object-fix: contain;" src="/Images/${book.thumbnail}" class="card-img-top"/>
                                        </div>

                                        <div class="mt-2 text-center">
                                            <h4 style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                                ${book.title}
                                            </h4>
                                        </div>

                                        <div class="text-center">
                                            <div>
                                                <span style="font-weight: bold; font-size: 1.2em;" class="format-number text-success me-2" data-value="${book.salePrice}"></span>
                                                <span class="text-danger">${book.discount}% giảm</span>
                                            </div>

                                            <div>
                                                <span class="format-number text-decoration-line-through text-muted" data-value="${book.price}"></span>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <p>
                                                <strong class="mx-2">${book.avgRating}</strong>
                                                <span>
                                                    <i class="fa fa-star ${book.avgRating >= 1 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                    <i class="fa fa-star ${book.avgRating >= 2 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                    <i class="fa fa-star ${book.avgRating >= 3 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                    <i class="fa fa-star ${book.avgRating >= 4 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                    <i class="fa fa-star ${book.avgRating == 5 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                </span>
                                            </p>
                                            <p class="mx-2 text-black-50">(${book.totalRating})</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>            
                </div>
                
                <h1 class="text-center mt-3">Danh sách Sách</h1>
                <a href="/Manager/Book/Create" class="btn btn-primary mb-3">Thêm Sách mới</a>
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
                                        <td><a style="text-decoration: none;" href="/Manager/Book/Update?ID=${book.id}">Chỉnh sửa</a></td>
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
            // Format the number from 1000 to 1.000 form (for VND)
            const formatNumberElements = document.getElementsByClassName('format-number');

            for (let i = 0; i < formatNumberElements.length; i++) {
                let element = formatNumberElements[i];
                let value = element.getAttribute('data-value');
                let formattedValue = Number(value).toLocaleString();
                element.textContent = formattedValue + ' VNÐ';
            }

            $(document).ready(function () {
                $('#rating-slider').carousel();
            });
            
            function goToBookDetail(bookId) {
                window.location.href = "/Book/Detail?ID=" + bookId;
            }
        </script>
    </body>
</html>
