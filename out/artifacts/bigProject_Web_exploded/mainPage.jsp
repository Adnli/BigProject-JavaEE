<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navBar.jsp"%>
<%
    if(language.equals("rus")){
%>
<h1 class="text-center">ДОБРО ПОЖАЛОВАТЬ! ПОЖАЛУЙСТА, ВОЙДИТЕ ИЛИ ЗАРЕГИСТРИРУЙТЕСЬ НА НАШЕМ НОВОСТНОМ ПОРТАЛЕ.</h1>
<%
}else if(language.equals("eng")){
%>
<h1 class="text-center">WELCOME! PLEASE LOGIN OR REGISTER ON OUR NEWS PORTAL</h1>
<%
    }
%>
</body>
</html>
