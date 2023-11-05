<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="d-flex justify-content-between" style="padding: 10px;">
    <style>
        .dropdown-toggle {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-right: 0;
            position: relative;
        }

        .dropdown-toggle::after {
            margin-left: 10px;
            margin-right: 10px; 
        }
        
        .toggle-label:hover {
            background-color: #f8f9fa;
        }
        
        li > a {
            text-decoration: none;
            color: #000;
        }
        
        li > a:hover {
            text-decoration: underline;
        }
        
        #publisherSelect li,
        #authorSelect li,
        #genreSelect li,
        #languageSelect li {
            padding: 10px !important;
        }
    </style>
    
    <div class="d-flex justify-content-between" style="width: 30%">
        <a href="/Home" class="d-flex align-items-center justify-content-between">
            <img src="/Images/logo.png" style="height: 40px;">
        </a>
        <c:if test="${(role == null) or (role == 1)}">
        <div class="d-flex align-items-center nav-item dropdown-center mx-3">
<!--            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-auto-close="outside" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa-solid fa-list fa-xl"></i>
            </a>-->
            <button type="button" class="w-100 btn border-0 dropdown-toggle" data-bs-auto-close="outside" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa-solid fa-list fa-xl"></i>
            </button>
            
            <ul class="dropdown-menu p-3 mt-4" style="width: 400px;">
                <h5>Danh mục Sách</h5>
            
                <hr>
                
                <li class="dropend mb-2">
                    <button type="button" class="w-100 btn border-0 dropdown-toggle toggle-label" data-bs-toggle="dropdown" aria-expanded="false">
                        Nhà xuất bản
                    </button>
                    
                    <ul style="width: 300px; max-height: 300px; overflow-y: auto;" class="dropdown-menu p-3 mx-4" id="publisherSelect">
                    </ul>
                </li>
                
                <li class="dropend d-flex justify-content-between align-items-center mb-2">
                    <button type="button" class="w-100 btn border-0 dropdown-toggle toggle-label" data-bs-toggle="dropdown" aria-expanded="false">
                        Tác giả
                    </button>
                    
                    <ul style="width: 300px; max-height: 300px; overflow-y: auto;" class="dropdown-menu p-3 mx-4" id="authorSelect">
                    </ul>
                </li>
                
                <li class="dropend d-flex justify-content-between align-items-center mb-2">
                    <button type="button" class="w-100 btn border-0 dropdown-toggle toggle-label" data-bs-toggle="dropdown" aria-expanded="false">
                        Thể loại
                    </button>
                    
                    <ul style="width: 300px; max-height: 300px; overflow-y: auto;" class="dropdown-menu p-3 mx-4" id="genreSelect">
                    </ul>
                </li>
                
                <li class="dropend d-flex justify-content-between align-items-center">
                    <button type="button" class="w-100 btn border-0 dropdown-toggle toggle-label" data-bs-toggle="dropdown" aria-expanded="false">
                        Ngôn ngữ
                    </button>
                    
                    <ul style="width: 300px; max-height: 300px; overflow-y: auto;" class="dropdown-menu p-3 mx-4" id="languageSelect">
                    </ul>
                </li>
                
                <hr>
                
                <li>
                    <a class="btn border-0 text-primary" href="#">Xem tất cả</a>
                </li>
            </ul>
        </div>
        </c:if>
    </div>
        
    <c:if test="${(role == null) or (role == 1)}">
    <div class="" style="width: 40%;">
        <form action="/Book" method="get">
            <div class="input-group d-flex align-items-center">
                <input 
                    class="form-control" id="search-input" 
                    type="search" name="searchKey" 
                    placeholder="Tìm kiếm theo tên sách, tác giả, thể loại,..." 
                    value="${searchKey}" 
                    style="height: 40px;"/>
                <button id="search-button" type="button" class="btn btn-primary" style="height: 40px;">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </form>
    </div>
    </c:if>
    
    <c:if test="${accountId == null}">
        <div class="d-flex justify-content-end" style="width: 30%">
            <a href="/Login" class="btn btn-success mx-2">Đăng nhập</a>
            <a href="/Register" class="btn btn-primary">Đăng ký</a>
        </div>
    </c:if>

    <c:if test="${accountId != null}">
        <c:if test="${role == 1}">
        <div class="d-flex justify-content-end" style="width: 30%;">
            <a href="/Cart" class="btn border-0 mx-2"><i class="fa fa-shopping-cart fa-xl mx-2"></i></a>
        </div>
        </c:if>
        
        <div class="btn-group">
            <button type="button" class="btn border-0 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                Xin chào, ${username}
            </button>
            <ul class="dropdown-menu dropdown-menu-end">
                <c:if test="${role == 1}">
                <li><a class="mb-2 dropdown-item" href="#">Đơn hàng</a></li>
                </c:if>
                <li><a class="dropdown-item" href="/Profile">Thông tin cá nhân</a></li>
                <hr>
                <li><a onclick="return confirm('Bạn có chắc muốn đăng xuất?');" class="dropdown-item" href="/Logout">Đăng xuất</a></li>
            </ul>
        </div>
    </c:if>
       
    <script>
        //get book attributes from BookSearch servlet                                                                                                                                                                                                    // @author DuyenLTM                                                                                                   
        $(document).ready(function () {
            getOptions("author");
            getOptions("genre");
            getOptions("language");
            getOptions("publisher");
        });

        function getOptions(optionType) {
            $.ajax({
                url: "/Book",
                type: "post",
                data: {optionType: optionType},
                success: function (data) {
                    $("#" + optionType + "Select").append(data);
                }
            });
        }                                                                                                                                                                                                                                                // @author DuyenLTM
        
        function clickToggle(element) {
            console.log("a");
            $(element).next("ul").toggle();
        }
    </script>
</header>