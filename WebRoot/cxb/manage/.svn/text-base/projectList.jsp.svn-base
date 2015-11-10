<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>所有项目列表</title>
  </head>

  <body>
    <div class="listTitle">
		<table cellpadding=0 cellspacing=0 border=0 width=100%>
			<tr>
				<td width=30%>
					<div class="listTitleT"><h5>所有项目列表</h5></div>
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
    </div>
    
    <!-- search -->
	<div class="searchMod">
	<s:form  namespace="/admin" action="search" method="get">
		<table border="0" cellpadding=0 cellspacing=0 width="100%">
			<tr>
				<td class="label">项目名称</td>
	           	<td><s:textfield name="projectName"></s:textfield></td>
			   	<td class="label">年级</td>
	           	<td><s:textfield name="authorGrade"></s:textfield></td>
	           	<td class="label">第一作者学号</td>
	           	<td><s:textfield name="authorID"></s:textfield></td>	  
	           	<td ><input type="submit" class="searchBtn" value="搜索"></input></td>         
	        </tr>
		</table>
	</s:form>
	</div> 
    <div class="createDiv">
	    <table cellpadding=0 cellspacing=0 width=100% border=0>
		<tr>
			<td>
				<h4>所有项目</h4>
			</td>
		</tr>
		</table>
	</div>
	<jsp:include page="/cxb/manage/_list.jsp"></jsp:include>
    <jsp:include page="/cxb/_page.jsp"></jsp:include>
    
  </body>
</html>
