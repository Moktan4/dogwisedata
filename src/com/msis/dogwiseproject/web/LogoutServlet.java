package com.msis.dogwiseproject.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;  
public class LogoutServlet extends HttpServlet {  
        protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException {  
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
            request.getSession().removeAttribute("name");
            request.getSession().invalidate();  
            response.sendRedirect("content/admin.jsp");
            	out.println("<script type=\"text/javascript\">");
			   out.println("alert('You are successfully logged out!');");
			   out.println("location='content/admin.jsp';");
			   out.println("</script>");
           
             
              
            out.close();  
    }  
}  