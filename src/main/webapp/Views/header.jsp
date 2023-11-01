<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="d-flex justify-content-between" style="padding: 10px;">
    <div class="d-flex align-items-center justify-content-between">
        <img src="${pageContext.request.contextPath}/Images/logo.png" style="height: 40px;">
    </div>
    
    <% 
        // Test until the have session
        boolean isLogin = true;
        request.setAttribute("isLogin", isLogin);
    %>
    
    <c:if test = "${!isLogin}">
    <div>
        <a href="/Login" class="btn btn-success mx-2">Đăng nhập</a>
        <a href="/Register" class="btn btn-primary">Đăng ký</a>
    </div>
    </c:if>
    
    <c:if test="${isLogin}">
        <div>
            <a href="#" class="btn btn-success mx-2"><i class="fa fa-shopping-cart mx-2"></i></a>
        </div>
    </c:if>
</header>
