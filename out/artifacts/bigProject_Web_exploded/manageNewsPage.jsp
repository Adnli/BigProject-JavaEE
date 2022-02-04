<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tools.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp" %>
</head>
<body>
<%@include file="vendor/navBar.jsp" %>
<%
    Long newsId = null;
%>
<div class="container">
    <%@include file="vendor/navButtons.jsp"%>
    <div class="row">
        <div class="col">
            <%
            if(language.equals("rus")){
            %>
            <%
                String error = request.getParameter("error");
                if (error != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Что-то пошло не так!</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <%
                String success = request.getParameter("success");
                if (success != null) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Новость успешно обновлена!</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <%
                if (newsContents != null) {
                    for (NewsContent nc : newsContents) {
            %>
            <div class="form-control mt-3">
                <h3>
                    <%=nc.getText()%>
                </h3>
                <p>
                    <%=nc.getContent()%>
                </p>
                <%
                    if (news != null) {
                        for (News n : news) {
                %>
                <div>
                    <p style="font-weight: bold;"><%
                        if (nc.getNewsId().equals(n.getId())) {
                            out.print("Дата: " + n.getPostDate());
                            newsId = n.getId();
                        }
                    %>
                    </p>
                    <p><%
                        if (nc.getNewsId().equals(n.getId())) {
                            for (NewsCategory ncg : newsCategories) {
                                if (ncg.getId().equals(n.getCategoryId())) {
                                    out.print("Категория: " + ncg.getName());
                                }
                            }
                        }
                    %>
                    </p>
                </div>
                <%
                    }
                %>
                <form action="editNewsPage" method="post">
                    <input type="hidden" name="id" value="<%=newsId%>">
                    <button class="btn btn-primary">ИЗМЕНИТЬ</button>
                </form>
                <%
                    }
                %>
            </div>
            <%
                    }
                }
            %>
            <%
                }else {
            %>
            <%
                String error = request.getParameter("error");
                if (error != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>O-o-ops! Something went wrong!</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
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
            <%
                if (newsContents != null) {
                    for (NewsContent nc : newsContents) {
            %>
            <div class="form-control mt-3">
                <h3>
                    <%=nc.getText()%>
                </h3>
                <p>
                    <%=nc.getContent()%>
                </p>
                <%
                    if (news != null) {
                        for (News n : news) {
                %>
                <div>
                    <p style="font-weight: bold;"><%
                        if (nc.getNewsId().equals(n.getId())) {
                            out.print("Date: " + n.getPostDate());
                            newsId = n.getId();
                        }
                    %>
                    </p>
                    <p><%
                        if (nc.getNewsId().equals(n.getId())) {
                            for (NewsCategory ncg : newsCategories) {
                                if (ncg.getId().equals(n.getCategoryId())) {
                                    out.print("Category: " + ncg.getName());
                                }
                            }
                        }
                    %>
                    </p>
                </div>
                <%
                    }
                %>
                <form action="editNewsPage" method="post">
                    <input type="hidden" name="id" value="<%=newsId%>">
                    <button class="btn btn-primary">EDIT</button>
                </form>
                <%
                    }
                %>
            </div>
            <%
                    }
                }
            %>
            <%
                }
            %>

        </div>
    </div>
</div>
</body>
</html>
