package interceptor;

import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import entity.*;
import util.*;

//拦截未登录客户
public class LoginInterceptor extends AbstractInterceptor{
	private static final String LOGIN = "login";
	public String intercept(ActionInvocation ai) throws Exception {
		Map session = ActionContext.getContext().getSession();
		Student s = (Student)session.get("student");
		if(s != null){
			return ai.invoke();
		}
		
		return LOGIN;			
	}
}