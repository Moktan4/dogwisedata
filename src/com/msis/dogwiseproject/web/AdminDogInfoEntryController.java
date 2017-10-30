package com.msis.dogwiseproject.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.msis.dogwiseproject.model.DogBean;

	@WebServlet("/adminServlet")
	public class AdminDogInfoEntryController extends HttpServlet {
		
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		private DogBean dogBean;
		private static String ADMIN_DOG_LIST = "content/admindoglist.jsp";
		

		public AdminDogInfoEntryController() {
			super();
			dogBean=new DogBean();
			
		}

		protected void doGet(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {	
			String forward = ADMIN_DOG_LIST;
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		}

		protected void doPost(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			//String pageName = request.getParameter("pageName");
			String forward = "";	
			if (dogBean != null) {
				String dogID= request.getParameter(dogBean.getDogID());
				String dogName= request.getParameter(dogBean.getDogName());
				String roomNumber= request.getParameter(dogBean.getRoomNumber());
				String dogStatus= request.getParameter(dogBean.getDogStatus());
				String fileName = request.getParameter("file");
				
				dogBean.save(dogID,
						dogName,
						roomNumber,
						dogStatus, fileName);
				
			}
		
			
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		}
	}