<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>登录</title>
    <style type="text/css">
    	td {
			font-size: 12px;
			color: #007AB5;
		} 
		form {
			margin: 1px;
			padding: 1px;
		}
		input {
			border: 1px;
			height: 26px;
			width: 70px;
			color: #007AB5;
		}
		body {
			background: #9CDCF9;
		} 
    	.left{
    		background: url(../images/loginLeft.gif) no-repeat;
    		width: 353px;
    		height: 259px;
    	}
    	.center{
    		background: url(../images/loginCenter.gif) no-repeat;
    		width:195px;
    	}
    	.right{
    		background: url(../images/loginRight.gif) no-repeat;
    		width:133px;
    	}
    	.bottom{
    		background: url(../images/loginBottom.gif) no-repeat;
    		height:161px;
    	}
    	.loginBtn{
    		background: url(../images/loginBtn.gif) no-repeat;
    		cursor:pointer;
    	}
    	.inputTxt{
    		border:solid 1px #27B3FE; 
    		height:20px; 
    		width: 118px;
    	}
    </style>
  </head>
  
  <body>
	<div>
		<table width=681 cellspacing=0 cellpadding=0 border=0 align=center style="margin-top:120px;">
			<tr>
				<td class="left" align=center valign=bottom></td>
				<td class="center" >
					<s:form action="doLogin" namespace="/login" method="post">
						<table>
							<tr>
								<td style="font-size:14px; color:red" colspan="2" height=50><s:property value="%{error}" /></td>
							</tr>
							<tr>
								<td width=60 height=30 align=right>用户名：</td>
								<td><input type="text" class="inputTxt" name="username" /></td>
							</tr>
							<tr>
								<td height=30 align=right>密码：</td>
								<td><input type="password" class="inputTxt" name="password" /></td>
							</tr>
							<tr>
								<td colspan="2" align=right><input type="submit" class="loginBtn" value="登录" /></td>
							</tr>
						</table>
					</s:form>
				</td>
				<td class="right">&nbsp;</td>
			</tr>
			<tr>
				<td class="bottom" colspan="3"></td>
			</tr>
		</table>
	</div>
  </body>
</html>