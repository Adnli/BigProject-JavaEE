<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tools.NewsCategory" %>
<%@ page import="com.tools.Language" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navBar.jsp"%>
<%
    ArrayList<NewsCategory> newsCategories = (ArrayList<NewsCategory>) request.getAttribute("categories");
    ArrayList<Language> languages = (ArrayList<Language>) request.getAttribute("languages");
%>
<div class="container">
    <div class="row">
        <div class="col-sm-6 offset-3">
            <%
            if(language.equals("rus")){
            %>
            <form action="addNews" method="post">
                <%
                    String error = request.getParameter("error");
                    if (error!= null) {
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
                    <strong>Новость успешно добавлена!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <label>Название:</label>
                    <input type="text" class="form-control" name="title" placeholder="Введите название">
                </div>
                <div class="mb-3">
                    <label>Содержание:</label>
                    <textarea class="form-control" rows="6" placeholder="Введите содержание" name="content"></textarea>

                </div>
                <div class="mb-3">
                    <label>Категория:</label>
                    <select class="form-control" name="category">
                        <%
                            if(newsCategories!=null){
                                for(NewsCategory nc : newsCategories){
                        %>
                        <option value="<%=nc.getId()%>"><%=nc.getName()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="mb-3">
                    <label>Язык:</label>
                    <select class="form-control" name="language">
                        <%
                            if(languages!=null){
                                for (Language l : languages){
                        %>
                        <option value="<%=l.getId()%>"><%=l.getCode()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div>
                    <button class="btn btn-success mt-3">ДОБАВИТЬ</button>
                </div>
            </form>
            <%
                }else{
            %>
            <form action="addNews" method="post">
                <%
                    String error = request.getParameter("error");
                    if (error!= null) {
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
                    <strong>News added successfully!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <label>Title:</label>
                    <input type="text" class="form-control" name="title" placeholder="Write title">
                </div>
                <div class="mb-3">
                    <label>Content:</label>
                    <textarea class="form-control" rows="6" placeholder="Write content" name="content"></textarea>
                </div>
                <div class="mb-3">
                    <label>Category:</label>
                    <select class="form-control" name="category">
                        <%
                            if(newsCategories!=null){
                                for(NewsCategory nc : newsCategories){
                        %>
                        <option value="<%=nc.getId()%>"><%=nc.getName()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="mb-3">
                    <label>Language:</label>
                    <select class="form-control" name="language">
                        <%
                            if(languages!=null){
                                for (Language l : languages){
                        %>
                        <option value="<%=l.getId()%>"><%=l.getCode()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div>
                    <button class="btn btn-success mt-3">ADD</button>
                </div>
            </form>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
