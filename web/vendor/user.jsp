<%@ page import="com.tools.User" %>
<%
    boolean online = false;
    User userOnline =(User) request.getSession().getAttribute("CURRENT_USER");
    if (userOnline!=null){
        online = true;
    }
%>