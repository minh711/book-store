<%-- 
    Document   : BookDetail
    Created on : Oct 6, 2023, 6:03:06 PM
    Author     : mummykiara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Locale" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="Models.MgrModels.BookAuthorDetail"%>
<%@page import="Models.MgrModels.BookGenreDetail"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%  NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.getDefault());%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ocean Book</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/Assets/popper.min.js"></script>
        <link rel="stylesheet" href="/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            .authorborder {
                display: flex;
                border: 2px groove;
                border-radius: 20px;
                margin: 5px 0px;
                align-items: center;
                justify-content: space-between;
            }

            .authorborder button {
                width: 30px;
                height: 30px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>

    <body>
        <header class="d-flex justify-content-between" style="padding: 10px;">
            <div class="d-flex align-items-center justify-content-between">
                <img src="${pageContext.request.contextPath}/Images/logo.jpg" style="height: 40px;">
            </div>
            <div class="dropdown">
                <a class="text-dark nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    Xin chào,<br>Nguyễn Văn A
                </a>
                <ul class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item p-2" href="#">Thông tin tài khoản</a></li>
                    <li><a class="dropdown-item p-2" href="#">Đăng xuất <i class="fa fa-sign-out"></i></a></li>
                </ul>
            </div>
        </header>

        <div class="container" style="display: flex;justify-content: center;align-items: center;margin-top: 10px;">
            <div class="input-group mb-2 d-flex align-items-center" style="width: 60%;">
                <input id="search-input" type="search" id="form1" class="form-control" placeholder="Search..." />
                <button id="search-button" type="button" class="btn btn-primary">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>

        <main class="bg-light d-flex">
            <!-- Sidebar -->
            <aside>
                <div class="flex-shrink-0 p-3" style="width: 280px;">
                    <a href="#"
                       class="text-dark d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                        Manager
                    </a>
                    <ul class="list-unstyled ps-0 navbar-nav">
                        <li class="mb-1">
                            <a href="#" class="text-dark nav-link">Create Book</a>
                        </li>
                        <li class="mb-1">
                            <a href="#" class="text-dark nav-link">Update Book</a>
                        </li>
                        <li class="mb-1">
                            <a href="#" class="text-dark nav-link">Book’s Attribute</a>
                        </li>

                    </ul>
                </div>
            </aside>

            <div class="container">
                <main class="d-flex bg-light">
                    <div class="container">
                        <div class="row mt-4">
                            <div class="col-sm-6">
                                <div class="rounded bg-white p-4 mb-3">
                                    <div class="d-flex">
                                        <div>
                                            <div style="width: 100px; height: 100px;" class="d-flex align-items-center justify-content-center">
                                                <img style="object-fit: contain; height: 80px; width: 80px;"
                                                     src="https://cdn0.fahasa.com/media/flashmagazine/images/page_images/cay_cam_ngot_cua_toi/2020_12_17_16_50_30_1-390x510.jpg?_gl=1*1j95bdn*_ga*MTk5ODM4NjM0OS4xNjkyODUzNDQ4*_ga_460L9JMC2G*MTY5NDc4ODc4Ny4xMC4xLjE2OTQ3ODkyMTAuMjUuMC4w"
                                                     class="img-thumbnail img-fluid rounded" alt="Hollywood Sign on The Hill" />
                                            </div>
                                        </div>
                                        <div>
                                            <img style="object-fit: contain; height: 500px; width: 500px;"
                                                 src="https://cdn0.fahasa.com/media/flashmagazine/images/page_images/cay_cam_ngot_cua_toi/2020_12_17_16_50_30_1-390x510.jpg?_gl=1*1j95bdn*_ga*MTk5ODM4NjM0OS4xNjkyODUzNDQ4*_ga_460L9JMC2G*MTY5NDc4ODc4Ny4xMC4xLjE2OTQ3ODkyMTAuMjUuMC4w"
                                                 class="img-thumbnail img-fluid rounded" alt="Hollywood Sign on The Hill" />
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-3 justify-content-center">
                                    <div class="mx-2">
                                        <button class="btn btn-outline-secondary">
                                            <i class="fa fa-shopping-cart text-dark mx-2" aria-hidden="true""></i>
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                    <div class="mx-2">
                                        <button class="btn btn-danger" style="width: 200px">Mua ngay</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div>
                                    <div>
                                        <h2><%= request.getAttribute("BookTittle")%></h2>
                                        <div class="mt-3">
                                            <div class="d-flex">
                                                <!-- Element on the left -->
                                                <div class="px-4">
                                                    <p>Tên sách</p>
                                                    <p>Tác giả</p>
                                                    <p>Nhà xuất bản</p>
                                                    <p>Thể loại</p>
                                                    <p>Ngôn ngữ</p>
                                                </div>
                                                <!-- Vertical divider -->
                                                <div class="vr vr-blurry" style=""></div>
                                                <!-- Element on the left -->
                                                <div class="px-4">
                                                    <p><%= request.getAttribute("BookName")%></p>
                                                    <p>
                                                     <c:forEach items="${requestScope.BookAuthor}" var="author" varStatus="loop">
                                                         <span>${author.getAuthor()}${!loop.last?', ':' '} </span>
                                                     </c:forEach>
                                                    </p>
                                                    <p><%= request.getAttribute("BookPublisher")%></p>
                                                    <p>
                                                     <c:forEach items="${requestScope.BookGenre}" var="genre" varStatus="loop">
                                                         <span>${genre.getGenre()}${!loop.last?', ':' '} </span>
                                                     </c:forEach>
                                                    </p>
                                                    <p><%= request.getAttribute("BookLanguage")%></p>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                    <div>
                                        <div>
                                            <div class="d-flex">
                                                <% String saleprice = numberFormat.format(request.getAttribute("BookSalePrice")); %>
                                                <% String price = numberFormat.format(request.getAttribute("BookPrice"));%>

                                                <h3 class="text-danger"><strong><%= saleprice%></strong></h3>

                                                <div class="ts-lg mx-2 d-flex align-items-center">-<%= request.getAttribute("BookDiscount")%>%</div>
                                            </div>
                                            <div class="ts-lg text-decoration-line-through"><%= price%>đ</div>
                                            <div class="d-flex">
                                                <p>
                                                    <strong class="mx-2">4.5</strong>
                                                    <span>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star-half-o text-warning" aria-hidden="true"></i>
                                                    </span>
                                                </p>
                                                <p class="mx-2 text-black-50">(10 đánh giá)</p>
                                            </div>
                                            <div class="text-danger mb-3">Số lượng còn lại:<%= request.getAttribute("BookQuantity")%></div>
                                            <div class="d-flex">
                                                <div class="text-nowrap mx-2 d-flex align-items-center">Số lượng</div>
                                                <div class="input-group d-flex justify-content-start align-items-center">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-primary btn-minus" >
                                                            <i class="fa fa-minus"></i>
                                                        </button>
                                                    </div>
                                                    <div> 
                                                        <input type="text" class="form-control mx-3 text-center" style="width: 50px;" value="2"></div>
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-primary btn-plus">
                                                            <i class="fa fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <hr>
                            <h2>MÔ TẢ SẢN PHẨM</h2>
                            <p style="text-align: justify;">
                                <%= request.getAttribute("BookDescription")%>
                            </p><br>
                        </div>
                        <hr>
                        <div class="mt-4 p-4 text-dark rounded">
                            <h2>ĐÁNH GIÁ CỦA KHÁCH HÀNG</h2>
                            <div class="d-flex">
                                <p>
                                    <strong class="mx-2">4.5</strong>
                                    <span>
                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                        <i class="fa fa-star-half-o text-warning" aria-hidden="true"></i>
                                    </span>
                                </p>
                                <p class="mx-2 text-black-50">(10 đánh giá)</p>
                            </div>
                            <div class="d-flex">
                                <div class="mx-2 border bg-warning text-light rounded-pill p-2">Tất cả đánh giá (10)</div>
                                <div class="mx-2 border rounded-pill p-2">
                                    5 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                                <div class="mx-2 border rounded-pill p-2">
                                    4 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                                <div class="mx-2 border rounded-pill p-2">
                                    3 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                                <div class="mx-2 border rounded-pill p-2">
                                    2 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                                <div class="mx-2 border rounded-pill p-2">
                                    1 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                            </div>
                        </div>
                        <div class="mt-4 p-4 bg-white text-dark rounded">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex">
                                    <div class="mx-2">Nguyễn Văn A</div>
                                </div>
                                <div class="text-black-50">15/09/2023, 11:11</div>
                            </div>
                            <div class="mt-2">
                                <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                <i class="fa fa-star text-secondary" aria-hidden="true"></i>
                                <i class="fa fa-star text-secondary" aria-hidden="true"></i>
                                <i class="fa fa-star text-secondary" aria-hidden="true"></i>
                                <i class="fa fa-star text-secondary" aria-hidden="true"></i>
                                <div class="mt-2 text-dark">Giao hàng nhanh</div>
                            </div>
                        </div>
                        <div class="mt-4 mb-4 p-4 bg-white text-dark rounded">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex">
                                    <div class="mx-2">Nguyễn Văn B</div>
                                </div>
                                <div class="text-black-50">15/09/2023, 11:11</div>
                            </div>
                            <div class="mt-2">
                                <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                <i class="fa fa-star text-warning" aria-hidden="true"></i><br>
                                <div class="mt-2 text-dark">tốt</div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </main>



        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 p-4">
                        <img src="${pageContext.request.contextPath}/Images/logo.jpg" alt="" style="height: 40px;">
                        <div>
                            <i class="fa fa-map-marker mx-2"></i>Địa chỉ: 600 Nguyễn Văn Cừ nối dài, An Bình, Ninh Kiều, Cần Thơ 
                        </div>
                    </div>
                    <div class="col-md-4 p-4">
                        <div class="d-flex">
                            <i class="fa fa-envelope d-flex justify-content-center align-items-center mx-2"></i>
                            <div>
                                business@oceanbook.com
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 d-flex justify-content-between p-4">
                        <i class="fa-brands fa-facebook"></i>
                        <i class="fa-brands fa-facebook-messenger"></i>
                        <i class="fa-brands fa-youtube"></i>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
