<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="bg-white">
    <style>
        a:hover {
            cursor: pointer;
            text-decoration: underline !important;
        }
        
        li a {
            width: 100%;
            padding: 10px;
        }
    </style>
    <div class="flex-shrink-0 p-3" style="width: 320px;">
        <h3>
            ${role == 4 ? 'Admin' : ''}
            ${role == 3 ? 'Quản lý Đơn' : ''}
            ${role == 2 ? 'Quản lý Sách' : ''}
        </h3>
        <hr>
        <ul class="list-unstyled">
            <c:if test="${role == 4}">
            <li class="mb-4">
                <a href="/Manager/Report" class="fs-5 link-dark shadow text-decoration-none d-inline-flex align-items-center rounded border-0">
                    Thống kê
                </a>
            </li>
            </c:if>
                
            <c:if test="${role == 4 or role == 2}">
            <li class="mb-4">
                <a class="fs-5 shadow link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#book-collapse" aria-expanded="true">
                    Quản lý Sách
                </a>
                <div class="mt-3 mx-3 hide" id="book-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/Manager/Book/List" class="fs-5 link-dark d-inline-flex text-decoration-none rounded">Danh sách Sách</a></li>
                        <li><a href="/Manager/Book/Attribute" class="fs-5 mt-2 link-dark d-inline-flex text-decoration-none rounded">Danh mục Sách</a></li>
                        <li><a href="/Manager/Book/Transaction" class="fs-5 mt-2 link-dark d-inline-flex text-decoration-none rounded">Nhập Sách</a></li>
                    </ul>
                </div>
            </li>
            </c:if>
                
            <c:if test="${role == 4 or role == 3}">    
            <li class="mb-4">
                <a class="fs-5 shadow link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#order-collapse" aria-expanded="true">
                    Quản lý Đơn
                </a>
                <div class="mt-3 mx-3 hide" id="order-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/Manager/Order/List" class="fs-5 link-dark d-inline-flex text-decoration-none rounded">Danh sách Đơn hàng</a></li>
                    </ul>
                </div>
            </li>
            </c:if>
                
            <c:if test="${role == 4}">
            <li>
                <a class="fs-5 shadow link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="true">
                    Quản lý Tài khoản
                </a>
                <div class="mt-3 mx-3 hide" id="account-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/Manager/Account/List" class="fs-5 link-dark d-inline-flex text-decoration-none rounded">Danh sách Tài khoản</a></li>
                    </ul>
                </div>
            </li>
            </c:if>
        </ul>
    </div>
</aside>