package com.msis.dogwiseproject.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.msis.dogwiseproject.backend.MyJDBCConnection;
import com.mysql.cj.api.jdbc.Statement;

public class AdminLogin extends HttpServlet{ 
		 public void doPost(HttpServletRequest request, HttpServletResponse response)
		   throws ServletException,IOException{
		  response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		 String username="";
		 String userpass="";
		 String strQuery= ""; 
		  java.sql.Statement st=null;
		  ResultSet rs=null;
		  HttpSession session = request.getSession(true);
		  if(request.getParameter("username")!=null &&
		     request.getParameter("username")!="" && request.getParameter("password")!=null &&
		     request.getParameter("password")!="")
		  {
		  username = request.getParameter("username").toString();
		  userpass = request.getParameter("password").toString();
		  strQuery="select * from admin where username='"+username+"' and  password='"+userpass+"'";
		 System.out.println(strQuery);
		  try {
			st = MyJDBCConnection.getConnection().createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			rs = st.executeQuery(strQuery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  int count=0;
		  try {
			while(rs.next())
			  {
			  session.setAttribute("username",rs.getString(2));
			  count++;
			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  if(count>0)
		  {
		  response.sendRedirect("admintask.jsp");
		  }
		  else
		  {
		 response.sendRedirect("admin.jsp");
		  }
		  }
		  else
		  {
		 response.sendRedirect("admin.jsp");
		  }
		  }
		

}
