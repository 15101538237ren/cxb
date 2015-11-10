package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import entity.Student;

public class AjaxAction extends BaseAction{
	
	private String name;
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String findStudent() {
		HttpServletRequest request = ServletActionContext.getRequest();
		//System.out.println(request.getParameter("number"));
		
		List students = this.getAllService().getStudentService().getAllDAO().getStudentDAO().findBySXh(request.getParameter("number"));
		if(!students.isEmpty())
			name = ((Student)students.get(0)).getSXm();
		else
			name = "";
		//System.out.println(name);
		
		return SUCCESS;
	}
}
