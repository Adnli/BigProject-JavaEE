package com.servlets;

import com.tools.DBManager;
import com.tools.NewsCategory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/addCategory")
public class addCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        NewsCategory newsCategory = new NewsCategory(null, name);
        DBManager.addCategory(newsCategory);
        response.sendRedirect("/addCategoryPage?success");
    }
}
