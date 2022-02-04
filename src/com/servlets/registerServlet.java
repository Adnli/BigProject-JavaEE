package com.servlets;

import com.tools.DBManager;
import com.tools.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/registerServlet")
public class registerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("re-password");
        String fullName = request.getParameter("fullName");
        String roleId = "2";

        String redirect = "/registerPageServlet?passworderror";
        if (password.equals(rePassword)){
            redirect = "/registerPageServlet?emailerror";
            User user = DBManager.getUser(email);
            if(user==null){
                User newUser = new User(null, email, password, fullName, roleId);
                if(DBManager.addUser(newUser)){
                    redirect = "/registerPageServlet?success";
                }
            }
        }
        response.sendRedirect(redirect);
    }
}
