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
    <%
        if(language.equals("rus")){
    %>
    <div class="row">
        <div class="col-sm-6 offset-3">
            <form action="addCategory" method="post">
                <%
                    String success = request.getParameter("success");
                    if (success != null) {
                %>
                <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
                    <strong>Категории успешно обновлены!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <label>Название:</label>
                    <input type="text" class="form-control" name="name" placeholder="Введите название">
                </div>
                <button class="btn btn-success mt-3">ДОБАВИТЬ</button>
            </form>
        </div>
    </div>
    <%
        ArrayList<NewsCategory> newsCategories = (ArrayList<NewsCategory>) request.getAttribute("categories");
    %>
    <div class="row">
        <div class="col">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" class="col-md-1">ID</th>
                    <th scope="col">НАЗВАНИЕ</th>
                    <th scope="col" class="col-md-1">ИЗМЕНИТЬ</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if(newsCategories!=null){
                        for (NewsCategory nc : newsCategories){
                %>
                <tr>
                    <th scope="row"><%=nc.getId()%></th>
                    <td><%=nc.getName()%></td>
                    <form action="editCategoryPage" method="get">
                        <input type="hidden" name="id" value="<%=nc.getId()%>">
                        <td><button class="btn btn-primary">ИЗМЕНИТЬ</button></td>
                    </form>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <%
        }else {
    %>
    <div class="row">
        <div class="col-sm-6 offset-3">
            <form action="addCategory" method="post">
                <%
                    String success = request.getParameter("success");
                    if (success != null) {
                %>
                <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
                    <strong>Categories edited successfully!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <label>Name:</label>
                    <input type="text" class="form-control" name="name" placeholder="Write name">
                </div>
                <button class="btn btn-success mt-3">ADD</button>
            </form>
        </div>
    </div>
    <%
        ArrayList<NewsCategory> newsCategories = (ArrayList<NewsCategory>) request.getAttribute("categories");
    %>
    <div class="row">
        <div class="col">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" class="col-md-1">ID</th>
                    <th scope="col">NAME</th>
                    <th scope="col" class="col-md-1">EDIT</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if(newsCategories!=null){
                        for (NewsCategory nc : newsCategories){
                %>
                <tr>
                    <th scope="row"><%=nc.getId()%></th>
                    <td><%=nc.getName()%></td>
                    <form action="editCategoryPage" method="get">
                        <input type="hidden" name="id" value="<%=nc.getId()%>">
                        <td><button class="btn btn-primary">EDIT</button></td>
                    </form>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>
</html>