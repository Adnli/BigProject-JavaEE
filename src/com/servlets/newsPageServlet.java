package com.servlets;

import com.tools.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/newsPage")
public class newsPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String language = "";
        if(cookies!=null){
            for (Cookie c : cookies) {
                if (c.getName().equals("language")) {
                    language = c.getValue();
                    break;
                }
            }
        }else{
            Cookie cookieLanguage = new Cookie("language", "eng");
            response.addCookie(cookieLanguage);
            language = cookieLanguage.getValue();
        }
        request.setAttribute("languageString", language);

        ArrayList<NewsCategory> newsCategories = DBManager.getCategories();
        request.setAttribute("categories", newsCategories);
        ArrayList<NewsContent> newsContents = DBManager.getNewsContents();
        request.setAttribute("contents", newsContents);
        ArrayList<News> news = DBManager.getNews();
        request.setAttribute("news", news);
        ArrayList<Comment> comments = DBManager.getComments();
        request.setAttribute("comments", comments);
        User user =(User) request.getSession().getAttribute("CURRENT_USER");
        ArrayList<User> users = DBManager.getUsers();
        request.setAttribute("users", users);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/newsPage.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
