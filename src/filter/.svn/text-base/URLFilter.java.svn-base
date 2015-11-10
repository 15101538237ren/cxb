package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import util.PrivilegeHelper;

public class URLFilter implements Filter {
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
	    HttpServletResponse response = (HttpServletResponse) servletResponse;
	    String uri = request.getServletPath();
		String lastStr = uri.substring(uri.lastIndexOf("/")+1);
		if(lastStr.endsWith(".jsp") && !lastStr.endsWith("home.jsp")){
		   response.setContentType("text/html;charset=UTF-8");
		   response.setCharacterEncoding("UTF-8");
		   PrintWriter out = response.getWriter();
		   //out.println(PrivilegeHelper.noUrl(""));;
	       out.flush();
	       out.close();
	       return;
		}
	    filterChain.doFilter(servletRequest, servletResponse);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
}