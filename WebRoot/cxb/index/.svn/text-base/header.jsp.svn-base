<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../css/global.css">
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
       function logout(){
		  if(confirm("您确定要退出系统吗？"))
		      top.location.href = '<s:url action="logout" namespace="/managerLogin"/>';    
	   }
    </script>
  </head>
  <body class="rheaderBody">
	  <div>
	    <div>&nbsp;</div>
	    <div>
			<div style="float:left;padding-top:10px"></div>
			<div class="rheader">
				<span>当前登录用户:<s:property value="#session.manager.realName"/></span>
				<span>&nbsp;</span>
				<span><a href="javascript:void(0)" onclick="logout()">退出系统</a></span>
			</div>
		</div>
	  </div>
  </body>
</html>