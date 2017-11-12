package com.msis.dogwiseproject.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import com.msis.dogwiseproject.dao.DogAdminDao;
import com.msis.dogwiseproject.model.DogBean;


	public class AdminDogInfoEntryController extends HttpServlet {
		
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		private DogAdminDao dogDao;
		private static String ADMIN_DOG_LIST = "content/admintask.jsp";
		

		public AdminDogInfoEntryController() {
			super();
			dogDao=new DogAdminDao();
			
		}

		protected void doGet(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {	
			String forward = "";
			String action = request.getParameter("action");
			
			if(action.equalsIgnoreCase("delete")){
				int dogID=Integer.parseInt(request.getParameter("dogID"));
				dogDao.delete(dogID);
				forward=ADMIN_DOG_LIST;
				request.setAttribute("doglist", dogDao.getAllDogs());
			}else if(action.equalsIgnoreCase("dogs")){
				forward=ADMIN_DOG_LIST;
				request.setAttribute("doglist", dogDao.getAllDogs());
			}else{
				forward=ADMIN_DOG_LIST;
			}
			
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		}

		protected void doPost(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			String forward = "";
				DogBean db = new DogBean();	
			
				Integer dogID=Integer.valueOf((request.getParameter("dogID")));
				db.setDogID(dogID);
				db.setDogName(request.getParameter("dogName"));
				db.setRoomNumber(request.getParameter("roomNumber"));
				db.setDogStatus(request.getParameter("dogStatus"));
				db.setUploadFile(request.getParameter("uploadFile"));

				dogDao.save(db);
				
			
			RequestDispatcher view = request.getRequestDispatcher(ADMIN_DOG_LIST);
			view.forward(request, response);
		}
		 
	}