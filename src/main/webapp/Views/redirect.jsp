<%-- 
    Document   : redirect
    Created on : Jul 8, 2023, 1:51:08 AM
    Author     : ASP_REF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>THÀNH CÔNG</h1>
        <h4> Hello: ${sessionScope.account.fullname} </h4>
        <a href="logout">Log out</a><br><br>
        <a href="Login.jsp">back</a>
    </body>
</html>
