package com.servlets;

import com.tools.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

@WebServlet(value = "/editNews")
public class editNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Long categoryId = Long.parseLong(request.getParameter("category"));
        Long newsId = Long.parseLong(request.getParameter("newsId"));
        News news = new News(newsId, null, categoryId);
        DBManager.editNews(news);

        Long contentId = Long.parseLong(request.getParameter("id"));
        Long languageId = Long.parseLong(request.getParameter("language"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        NewsContent newsContent = new NewsContent(contentId, title, content, newsId, languageId);
        if(DBManager.editNewsContent( newsContent)){
            response.sendRedirect("manageNewsPage?success");
        }else {
            response.sendRedirect("manageNewsPage?error");
        }
    }
}
