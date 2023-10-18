<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <title>Sample</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/Admin/BookTransaction/style.css"/>
</head>

<body>
    <jsp:include page="/Views/header.jsp"/>

    <main class="bg-light d-flex">
    </main>
    
    <jsp:include page="/Views/footer.jsp"/>
               
    <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>             
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/Views/Admin/BookTransaction/script.js"></script>
</body>

</html