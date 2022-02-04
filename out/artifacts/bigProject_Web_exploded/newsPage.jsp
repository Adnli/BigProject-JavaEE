<%@ page import="com.tools.*" %>
<%@ page import="jdk.jfr.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp" %>
</head>
<body>
<%@include file="vendor/navBar.jsp" %>

<div class="container">
    <%@include file="vendor/navButtons.jsp" %>
    <div class="row">
        <div class="col">
            <%

                if (categoryId.equals("all")) {
                    for (News n : news) {
                        for (NewsContent nc : newsContents) {
                            if (newsLanguage.equals("rus")) {
                                if (nc.getLanguageId() == 2L) {
                                    if (n.getId().equals(nc.getNewsId())) {
                                        Long newsId = null;
            %>
            <div class="form-control mt-3" style="border-radius: 0">
                <h3>
                    <%=nc.getText()%>
                </h3>
                <p>
                    <%=nc.getContent()%>
                </p>
                <div>
                    <p style="font-weight: bold;"><%
                        if (language.equals("rus")) {
                            out.print("Дата: " + n.getPostDate());
                        } else {
                            out.print("Date: " + n.getPostDate());
                        }
                        newsId = nc.getNewsId();
                    %>
                    </p>
                    <p><%
                        for (NewsCategory ncg : newsCategories) {
                            if (ncg.getId().equals(n.getCategoryId())) {
                                if (language.equals("rus")) {
                                    out.print("Категория: " + ncg.getName());
                                } else {
                                    out.print("Category: " + ncg.getName());
                                }
                            }
                        }
                    %>
                    </p>
                </div>
                <div class="row">
                    <label class="mb-2"><%
                        if (language.equals("rus")) {
                            out.print("Комментарии: ");
                        } else {
                            out.print("Comments: ");
                        }%></label>
                    <%
                        for (Comment c : comments) {
                            if (c.getNewsId().equals(newsId)) {
                    %>
                    <a style="color: royalblue; text-decoration: none">
                        <%
                            for (User u : users) {
                                if (u.getId().equals(c.getUserId())) {
                                    out.print(u.getFullName());
                                }
                            }
                        %>
                    </a>
                    <p>
                        <%=c.getComment()%>
                        <a class="mx-3" style="color: gray; text-decoration: none">
                            <%=c.getPostDate()%>
                        </a>
                    </p>
                    <%
                            }
                        }
                    %>
                    <form action="addComment" method="post">
                        <input type="hidden" value="<%=newsId%>" name="newsId">
                        <input type=" text" class="form-control" placeholder="<%if(language.equals("rus")){
                        out.print("Напишите комментарий...");
                        }else {
                        out.print("Write a comment");
                        }%>" name="comment">
                        <button class="btn btn-primary mt-2"><%
                            if (language.equals("rus")) {
                                out.print("Отправить");
                            } else {
                                out.print("Send");
                            }
                        %></button>
                    </form>
                </div>
            </div>
            <%
                    }
                }
            } else if (newsLanguage.equals("eng")) {
                if (nc.getLanguageId() == 1L) {
                    if (n.getId().equals(nc.getNewsId())) {
                        Long newsId = null;
            %>
            <div class="form-control mt-3" style="border-radius: 0">
                <h3>
                    <%=nc.getText()%>
                </h3>
                <p>
                    <%=nc.getContent()%>
                </p>
                <div>
                    <p style="font-weight: bold;"><%
                        if (language.equals("rus")) {
                            out.print("Дата: " + n.getPostDate());
                        } else {
                            out.print("Date: " + n.getPostDate());
                        }
                        newsId = nc.getNewsId();
                    %>
                    </p>
                    <p><%
                        for (NewsCategory ncg : newsCategories) {
                            if (ncg.getId().equals(n.getCategoryId())) {
                                if (language.equals("rus")) {
                                    out.print("Категория: " + ncg.getName());
                                } else {
                                    out.print("Category: " + ncg.getName());
                                }
                            }
                        }
                    %>
                    </p>
                </div>
                <div class="row">
                    <label class="mb-2"><%
                        if (language.equals("rus")) {
                            out.print("Комментарии: ");
                        } else {
                            out.print("Comments: ");
                        }%></label>
                    <%
                        for (Comment c : comments) {
                            if (c.getNewsId().equals(newsId)) {
                    %>
                    <a style="color: royalblue; text-decoration: none">
                        <%
                            for (User u : users) {
                                if (u.getId().equals(c.getUserId())) {
                                    out.print(u.getFullName());
                                }
                            }
                        %>
                    </a>
                    <p>
                        <%=c.getComment()%>
                        <a class="mx-3" style="color: gray; text-decoration: none">
                            <%=c.getPostDate()%>
                        </a>
                    </p>
                    <%
                            }
                        }
                    %>
                    <form action="addComment" method="post">
                        <input type="hidden" value="<%=newsId%>" name="newsId">
                        <input type=" text" class="form-control" placeholder="<%if(language.equals("rus")){
                        out.print("Напишите комментарий...");
                        }else {
                        out.print("Write a comment");
                        }%>" name="comment">
                        <button class="btn btn-primary mt-2"><%
                            if (language.equals("rus")) {
                                out.print("Отправить");
                            } else {
                                out.print("Send");
                            }
                        %></button>
                    </form>
                </div>
            </div>
            <%
                    }
                }
            } else if (newsLanguage.equals("all")) {
                if (n.getId().equals(nc.getNewsId())) {
                    Long newsId = null;
            %>
            <div class="form-control mt-3" style="border-radius: 0">
                <h3>
                    <%=nc.getText()%>
                </h3>
                <p>
                    <%=nc.getContent()%>
                </p>
                <div>
                    <p style="font-weight: bold;"><%
                        if (language.equals("rus")) {
                            out.print("Дата: " + n.getPostDate());
                        } else {
                            out.print("Date: " + n.getPostDate());
                        }
                        newsId = nc.getNewsId();
                    %>
                    </p>
                    <p><%
                        for (NewsCategory ncg : newsCategories) {
                            if (ncg.getId().equals(n.getCategoryId())) {
                                if (language.equals("rus")) {
                                    out.print("Категория: " + ncg.getName());
                                } else {
                                    out.print("Category: " + ncg.getName());
                                }
                            }
                        }
                    %>
                    </p>
                </div>
                <div class="row">
                    <label class="mb-2"><%
                        if (language.equals("rus")) {
                            out.print("Комментарии: ");
                        } else {
                            out.print("Comments: ");
                        }%></label>
                    <%
                        for (Comment c : comments) {
                            if (c.getNewsId().equals(newsId)) {
                    %>
                    <a style="color: royalblue; text-decoration: none">
                        <%
                            for (User u : users) {
                                if (u.getId().equals(c.getUserId())) {
                                    out.print(u.getFullName());
                                }
                            }
                        %>
                    </a>
                    <p>
                        <%=c.getComment()%>
                        <a class="mx-3" style="color: gray; text-decoration: none">
                            <%=c.getPostDate()%>
                        </a>
                    </p>
                    <%
                            }
                        }
                    %>
                    <form action="addComment" method="post">
                        <input type="hidden" value="<%=newsId%>" name="newsId">
                        <input type=" text" class="form-control" placeholder="<%if(language.equals("rus")){
                        out.print("Напишите комментарий...");
                        }else {
                        out.print("Write a comment");
                        }%>" name="comment">
                        <button class="btn btn-primary mt-2"><%
                            if (language.equals("rus")) {
                                out.print("Отправить");
                            } else {
                                out.print("Send");
                            }
                        %></button>
                    </form>
                </div>
            </div>
            <%
                            }
                        }
                    }
                }
            } else {
                for (News n : news) {
                    if ((Long.parseLong(categoryId)) == n.getCategoryId()) {
                        for (NewsContent nc : newsContents) {
                            if (newsLanguage.equals("rus")) {
                                if (nc.getLanguageId() == 2L) {
                                    if (n.getId().equals(nc.getNewsId())) {
                                        Long newsId = null;
            %>
            <div class="form-control mt-3" style="border-radius: 0">
                <h3>
                    <%=nc.getText()%>
                </h3>
                <p>
                    <%=nc.getContent()%>
                </p>
                <div>
                    <p style="font-weight: bold;"><%
                        if (language.equals("rus")) {
                            out.print("Дата: " + n.getPostDate());
                        } else {
                            out.print("Date: " + n.getPostDate());
                        }
                        newsId = nc.getNewsId();
                    %>
                    </p>
                    <p><%
                        for (NewsCategory ncg : newsCategories) {
                            if (ncg.getId().equals(n.getCategoryId())) {
                                if (language.equals("rus")) {
                                    out.print("Категория: " + ncg.getName());
                                } else {
                                    out.print("Category: " + ncg.getName());
                                }
                            }
                        }
                    %>
                    </p>
                </div>
                <div class="row">
                    <label class="mb-2"><%
                        if (language.equals("rus")) {
                            out.print("Комментарии: ");
                        } else {
                            out.print("Comments: ");
                        }%></label>
                    <%
                        for (Comment c : comments) {
                            if (c.getNewsId().equals(newsId)) {
                    %>
                    <a style="color: royalblue; text-decoration: none">
                        <%
                            for (User u : users) {
                                if (u.getId().equals(c.getUserId())) {
                                    out.print(u.getFullName());
                                }
                            }
                        %>
                    </a>
                    <p>
                        <%=c.getComment()%>
                        <a class="mx-3" style="color: gray; text-decoration: none">
                            <%=c.getPostDate()%>
                        </a>
                    </p>
                    <%
                            }
                        }
                    %>
                    <form action="addComment" method="post">
                        <input type="hidden" value="<%=newsId%>" name="newsId">
                        <input type=" text" class="form-control" placeholder="<%if(language.equals("rus")){
                        out.print("Напишите комментарий...");
                        }else {
                        out.print("Write a comment");
                        }%>" name="comment">
                        <button class="btn btn-primary mt-2"><%
                            if (language.equals("rus")) {
                                out.print("Отправить");
                            } else {
                                out.print("Send");
                            }
                        %></button>
                    </form>
                </div>
            </div>
            <%
                    }
                }
            } else if (newsLanguage.equals("eng")) {
                if (nc.getLanguageId() == 1L) {
                    if (n.getId().equals(nc.getNewsId())) {
                        Long newsId = null;
            %>
            <div class="form-control mt-3" style="border-radius: 0">
                <h3>
                    <%=nc.getText()%>
                </h3>
                <p>
                    <%=nc.getContent()%>
                </p>
                <div>
                    <p style="font-weight: bold;"><%
                        if (language.equals("rus")) {
                            out.print("Дата: " + n.getPostDate());
                        } else {
                            out.print("Date: " + n.getPostDate());
                        }
                        newsId = nc.getNewsId();
                    %>
                    </p>
                    <p><%
                        for (NewsCategory ncg : newsCategories) {
                            if (ncg.getId().equals(n.getCategoryId())) {
                                if (language.equals("rus")) {
                                    out.print("Категория: " + ncg.getName());
                                } else {
                                    out.print("Category: " + ncg.getName());
                                }
                            }
                        }
                    %>
                    </p>
                </div>
                <div class="row">
                    <label class="mb-2"><%
                        if (language.equals("rus")) {
                            out.print("Комментарии: ");
                        } else {
                            out.print("Comments: ");
                        }%></label>
                    <%
                        for (Comment c : comments) {
                            if (c.getNewsId().equals(newsId)) {
                    %>
                    <a style="color: royalblue; text-decoration: none">
                        <%
                            for (User u : users) {
                                if (u.getId().equals(c.getUserId())) {
                                    out.print(u.getFullName());
                                }
                            }
                        %>
                    </a>
                    <p>
                        <%=c.getComment()%>
                        <a class="mx-3" style="color: gray; text-decoration: none">
                            <%=c.getPostDate()%>
                        </a>
                    </p>
                    <%
                            }
                        }
                    %>
                    <form action="addComment" method="post">
                        <input type="hidden" value="<%=newsId%>" name="newsId">
                        <input type=" text" class="form-control" placeholder="<%if(language.equals("rus")){
                        out.print("Напишите комментарий...");
                        }else {
                        out.print("Write a comment");
                        }%>" name="comment">
                        <button class="btn btn-primary mt-2"><%
                            if (language.equals("rus")) {
                                out.print("Отправить");
                            } else {
                                out.print("Send");
                            }
                        %></button>
                    </form>
                </div>
            </div>
            <%
                    }
                }
            } else if (newsLanguage.equals("all")) {
                if (n.getId().equals(nc.getNewsId())) {
                    Long newsId = null;
            %>
            <div class="form-control mt-3" style="border-radius: 0">
                <h3>
                    <%=nc.getText()%>
                </h3>
                <p>
                    <%=nc.getContent()%>
                </p>
                <div>
                    <p style="font-weight: bold;"><%
                        if (language.equals("rus")) {
                            out.print("Дата: " + n.getPostDate());
                        } else {
                            out.print("Date: " + n.getPostDate());
                        }
                        newsId = nc.getNewsId();
                    %>
                    </p>
                    <p><%
                        for (NewsCategory ncg : newsCategories) {
                            if (ncg.getId().equals(n.getCategoryId())) {
                                if (language.equals("rus")) {
                                    out.print("Категория: " + ncg.getName());
                                } else {
                                    out.print("Category: " + ncg.getName());
                                }
                            }
                        }
                    %>
                    </p>
                </div>
                <div class="row">
                    <label class="mb-2"><%
                        if (language.equals("rus")) {
                            out.print("Комментарии: ");
                        } else {
                            out.print("Comments: ");
                        }%></label>
                    <%
                        for (Comment c : comments) {
                            if (c.getNewsId().equals(newsId)) {
                    %>
                    <a style="color: royalblue; text-decoration: none">
                        <%
                            for (User u : users) {
                                if (u.getId().equals(c.getUserId())) {
                                    out.print(u.getFullName());
                                }
                            }
                        %>
                    </a>
                    <p>
                        <%=c.getComment()%>
                        <a class="mx-3" style="color: gray; text-decoration: none">
                            <%=c.getPostDate()%>
                        </a>
                    </p>
                    <%
                            }
                        }
                    %>
                    <form action="addComment" method="post">
                        <input type="hidden" value="<%=newsId%>" name="newsId">
                        <input type=" text" class="form-control" placeholder="<%if(language.equals("rus")){
                        out.print("Напишите комментарий...");
                        }else {
                        out.print("Write a comment");
                        }%>" name="comment">
                        <button class="btn btn-primary mt-2"><%
                            if (language.equals("rus")) {
                                out.print("Отправить");
                            } else {
                                out.print("Send");
                            }
                        %></button>
                    </form>
                </div>
            </div>
            <%
                                    }
                                }
                            }
                        }
                    }
                }
            %>
        </div>
    </div>
</div>
</div>
</body>
</html>
