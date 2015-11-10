package util;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

//处理字符串
public class StringUtil {
	
	//去掉url中的参数attr
    public static String removeFromUrl(String url, String attr){
    	String part;
    	if(url.contains(attr+"=")){
    		int fromIndex = url.indexOf(attr+"=");
    		int endIndex = url.indexOf("&", fromIndex);
    		if(endIndex != -1)
    		    part = url.substring(fromIndex, endIndex+1);
    		else if(url.contains("&"+attr+"=")){
    			part = "&" + url.substring(fromIndex);
    		}else{
    			part = url.substring(fromIndex);
    		}
    		url = url.replace(part, "");
    		if(url.indexOf("?") != -1){
	    		if(url.substring(url.indexOf("?")).equals("?")){
	    			url = url.replace("?", "");
	    		}
    		}
    		removeFromUrl(url, attr);
    	}else if(url.endsWith(".action?")){
    		url = url.replace(".action?", ".action");
    	}
    	return url;
    }
    
    public static String currentUrl(){
    	HttpServletRequest request = ServletActionContext.getRequest();
    	String url = request.getRequestURI();
    	if(request.getQueryString() != null){
    		url += "?" + request.getQueryString();
    	}
    	url = removeFromUrl(removeFromUrl(removeFromUrl(url, "message"), "error"), "pageNo");
    	if(url.endsWith(".action") && !url.contains("referer=")){
    		url += "?";
    	}else{
    		url += "&";
    	}
    	return url;
    }
    
    public static boolean isNullOrEmpty(String value){
    	return value == null || value.equals("");
    }

}