package com.servlets;

import com.tools.Comment;
import com.tools.DBManager;
import com.tools.NewsCategory;
import com.tools.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/addComment")
public class addCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        String comment = request.getParameter("comment");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Long userId = user.getId();
        Long newsId = Long.parseLong(request.getParameter("newsId"));
        Comment c = new Comment(null, comment, timestamp, userId, newsId);
        DBManager.addComment(c);
        response.sendRedirect("/newsPage");
    }
}
