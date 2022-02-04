package com.servlets;

import com.tools.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/seteng")
public class setEngLanguageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookie = new Cookie("language","eng");
        response.addCookie(cookie);
        User userOnline =(User) request.getSession().getAttribute("CURRENT_USER");
        if(userOnline!=null){
            response.sendRedirect("homeServlet");
        }else {
            response.sendRedirect("mainServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
