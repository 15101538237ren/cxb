package controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import entity.*;
import util.PageUtil;
import util.StringUtil;

/*
 *@author		:betterSoft
 *@writetime	:2011-10-31, 下午03:12:00
 *@Description	:
 *控制“后台用户管理”的逻辑，分配后台用户的权限；
 *查看项目的报名情况，对项目进行增删改查、统计报名数量。
 */
public class AdminAction extends BaseAction{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String message;
	private String error;
	private PageUtil pageBean;

	
	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public String getError() {
		return error;
	}


	public void setError(String error) {
		this.error = error;
	}


	public PageUtil getPageBean() {
		return pageBean;
	}


	public void setPageBean(PageUtil pageBean) {
		this.pageBean = pageBean;
	}


	public String listAllProjects(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("actionName", StringUtil.currentUrl());
		//request.setAttribute("isForList", "true");
		
		pageBean = this.getAllService().getProjectService().seekHqlForList(request);
		
		return SUCCESS;
	}
	
	//搜索项目，根据项目名称模糊搜索项目，按年级搜索项目，按学号模糊搜索项目。
	public String searchProjects(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String projectName = request.getParameter("projectName"); //得到项目名称
		String authorGrade = request.getParameter("authorGrade"); //得到要搜索作者的年级
		String authorID = request.getParameter("authorID"); //得到学生学号
		
		
		//2008年-2021年，包括2008且包括2021
		String pattern = "^(200[8-9]|201[0-9]|202[01])$";		
		
		request.setAttribute("actionName", StringUtil.currentUrl());			
		pageBean = this.getAllService().getProjectService().seekHql(request);
		return SUCCESS;
	}
	
	//根据项目的ID，显示该项目的详细信息
	public String singleShow(){
		
		return SUCCESS;
	}
	
	public String publishNotice(){
		return SUCCESS;
	}
}
