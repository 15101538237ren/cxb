package controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import entity.Student;
import service.LoginService;

public class LoginAction extends BaseAction{
	private String message;
	private String error;
	private Student student;
	private String username;
	private String password;//密码
	
	private String newPassword;
	private LoginService loginService;
	
	final int authorLimit = 5;
	
	
	public int getAuthorLimit() {
		return authorLimit;
	}

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

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

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	//完成页面的跳转，跳转到登录页面
	public String login() throws Exception{
		
		return SUCCESS;
	}
	
	//做实际的登录工作
	public String doLogin() throws Exception{
		Map session = ActionContext.getContext().getSession();
		
		if(username == null || username.equals("")){
			error = "请输入用户名";
			return INPUT;
		}
		if(password == null || password.equals("")){
			error = "请输入密码";
			return INPUT;
		}
		
		List<Student> l = null;
		try {
			l = this.getAllService().getLoginService().getAllDAO().getStudentDAO().findBySXh(username);
		} catch (Exception e) {
			log.error("获取学生信息失败。", e.getMessage());
			return INPUT;
		}
		
		if(l == null || l.isEmpty()){
			error = "该用户账号不存在或已被冻结";
			return INPUT;
		}
		Student student = l.get(0);
		if(student.getSPwd() == null){
			error = "您的账号没有设置密码，请联系系统管理员设置密码";
			return INPUT;
		}
		else if(!student.getSPwd().equals(password)){
			error = "您输入的登录信息有误";
			return INPUT;
		}
		session.clear();
		
		session.put("student", student);
		
				
		return SUCCESS;
	}
	
	public String logout() throws Exception{
		Map session = ActionContext.getContext().getSession();
		session.remove("student");
		session.remove("project");
		//System.out.println("您已经登出系统，" + DateFormat.getDateInstance().format(new Date()));
		return SUCCESS;
	}
}
