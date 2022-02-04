package com.servlets;

import com.tools.DBManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/deleteNews")
public class deleteNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        if(DBManager.deleteNewsContent(id)){
            response.sendRedirect("/manageNewsPage?success");
        }else {
            response.sendRedirect("/manageNewsPage?error");
        }
    }
}
