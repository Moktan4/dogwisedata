package com.msis.dogwiseproject.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.msis.dogwiseproject.model.AdminLoginDAO;

public class AdminLoginServlet extends HttpServlet{ 
		 /**
	 * 
	 */
	private static final long serialVersionUID = -8273585736474850270L;
	
	

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    		throws ServletException, IOException {


	        String destination = "content/admin.jsp";
	        
	        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
	        rd.forward(request, response);
	    }



		public void doPost(HttpServletRequest request, HttpServletResponse response)
		   throws ServletException,IOException{
		 
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
		
			String name=request.getParameter("username");
			String pass=request.getParameter("userpass");
		  
		
		 
		  if (AdminLoginDAO.validate(name, pass)){
			  HttpSession   session = request.getSession(true);
			  session.setMaxInactiveInterval(30);
			  session.setAttribute("name", name);
			  response.sendRedirect("content/admintask.jsp");
			
		  }else{
			  
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('User or password incorrect');");
			   out.println("location='content/admin.jsp';");
			   out.println("</script>");
			// response.sendRedirect("content/admin.jsp");
			
			  
  	        	
		  }  
		}

}
