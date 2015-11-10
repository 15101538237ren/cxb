package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import entity.Project;
import entity.Student;
import entity.Takeinproject;


public class SignUpAction extends BaseAction {
	private static final String IS_APPLIED = "isApplied";
	private String message;
	private String error;
	
	
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

	//在用户点击“申报项目”时，对用户的项目进行验证
	public String signUp() throws Exception{
		Map session = ActionContext.getContext().getSession();
		if(!session.containsKey("student")){
			return LOGIN;
		}
		Student student = (Student)session.get("student");//得到session中的学生信息
		String hql = "from entity.Takeinproject as t where t.SOrder=1 and t.student.SId = ?) ";
		//String hql = "from entity.Takeinproject as t where t.student.SId = ?";
		List v = new ArrayList();
		v.add(student.getSId());
		List<Takeinproject> instances = this.getAllService().getSignUpService().getAllDAO().getQueryBean().findByHql(hql, v);
		
		//检查项目数量上限
		if(instances.size() >= 1){
			message = "已经达到可以申报的项目上限";
			return IS_APPLIED;
		}

		return SUCCESS;
	}
}
