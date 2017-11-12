package com.msis.dogwiseproject.web;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.msis.dogwiseproject.model.VolunteerDao;

public class DogWiseDataController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VolunteerDao volunteerDao;
	private static String DOGWISE_FORM = "content/dogwiseform.jsp";
	
	private static String ADMIN_LOGIN="content/admin.jsp";

	public DogWiseDataController() {
		super();
		volunteerDao=new VolunteerDao();
		
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
		String forward = DOGWISE_FORM;
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("select")){
			int dogID=Integer.parseInt(request.getParameter("dogID"));
			volunteerDao.select(dogID);
			forward=DOGWISE_FORM;
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//String pageName = request.getParameter("pageName");
		String forward = "";	
		if (volunteerDao != null) {
			
			boolean potty1= Boolean.parseBoolean(request.getParameter("potty"));
			boolean exercise= Boolean.parseBoolean(request.getParameter("exercise"));
			boolean training= Boolean.parseBoolean(request.getParameter("training"));
			volunteerDao.save(
					request.getParameter("datetimepicker"),
					potty1,
					exercise,
					training);
			
		}
	
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
	public static String toStringYesNo(boolean bool) {
	      return toString(bool, "yes", "no");
	  }
	 public static String toString(boolean bool, String trueString, String falseString) {
	      return bool ? trueString : falseString;
	  }
}

