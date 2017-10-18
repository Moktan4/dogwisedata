package com.msis.dogwiseproject.web;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.msis.dogwiseproject.model.VolunteerBean;

@WebServlet("/dogwiseJDBCServlet")
public class DogWiseDataController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VolunteerBean volunteerBean;
	private static String DOGWISE_FORM = "content/dogwiseform.jsp";

	public DogWiseDataController() {
		super();
		volunteerBean=new VolunteerBean();
		
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
		String forward = DOGWISE_FORM;
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//String pageName = request.getParameter("pageName");
		String forward = "";	
		if (volunteerBean != null) {
			
boolean potty1= Boolean.parseBoolean(request.getParameter("potty"));
boolean exercise= Boolean.parseBoolean(request.getParameter("exercise"));
boolean training= Boolean.parseBoolean(request.getParameter("training"));
			volunteerBean.save(
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

