package com.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/homeServlet")
public class homeServlet extends HttpServlet {
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

        request.getRequestDispatcher("/homePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
