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

		public void doPost(HttpServletRequest request, HttpServletResponse response)
		   throws ServletException,IOException{
		 
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String name=request.getParameter("username");
			String pass=request.getParameter("userpass");
		  
			HttpSession session = request.getSession(false);
		  if(session!=null){
			  session.setAttribute("name", name);
		  }
		 
		  
		  if (AdminLoginDAO.validate(name, pass)){
			  System.out.println("Validated");
			  RequestDispatcher rd = request.getRequestDispatcher("content/admintask.jsp");
			  rd.forward(request, response);
		  }else{
			  request.setAttribute("error", "Invalid Username or Password");
			  RequestDispatcher rd = request.getRequestDispatcher("content/admin.jsp");
			  rd.forward(request, response);
			    
		  }
		  out.close();  
		}
		

}
