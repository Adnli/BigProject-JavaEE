package com.servlets;

import com.tools.DBManager;
import com.tools.NewsCategory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/editCategory")
public class editCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        NewsCategory newsCategory = new NewsCategory(id, name);
        DBManager.editCategory(newsCategory);
        response.sendRedirect("/addCategoryPage?success");
    }
}
