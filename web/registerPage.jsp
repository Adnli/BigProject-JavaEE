<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navBar.jsp"%>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <%
                if(language.equals("rus")){
            %>
            <form action="registerServlet" method="post" class="form-control">
                <%
                String emailError = request.getParameter("emailerror");
                if(emailError!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Пользователь с таким электронным почтовым адресом уже существует!</strong> Пожалуйста, выполните вход или укажите другой адрес электронной почты.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <%
                    String passwordError = request.getParameter("passworderror");
                    if(passwordError!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Неверный пароль!</strong> Попробуйте снова.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <%
                    String success = request.getParameter("success");
                    if(success!=null){
                %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Регистрация прошла успешно!</strong> Выполните вход для использования вашего профиля!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3 mt-3">
                    <label>Адрес электронной почты:</label>
                    <input type="text" class="form-control" name="email" placeholder="Введите адрес электронной почты">
                </div>
                <div class="mb-3">
                    <label>Пароль:</label>
                    <input type="password" class="form-control" name="password" placeholder="Введите пароль">

                </div>
                <div class="mb-3">
                    <label>Подтверждение пароля:</label>
                    <input type="password" class="form-control" name="re-password" placeholder="Подтвердите пароль">
                </div>
                <div class="mb-3">
                    <label>Полное имя:</label>
                    <input type="text" class="form-control" name="fullName" placeholder="Введите Ф.И.О">
                </div>
                <div>
                    <button class="btn btn-success mt-3 mb-3">РЕГИСТРАЦИЯ</button>
                </div>
            </form>
            <%
                }else if (language.equals("eng")){
            %>
            <form action="registerServlet" method="post" class="form-control">
                <%
                    String emailError = request.getParameter("emailerror");
                    if(emailError!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>User already exists!</strong> please login if you already registered.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <%
                    String passwordError = request.getParameter("passworderror");
                    if(passwordError!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Password error!</strong> please try again.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <%
                    String success = request.getParameter("success");
                    if(success!=null){
                %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Your registration completed!</strong> Login to enter your profile!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3 mt-3">
                    <label>E-mail:</label>
                    <input type="text" class="form-control" name="email" placeholder="Enter your e-mail">
                </div>
                <div class="mb-3">
                    <label>Password:</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password">

                </div>
                <div class="mb-3">
                    <label>Confirm password:</label>
                    <input type="password" class="form-control" name="re-password" placeholder="Repeat your password">
                </div>
                <div class="mb-3">
                    <label>Full name:</label>
                    <input type="text" class="form-control" name="fullName" placeholder="Enter your full name">
                </div>
                <div>
                    <button class="btn btn-success mt-3 mb-3">Register</button>
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
