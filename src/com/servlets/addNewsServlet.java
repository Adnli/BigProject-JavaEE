package com.servlets;

import com.tools.DBManager;
import com.tools.News;
import com.tools.NewsContent;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/addNews")
public class addNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Long categoryId = Long.parseLong(request.getParameter("category"));
        Timestamp time = new Timestamp(System.currentTimeMillis());
        News news = new News(null, time, categoryId);
        DBManager.addNews(news);
        Long newsId = DBManager.getNewsId();
        Long languageId = Long.parseLong(request.getParameter("language"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        NewsContent newsContent = new NewsContent(null, title, content, newsId, languageId);
        if(DBManager.addNewsContent(newsContent)){
            response.sendRedirect("addNewsPage?success");
        }else {
            response.sendRedirect("addNewsPage?error");
        }
    }
}
