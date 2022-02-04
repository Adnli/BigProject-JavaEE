<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tools.NewsCategory" %>
<%@ page import="com.tools.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp" %>
</head>
<body>
<%@include file="vendor/navBar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-sm-6 offset-3">
            <%
                if(language.equals("rus")){
            %>
            <form action="editCategory" method="post">
                <%
                    String success = request.getParameter("success");
                    if (success != null) {
                %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Новость успешно изменена!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <%
                        NewsCategory nc = (NewsCategory) request.getAttribute("newsCategory");
                    %>
                    <label>Название:</label>
                    <input type="text" class="form-control" name="name" placeholder="Введите название"
                           value="<%=nc.getName()%>">
                </div>
                <input type="hidden" name="id" value="<%=nc.getId()%>">
                <button class="btn btn-success mt-3">ИЗМЕНИТЬ</button>
            </form>
            <form action="deleteCategory" method="post">
                <input type="hidden" name="id" value="<%=nc.getId()%>">
                <button class="btn btn-danger mt-3">УДАЛИТЬ</button>
            </form>
            <%
                }else {
            %>
            <form action="editCategory" method="post">
                <%
                    String success = request.getParameter("success");
                    if (success != null) {
                %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>News edited successfully!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <%
                        NewsCategory nc = (NewsCategory) request.getAttribute("newsCategory");
                    %>
                    <label>Name:</label>
                    <input type="text" class="form-control" name="name" placeholder="Write name"
                           value="<%=nc.getName()%>">
                </div>
                <input type="hidden" name="id" value="<%=nc.getId()%>">
                <button class="btn btn-success mt-3">EDIT</button>
            </form>
            <form action="deleteCategory" method="post">
                <input type="hidden" name="id" value="<%=nc.getId()%>">
                <button class="btn btn-danger mt-3">DELETE</button>
            </form>
            <%
                }
            %>

        </div>
    </div>
</div>
</body>
</html>