<%-- 
    Document   : aside
    Created on : Oct 17, 2023, 4:40:59 AM
    Author     : Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="bg-white">
    <style>
        a:hover {
            cursor: pointer;
        }
    </style>
    <div class="flex-shrink-0 p-3" style="width: 280px;">
        <h5>
            Admin
        </h5>
        <hr>
        <ul class="list-unstyled">
            <li class="mb-1">
                <a class="link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#report-collapse" aria-expanded="true">
                    Thống kê
                </a>
            </li>
            
            <li class="mb-1">
                <a class="link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#book-collapse" aria-expanded="true">
                    Quản lý Sách
                </a>
                <div class="collapse hide" id="book-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Danh sách Sách</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Danh mục Sách</a></li>
                    </ul>
                </div>
            </li>
            
            <li class="mb-1">
                <a class="link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#order-collapse" aria-expanded="true">
                    Quản lý Đơn
                </a>
                <div class="collapse hide" id="order-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/Order/List" class="link-dark d-inline-flex text-decoration-none rounded">Danh sách Đơn hàng</a></li>
                    </ul>
                </div>
            </li>
            
            <li class="mb-1">
                <a class="link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="true">
                    Quản lý Tài khoản
                </a>
                <div class="collapse hide" id="account-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/Account/List" class="link-dark d-inline-flex text-decoration-none rounded">Danh sách Tài khoản</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</aside>