<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navBar.jsp"%>
<%
    User user = (User) request.getAttribute("user");
%>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <%
                if (language.equals("rus")){
            %>
            <form action="editProfileServlet" method="post">
                <%
                    String emailError = request.getParameter("emailerror");
                    if(emailError!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Неверный адрес электронной почты!</strong> Этот адрес электронной почты уже зарегистрирован!
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
                    <strong>Вы ввели неверный пароль подтверждения!</strong> Попробуйте снова.
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
                    <strong>Профиль успешно изменён!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <label>Адрес электронной почты:</label>
                    <input type="text" class="form-control" name="email" placeholder="Введите адрес электронной почты" value="<%=user.getEmail()%>">
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
                    <input type="text" class="form-control" name="fullName" placeholder="Введите Ф.И.О." value="<%=user.getFullName()%>">
                </div>
                <div class="mb-3">
                    <button class="btn btn-success mt-3">Изменить</button>
                </div>
            </form>
            <%
                }else if(language.equals("eng")){
            %>
            <form action="editProfileServlet" method="post">
                <%
                    String emailError = request.getParameter("emailerror");
                    if(emailError!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Wrong e-mail!</strong> That e-mail already exists.
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
                    <strong>You retyped password wrong!</strong> please try again.
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
                    <strong>Profile edited successfully!</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <label>E-mail:</label>
                    <input type="text" class="form-control" name="email" placeholder="Enter your e-mail" value="<%=user.getEmail()%>">
                </div>
                <div class="mb-3">
                    <label>Password:</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password">
                </div>
                <div class="mb-3">
                    <label>Re-Password:</label>
                    <input type="password" class="form-control" name="re-password" placeholder="Re-enter your password">
                </div>
                <div class="mb-3">
                    <label>Full name:</label>
                    <input type="text" class="form-control" name="fullName" placeholder="Enter your full name" value="<%=user.getFullName()%>">
                </div>
                <div class="mb-3">
                    <button class="btn btn-success mt-3">Edit</button>
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
