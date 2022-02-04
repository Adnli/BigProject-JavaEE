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
                if (language.equals("rus")){
            %>
            <form action="loginServlet" method="post" class="form-control">
                <%
                String emailError = request.getParameter("emailerror");
                if(emailError!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Неверный адрес электронной почты!</strong> Пожалуйста, проверьте ваш адрес электронной почты или выполните регистрацию если вы не зарегистрированы.
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
                <div class="mb-3 mt-3">
                    <label>Адрес электронной почты:</label>
                    <input type="text" class="form-control" name="email" placeholder="Введите адрес электронной почты">
                </div>
                <div class="mb-3">
                    <label>Пароль:</label>
                    <input type="password" class="form-control" name="password" placeholder="Введите пароль">
                </div>
                <div class="mb-3">
                    <button class="btn btn-success mt-3">ВХОД</button>
                </div>
            </form>
            <%
                }else if(language.equals("eng")){
            %>
            <form action="loginServlet" method="post" class="form-control">
                <%
                    String emailError = request.getParameter("emailerror");
                    if(emailError!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Wrong email!</strong> please check your email or complete registration if you are not registered.
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
                    <strong>Wrong password!</strong> please try again.
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
                    <button class="btn btn-success mt-3">Login</button>
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
