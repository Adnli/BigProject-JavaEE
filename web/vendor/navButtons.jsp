<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.tools.NewsCategory" %>
<%@ page import="com.tools.NewsContent" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tools.News" %>
<%
    Cookie[] navButtonsCookies = request.getCookies();
    String navButtonLanguage = "eng";
    String newsLanguage = "all";
    String categoryId = "all";
    for (Cookie c : navButtonsCookies){
        if(c.getName().equals("language")){
            navButtonLanguage = c.getValue();
        }
        if (c.getName().equals("newsLanguage")) {
            newsLanguage = c.getValue();
        }
        if (c.getName().equals("category")) {
            categoryId = c.getValue();
        }
    }
    User user = (User) request.getAttribute("user");
    ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
    ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
    ArrayList<NewsCategory> newsCategories = (ArrayList<NewsCategory>) request.getAttribute("categories");
    ArrayList<NewsContent> newsContents = (ArrayList<NewsContent>) request.getAttribute("contents");
    ArrayList<News> news = (ArrayList<News>) request.getAttribute("news");
%>
<ul class="nav nav-pills">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><%
            if(navButtonLanguage!=null){
                if (navButtonLanguage.equals("rus")){
                    out.print("Категории");
                }else {
                    out.print("Categories");
                }
            }
        %></a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="politicalPage"><%
                if(navButtonLanguage!=null){
                    if (navButtonLanguage.equals("rus")){
                        out.print("Политика");
                    }else {
                        out.print("Political");
                    }
                }
            %></a></li>
            <li><a class="dropdown-item" href="sportPage"><%
                if(navButtonLanguage!=null){
                    if (navButtonLanguage.equals("rus")){
                        out.print("Спорт");
                    }else {
                        out.print("Sport");
                    }
                }
            %></a></li>
            <li><a class="dropdown-item" href="electronicPage"><%
                if(navButtonLanguage!=null){
                    if (navButtonLanguage.equals("rus")){
                        out.print("Электроника");
                    }else {
                        out.print("Electronic");
                    }
                }
            %></a></li>
            <li><a class="dropdown-item" href="naturePage"><%
                if(navButtonLanguage!=null){
                    if (navButtonLanguage.equals("rus")){
                        out.print("Природа");
                    }else {
                        out.print("Nature");
                    }
                }
            %></a></li>
            <li><a class="dropdown-item" href="gamesPage"><%
                if(navButtonLanguage!=null){
                    if (navButtonLanguage.equals("rus")){
                        out.print("Игры");
                    }else {
                        out.print("Games");
                    }
                }
            %></a></li>
            <li><a class="dropdown-item" href="filmsPage"><%
                if(navButtonLanguage!=null){
                    if (navButtonLanguage.equals("rus")){
                        out.print("Фильмы");
                    }else {
                        out.print("Films");
                    }
                }
            %></a></li>
            <li><a class="dropdown-item" href="economicPage"><%
                if(navButtonLanguage!=null){
                    if (navButtonLanguage.equals("rus")){
                        out.print("Экономика");
                    }else {
                        out.print("Economic");
                    }
                }
            %></a></li>
            <li><a class="dropdown-item" href="allCategories"><%
                if(navButtonLanguage!=null){
                    if (navButtonLanguage.equals("rus")){
                        out.print("ВСЕ");
                    }else {
                        out.print("ALL");
                    }
                }
            %></a></li>
        </ul>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><%
            if(navButtonLanguage!=null){
                if (navButtonLanguage.equals("rus")){
                    out.print("Язык");
                }else {
                    out.print("News language");
                }
            }
            %></a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="setEngNews">ENG</a></li>
            <li><a class="dropdown-item" href="setRusNews">RUS</a></li>
            <li><a class="dropdown-item" href="setAllNews"><%
                if(navButtonLanguage!=null){
                    if (navButtonLanguage.equals("rus")){
                        out.print("ВСЕ");
                    }else {
                        out.print("ALL");
                    }
                }
            %></a></li>
        </ul>
    </li>
</ul>