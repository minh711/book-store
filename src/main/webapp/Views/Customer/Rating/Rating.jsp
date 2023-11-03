<%-- 
    Document   : Rating
    Created on : Oct 31, 2023, 7:54:20 PM
    Author     : mummykiara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>

            .center{
                position: absolute;
                top: 45%;
                left: 40%;
                transform: translate(-50%, -50%);
            }
            .center .rating-star{
                height: 30px;
                width: 500px;
                text-align: center;
            }
            .rating-star input{
                display: none;
            }
            .rating-star label{
                float: right;
                font-size: 50px;
                color: lightgrey;
                margin: 0 5px;
                text-shadow: 1px 1px #bbb;
            }
            .rating-star label:before{
                content: '★';
            }
            .rating-star input:checked ~ label{
                color: gold;
                text-shadow: 1px 1px #c60;
            }
            .rating-star:not(:checked) > label:hover,
            .rating-star:not(:checked) > label:hover ~ label{
                color: gold;
            }
            .rating-star input:checked > label:hover,
            .rating-star input:checked > label:hover ~ label{
                color: gold;
                text-shadow: 1px 1px goldenrod;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/Views/header.jsp"/>
<div class="container">
        <h1 class="text-center text-success p-4">Đánh giá sản phẩm</h1> 

        
        <div class="d-flex justify-content-around align-items-center border border-2 border-dark-subtle" style="border-radius: 50px">
                    <img src="${pageContext.request.contextPath}/Images/${BookDetail.thumbnail}" class="rounded" alt="..." style="width: 100px; height: 100px; object-fit: contain;">
                    <div class="fs-5 mx-2">
                        ${BookDetail.title}
                    </div>
                </div>

            <form action="/Rating" method="post">
                <div>
                    
                    <div class="center">
                        <label class="text-dark">Độ hài lòng</label>
                        <div class="rating-star" id="rating">
                            <input type="radio" id="five" name="star" value="5">
                            <label for="five"></label>
                            <input type="radio" id="four" name="star" value="4">
                            <label for="four"></label>
                            <input type="radio" id="three" name="star" value="3">
                            <label for="three"></label>
                            <input type="radio" id="two" name="star" value="2">
                            <label for="two"></label>
                            <input type="radio" id="one" name="star" value="1">
                            <label for="one"></label>
                        </div>
                    </div>
                    
                    <input type="hidden" name="UserId" value="${requestScope.User}">
                    <input type="hidden" name="BookId" value="${BookDetail.getId()}">

                    <div class="container" style="margin-top:10%">
                        <textarea class="form-control" id ="txtComment" style="resize: none;top: 60%" rows="5" placeholder="Viết nhận xét vào đây..." name="Comment"></textarea>
                    </div>
                </div>

                <div class="d-flex justify-content-end">
                    <button type="submit" id="btnSubmit" class="btn btn-dark mt-3">Gửi</button>
                </div>
            </form>

        </div>

        <script>
            document.getElementById("btnSubmit").addEventListener("click", function (event) {
                var ratingStar = document.querySelectorAll("#rating input[type='radio']");
                var isChecked = false;

                for (var i = 0; i < ratingStar.length; i++) {
                    if (ratingStar[i].checked) {
                        isChecked = true;
                        break;
                    }
                }

                if (!isChecked) {
                    alert("Vui lòng chọn một đánh giá trước khi gửi!");
                    event.preventDefault();
                }
            });
        </script>



        <jsp:include page="/Views/footer.jsp"/>
    </body>
</html>
