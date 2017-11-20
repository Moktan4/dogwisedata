package com.msis.dogwiseproject.web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.msis.dogwiseproject.backend.MyJDBCConnection;
import com.msis.dogwiseproject.model.VolunteerDao;
import com.msis.dogwiseproject.model.VolunteerModel;

@WebServlet("/DogWiseDataController")
public class DogWiseDataController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VolunteerDao volunteerDao;
	private static String DOGWISE_FORM = "content/dogprofilelogs.jsp";

	private static String ADMIN_LOGIN = "content/admindoglist.jsp";

	public DogWiseDataController() {
		super();
		volunteerDao = new VolunteerDao();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArrayList<VolunteerModel> vm=new ArrayList<VolunteerModel>();
		vm=MyJDBCConnection.getAllData();
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(vm, new TypeToken<List<VolunteerModel>>() {}.getType());

		JsonArray jsonArray = element.getAsJsonArray();
		response.setContentType("application/json");
		response.getWriter().print(jsonArray);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// String pageName = request.getParameter("pageName");
		 DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm");
		    Date dateobj = new Date();
		    System.out.println(df.format(dateobj));

		    /*getting current date time using calendar class 
		     * An Alternative of above*/
		    Calendar calobj = Calendar.getInstance();
		    System.out.println(df.format(calobj.getTime()));
		String timeStamp = df.format(calobj.getTime());
		String forward = "";
		VolunteerModel vm = new VolunteerModel();
		vm.setFullname(request.getParameter("fullname")!=null?request.getParameter("fullname"):"");
		vm.setDatetimepicker(timeStamp);
		vm.setPotty((request.getParameter("potty")!=null?request.getParameter("potty"):""));
		vm.setExercise((request.getParameter("exercise")!=null?request.getParameter("exercise"):""));
		vm.setTraining((request.getParameter("training")!=null?request.getParameter("training"):""));
		vm.setTimeLength((request.getParameter("timeLength"))!=null?(request.getParameter("timeLength")):"");
		vm.setParkPlay(request.getParameter("parkPlay")!=null?request.getParameter(("parkPlay")):"");
		vm.setFetch(request.getParameter(("fetch"))!=null?request.getParameter(("fetch")):"");
		vm.setTug(request.getParameter("tug")!=null?request.getParameter("tug"):"");
		vm.setPlayGroups(request.getParameter("playGroups")!=null?request.getParameter("playGroups"):"");
		vm.setTimeLength1(request.getParameter("timeLength1")!=""?(request.getParameter("timeLength1")):"");
		vm.setInroom(request.getParameter("inroom")!=null?request.getParameter("inroom"):"");
		vm.setOutsideroom(request.getParameter("outsideroom")!=null?request.getParameter("outsideroom"):"");
		vm.setTimeLength2(request.getParameter("timeLength2")!=""?(request.getParameter("timeLength2")):"");
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

		response.sendRedirect(DOGWISE_FORM);
	}
}
