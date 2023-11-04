<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="bg-white">
    <style>
        a:hover {
            cursor: pointer;
        }
    </style>
    <div class="flex-shrink-0 p-3" style="width: 280px;">
        <h3>
            Admin
        </h3>
        <hr>
        <ul class="list-unstyled">
            <li class="mb-1">
                <a class="fs-5 link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#report-collapse" aria-expanded="true">
                    Thống kê
                </a>
            </li>
            
            <hr>
            
            <li class="mb-1">
                <a class="fs-5 link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#book-collapse" aria-expanded="true">
                    Quản lý Sách
                </a>
                <div class="mt-3 mx-3 collapse hide" id="book-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/Manager/Book/list" class="link-dark d-inline-flex text-decoration-none rounded">Danh sách Sách</a></li>
                        <li><a href="/Manager/Book/Attribute" class="mt-2 link-dark d-inline-flex text-decoration-none rounded">Danh mục Sách</a></li>
                    </ul>
                </div>
            </li>
            
            <hr>
            
            <li class="mb-1">
                <a class="fs-5 link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#order-collapse" aria-expanded="true">
                    Quản lý Đơn
                </a>
                <div class="mt-3 mx-3 collapse hide" id="order-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/Manager/Order/List" class="link-dark d-inline-flex text-decoration-none rounded">Danh sách Đơn hàng</a></li>
                    </ul>
                </div>
            </li>
            
            <hr>
            
            <li class="mb-1">
                <a class="fs-5 link-dark text-decoration-none d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="true">
                    Quản lý Tài khoản
                </a>
                <div class="mt-3 mx-3 collapse hide" id="account-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/Manager/Account/List" class="link-dark d-inline-flex text-decoration-none rounded">Danh sách Tài khoản</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</aside>