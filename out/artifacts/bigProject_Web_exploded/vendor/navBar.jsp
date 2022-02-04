<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="user.jsp"%>

<%
    String language = (String) request.getAttribute("languageString");
    if(language.equals("rus")){
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">NewsPortal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <%
                    if (online){
                %>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="homeServlet">ДОМАШНЯЯ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="profileServlet">ПРОФИЛЬ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="newsPage">НОВОСТИ</a>
                </li>
                <%
                }else{
                %>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="mainServlet">ГЛАВНАЯ</a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
        <div class="dropdown">
            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButtonrus" data-bs-toggle="dropdown" aria-expanded="false">
                ЯЗЫК
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonrus">
                <li><a class="dropdown-item" href="seteng">ENG</a></li>
                <li><a class="dropdown-item" href="setrus">РУС</a></li>
            </ul>
        </div>
        <%
            if (online){
        %>
        <div>
            <ul class="navbar-nav">

                <%
                    User user = (User) request.getSession().getAttribute("CURRENT_USER");
                    if(user.getRoleId().equals("1")){
                %>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle mx-3" type="button" id="dropdownMenuButton1rus" data-bs-toggle="dropdown" aria-expanded="false">
                        УПРАВЛЕНИЕ
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1rus">
                        <li><a class="dropdown-item" href="addNewsPage">ДОБАВИТЬ НОВОСТЬ</a></li>
                        <li><a class="dropdown-item" href="manageNewsPage">ИЗМЕНИТЬ НОВОСТЬ</a></li>
                        <li><a class="dropdown-item" href="addCategoryPage">КАТЕГОРИИ</a></li>
                    </ul>
                </div>
                <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="logoutServlet">ВЫЙТИ</a>
                </li>
            </ul>
        </div>
        <%
        } else {
        %>
        <div>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="loginPageServlet">ВХОД</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="registerPageServlet">РЕГИСТРАЦИЯ</a>
                </li>
            </ul>
        </div>
        <%
            }
        %>
    </div>
</nav>
<%
    }else if(language.equals("eng")){
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">NewsPortal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <%
                    if (online){
                %>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="homeServlet">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="profileServlet">PROFILE</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="newsPage">NEWS</a>
                </li>
                <%
                }else{
                %>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="mainServlet">MAIN</a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
        <div class="dropdown">
            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                LANGUAGE
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="seteng">ENG</a></li>
                <li><a class="dropdown-item" href="setrus">РУС</a></li>
            </ul>
        </div>
        <%
            if (online){
        %>
        <div>
            <ul class="navbar-nav">

                <%
                    User user = (User) request.getSession().getAttribute("CURRENT_USER");
                    if(user.getRoleId().equals("1")){
                %>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle mx-3" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        MANAGEMENT
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="addNewsPage">ADD NEWS</a></li>
                        <li><a class="dropdown-item" href="manageNewsPage">EDIT NEWS</a></li>
                        <li><a class="dropdown-item" href="addCategoryPage">CATEGORIES</a></li>
                    </ul>
                </div>
                <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="logoutServlet">LOGOUT</a>
                </li>
            </ul>
        </div>
        <%
            } else {
        %>
        <div>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="loginPageServlet">LOGIN</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="registerPageServlet">REGISTER</a>
                </li>
            </ul>
        </div>
        <%
            }
        %>
    </div>
</nav>
<%
    }
%>
