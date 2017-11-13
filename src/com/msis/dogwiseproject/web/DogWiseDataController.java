package com.msis.dogwiseproject.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.msis.dogwiseproject.model.VolunteerDao;
import com.msis.dogwiseproject.model.VolunteerModel;

public class DogWiseDataController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VolunteerDao volunteerDao;
	private static String DOGWISE_FORM = "content/dogwiseform.jsp";

	private static String ADMIN_LOGIN = "content/admin.jsp";

	public DogWiseDataController() {
		super();
		volunteerDao = new VolunteerDao();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forward = DOGWISE_FORM;
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("select")) {
			int dogID = Integer.parseInt(request.getParameter("dogID"));
			volunteerDao.select(dogID);
			forward = DOGWISE_FORM;
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// String pageName = request.getParameter("pageName");
		String forward = "";
		VolunteerModel vm = new VolunteerModel();
		vm.setInitials(request.getParameter("initials")!=null?request.getParameter("initials"):"");
		vm.setPotty((request.getParameter("potty")!=null?request.getParameter("potty"):""));
		vm.setExercise((request.getParameter("exercise")!=null?request.getParameter("exercise"):""));
		vm.setTraining((request.getParameter("training")!=null?request.getParameter("training"):""));
		vm.setTimeLength(Integer.valueOf(request.getParameter("timeLength"))!=null? Integer.valueOf(request.getParameter("timeLength")):null);
		vm.setParkPlay(request.getParameter(("parkPlay")!=null?request.getParameter(("parkPlay")):""));
		vm.setFetch(request.getParameter(("fetch"))!=null?request.getParameter(("fetch")):"");
		vm.setTug(request.getParameter("tug")!=null?request.getParameter("tug"):"");
		vm.setPlayGroups(request.getParameter("playGroups")!=null?request.getParameter("playGroups"):"");
		vm.setTimeLength1(request.getParameter("timeLength1")!=""?Integer.parseInt(request.getParameter("timeLength1")):null);
		vm.setInroom(request.getParameter("inroom")!=null?request.getParameter("inroom"):"");
		vm.setOutsideroom(request.getParameter("outsideroom")!=null?request.getParameter("outsideroom"):"");
		vm.setTimeLength2(request.getParameter("timeLength2")!=""?Integer.parseInt(request.getParameter("timeLength2")):null);
		vm.setSit(request.getParameter("sit")!=null?request.getParameter("sit"):"");
		vm.setDown(request.getParameter("down")!=null?request.getParameter("down"):"");
		vm.setStand(request.getParameter("stand")!=null?request.getParameter("stand"):"");
		vm.setWatch(request.getParameter("watch")!=null?request.getParameter("watch"):"");
		vm.setPeoplefoodgood(request.getParameter("peoplefoodgood")!=null?request.getParameter("peoplefoodgood"):"");
		vm.setPolitegreeting(request.getParameter("politegreeting")!=null?request.getParameter("politegreeting"):"");
		vm.setStaySettle(request.getParameter("staySettle")!=null?request.getParameter("staySettle"):"");
		vm.setLeavetakethanks(request.getParameter("leavetakethanks")!=null?request.getParameter("leavetakethanks"):"");
		vm.setKongtraining(request.getParameter("kongtraining")!=null?request.getParameter("kongtraining"):"");
		vm.setCratetraining(request.getParameter("cratetraining")!=null?request.getParameter("cratetraining"):"");
		vm.setOther(request.getParameter("other")!=null?request.getParameter("other"):"");
		vm.setOtherInfo(request.getParameter("otherInfo")!=null?request.getParameter("otherInfo"):"");
		vm.setParagraph_text(request.getParameter("paragraph_text")!=null?request.getParameter("paragraph_text"):"");
		vm.setSuccesses(request.getParameter("successes")!=null?request.getParameter("successes"):"");
		vm.setChallenges(request.getParameter("challenges")!=null?request.getParameter("challenges"):"");
		volunteerDao.save(vm);

		RequestDispatcher view = request.getRequestDispatcher(DOGWISE_FORM);
		view.forward(request, response);
	}
}
