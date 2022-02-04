<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navBar.jsp"%>
<%
    User user = (User) request.getAttribute("user");
%>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <%if (language.equals("rus")){
            %>
            <div class="form-control mb-3">
                <label><strong>Адрес элекронной почты: </strong><%=user.getEmail()%></label>
            </div>
            <div class="form-control mb-3">
                <label><strong>Полное имя: </strong><%=user.getFullName()%></label>
            </div>
            <form action="editProfilePageServlet" method="get">
                <button class="btn btn-primary">ИЗМЕНИТЬ</button>
            </form>
            <%
                }else if (language.equals("eng")){
            %>
            <div class="form-control mb-3">
                <label><strong>E-MAIL: </strong><%=user.getEmail()%></label>
            </div>
            <div class="form-control mb-3">
                <label><strong>FULL NAME: </strong><%=user.getFullName()%></label>
            </div>
            <form action="editProfilePageServlet" method="get">
                <button class="btn btn-primary">EDIT</button>
            </form>
            <%
                }
            %>
        </div>

    </div>
</div>
</body>
</html>