package com.servlets;

import com.tools.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/editNewsPage")
public class editNewsPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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


        request.getSession().getAttribute("CURRENT_USER");

        Long id = Long.parseLong(request.getParameter("id"));
        News news = DBManager.getNewsById(id);
        request.setAttribute("news", news);
        NewsContent newsContent = DBManager.getNewsContent(id);
        request.setAttribute("content", newsContent);
        ArrayList<NewsCategory> newsCategories = DBManager.getCategories();
        request.setAttribute("categories", newsCategories);
        ArrayList<Language> languages = DBManager.getLanguages();
        request.setAttribute("languages", languages);
        request.getRequestDispatcher("/editNewsPage.jsp").forward(request,response);
    }
}
