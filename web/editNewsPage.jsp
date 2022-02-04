<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tools.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navBar.jsp"%>
<%
    NewsContent newsContent = (NewsContent) request.getAttribute("content");
    News news = (News) request.getAttribute("news");
    ArrayList<NewsCategory> newsCategories = (ArrayList<NewsCategory>) request.getAttribute("categories");
    ArrayList<Language> languages = (ArrayList<Language>) request.getAttribute("languages");
%>
<div class="container">
    <div class="row">
        <div class="col-sm-6 offset-3">
            <%
            if(language.equals("rus")){
            %>
            <form action="editNews" method="post">
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
                    <strong>Новость успешно изменена!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <label>Название:</label>
                    <input type="text" class="form-control" name="title" placeholder="Введите название" value="<%=newsContent.getText()%>">
                </div>
                <div class="mb-3">
                    <label>Содержание:</label>
                    <textarea class="form-control" rows="6" placeholder="Введите содержание" name="content"><%=newsContent.getContent()%></textarea>
                </div>
                <div class="mb-3">
                    <label>Категория:</label>
                    <select class="form-control" name="category">
                        <%
                            if(newsCategories!=null){
                                for(NewsCategory nc : newsCategories){
                        %>
                        <option value="<%=nc.getId()%>" <%if (nc.getId().equals(news.getCategoryId())){
                            out.print("selected");
                        }%>><%=nc.getName()%></option>
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
                        <option value="<%=l.getId()%>"<%if(l.getId().equals(newsContent.getLanguageId())){
                            out.print("selected");
                        }%>><%=l.getCode()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div>
                    <input type="hidden" name="id" value="<%=newsContent.getId()%>">
                    <input type="hidden" name="newsId" value="<%=news.getId()%>">
                    <button class="btn btn-success mt-3">ИЗМЕНИТЬ</button>
                </div>
            </form>
            <form action="deleteNews" method="post">
                <div>
                    <input type="hidden" name="id" value="<%=news.getId()%>">
                    <button class="btn btn-danger mt-3">УДАЛИТЬ</button>
                </div>
            </form>
            <%
                }else {
            %>
            <form action="editNews" method="post">
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
                    <strong>News edited successfully!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <label>Title:</label>
                    <input type="text" class="form-control" name="title" placeholder="Write title" value="<%=newsContent.getText()%>">
                </div>
                <div class="mb-3">
                    <label>Content:</label>
                    <textarea class="form-control" rows="6" placeholder="Write content" name="content"><%=newsContent.getContent()%></textarea>
                </div>
                <div class="mb-3">
                    <label>Category:</label>
                    <select class="form-control" name="category">
                        <%
                            if(newsCategories!=null){
                                for(NewsCategory nc : newsCategories){
                        %>
                        <option value="<%=nc.getId()%>" <%if (nc.getId().equals(news.getCategoryId())){
                            out.print("selected");
                        }%>><%=nc.getName()%></option>
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
                        <option value="<%=l.getId()%>"<%if(l.getId().equals(newsContent.getLanguageId())){
                            out.print("selected");
                        }%>><%=l.getCode()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div>
                    <input type="hidden" name="id" value="<%=newsContent.getId()%>">
                    <input type="hidden" name="newsId" value="<%=news.getId()%>">
                    <button class="btn btn-success mt-3">EDIT</button>
                </div>
            </form>
            <form action="deleteNews" method="post">
                <div>
                    <input type="hidden" name="id" value="<%=news.getId()%>">
                    <button class="btn btn-danger mt-3">DELETE</button>
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
