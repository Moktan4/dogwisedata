package com.msis.dogwiseproject.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.msis.dogwiseproject.dao.DogAdminDao;
import com.msis.dogwiseproject.model.DogBean;


	public class AdminDogInfoEntryController extends HttpServlet {
		
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		private DogAdminDao dogDao;
		private static String ADMIN_DOG_LIST = "content/admindoglist.jsp";
		private static String ADMIN_TASK="content/admintask.jsp";

		public AdminDogInfoEntryController() {
			super();
			dogDao=new DogAdminDao();
			
		}

		protected void doGet(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {	
			String action = request.getParameter("action");
			
			if(action.equalsIgnoreCase("delete")){
				int dogID=Integer.parseInt(request.getParameter("dogID"));
				dogDao.delete(dogID);
				response.sendRedirect("content/admintask.jsp");
			}else{
			response.sendRedirect(ADMIN_DOG_LIST);
			}
		}

		protected void doPost(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			
			response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
			int dogID=Integer.valueOf((request.getParameter("dogID")));
					
			System.out.println(dogDao.getAllDogs());
			//DogBean db = new DogBean();	
			
			DogBean db = new DogBean();	
			db.setDogID(dogID);
			db.setDogName(request.getParameter("dogName"));
			db.setRoomNumber(request.getParameter("roomNumber"));
			db.setDogStatus(request.getParameter("dogStatus"));
			db.setUploadFile(request.getParameter("uploadFile"));
			
			for(DogBean dog:dogDao.getAllDogs()){
				System.out.println(dog.getDogID());
				//System.out.println(dogID.equals(dog.getDogID()));
				
			if(dog.getDogID()==(dogID)){
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('This dog ID exists already.');");
			   out.println("location='content/admindoglist.jsp';");
			   out.println("</script>");
				
			}else{
				
				dogDao.save(db);
				System.out.println("I cam here");
					
			}
				
			}
			
			response.sendRedirect(ADMIN_TASK);
		}

		
		 
	}