package com.servlets;

import com.tools.DBManager;
import com.tools.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "editProfileServlet", value = "/editProfileServlet")
public class editProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User oldUser = (User) request.getSession().getAttribute("CURRENT_USER");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String rePassword = request.getParameter("re-password");

        String redirect = "/editProfilePageServlet?emailerror";
        if(DBManager.getUser(email)==null){
            redirect = "/editProfilePageServlet?passworderror";
            if(password.equals(rePassword)){
                User user = new User(oldUser.getId(), email, password, fullName, oldUser.getRoleId());
                if(DBManager.editUser(user)){
                 redirect = "/editProfilePageServlet?success";
                }
            }
        }
        response.sendRedirect(redirect);
    }
}
