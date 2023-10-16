<%-- 
    Document   : aside
    Created on : Oct 17, 2023, 4:40:59 AM
    Author     : Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside>
    <div class="flex-shrink-0 p-3" style="width: 280px;">
        <h5>
            Admin
        </h5>
        <hr>
        <ul class="list-unstyled ps-0">
            <li class="mb-1">
                <a href="/Views/Admin/AddBookPicture/add-book-picture.jsp" class="text-dark nav-link">
                    Thêm ảnh
                </a>
            </li>
            <li class="mb-1">
                <a href="/Views/Admin/BookTransaction/book-transaction.jsp" class="text-dark nav-link">
                    Nhập hàng
                </a>
            </li>
            <li class="mb-1">
                <a href="/AccountList" class="text-dark nav-link">
                    Danh sách tài khoản
                </a>
            </li>
            <li class="mb-1">
                <a href="/AccountUpdate" class="text-dark nav-link">
                    Update tài khoản
                </a>
            </li>
            <li class="mb-1">
                <a href="/CreateOrder" class="text-dark nav-link">
                    Tạo đơn hàng mới
                </a>
            </li>
        </ul>
    </div>
</aside>