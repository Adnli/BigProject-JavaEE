package com.servlets;

import com.tools.DBManager;
import com.tools.NewsCategory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/editCategoryPage")
public class editCategoryPageServlet extends HttpServlet {
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

        Long id = Long.valueOf(request.getParameter("id"));
        NewsCategory nc = DBManager.getCategory(id);
        request.setAttribute("newsCategory", nc);
        request.getRequestDispatcher("/editCategoryPage.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
