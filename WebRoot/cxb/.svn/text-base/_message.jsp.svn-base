<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link rel="stylesheet" type="text/css" href="../css/global.css" />
<link rel="stylesheet" type="text/css" href="../css/uploadify.css"/>
<script type="text/javascript" src="../js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript" src="../js/swfobject.js"></script>
<script type="text/javascript" src="../js/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
	    <%-- 显示错误信息 --%>
	    showBackMsg();
	});
</script>

<style>
#msgDiv{ 
	position:absolute; top:200px; left:50%;
	margin-left:-270px;display:none; width:540px;
	font-weight:bold; font-size:14px; 
	text-align:center;background: #e5ffc4; color:#3A6800;
	border:1px solid #80E500; line-height:25px;
}
#errorDiv{
	position:absolute; top:200px; left:50%; 
	margin-left:-270px;display:none; width:540px; 
	font-weight:bold; font-size:14px; text-align:center;
	background: #fff3f3; color:#cc0000; border:1px solid red;
	line-height:25px; 
	padding-bottom:12px;
}
</style>

<s:if test="message!=null&&!message.equals('')">
	<div id="msgDiv"><s:property value="%{message}"/></div>
</s:if>
<s:if test="error!=null&&!error.equals('')">
	<div id="errorDiv"><s:property value="%{error}"/></div>
</s:if>