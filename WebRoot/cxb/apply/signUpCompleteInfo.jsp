<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script type="text/javascript" src="/cxb/js/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="/cxb/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/cxb/js/common.js"></script>
    <script type="text/javascript">
      var vBundle = {
		rules:{
			projectType:	"required",
			name:			"required",
			telephone:      "required",
			email:			{required:true,
							 email:true},
			secondNumber:   "required",
			thirdNumber:    "required"
		},
		messages:{
			projectType:	"此项为必填项",
			name:			"此项为必填项",
			telephone:      "此项为必填项",
			email:			{required:"此项为必填项",
							 email:"电子邮件格式不正确"},
			secondNumber:   "此项为必填项",
			thirdNumber:    "此项为必填项"
		}
	  };

	  $(document).ready(function(){
		$("#secondNumber").change(function(){
			if($("#secondNumber").val() != null && $("#secondNumber").val() != ""){
				$.getJSON("../ajax/findStudent.action", {number: $("#secondNumber").val()}, function(data){
					if(data["name"] == null || data["name"] == ""){
						$("#name2").html("姓名：");
						$("#warning2").html("该学号不存在，请检查输入是否正确");
					}else{
						$("#warning2").html("");
						$("#name2").html("姓名：");
						$("#name2").append(data["name"]);
					}
				});
			}else{
				$("#warning2").html("");
				$("#name2").html("姓名：");
			}
		});

		$("#thirdNumber").change(function(){
			if($("#thirdNumber").val() != null && $("#thirdNumber").val() != ""){
				$.getJSON("../ajax/findStudent.action", {number: $("#thirdNumber").val()}, function(data){
					if(data["name"] == null || data["name"] == ""){
						$("#name3").html("姓名：");
						$("#warning3").html("该学号不存在，请检查输入是否正确");
					}else{
						$("#warning3").html("");
						$("#name3").html("姓名：");
						$("#name3").append(data["name"]);
					}
				});
			}else{
				$("#warning3").html("");
				$("#name3").html("姓名：");
			}
		});

		$("#fourthNumber").change(function(){
			if($("#fourthNumber").val() != null && $("#fourthNumber").val() != ""){
				$.getJSON("../ajax/findStudent.action", {number: $("#fourthNumber").val()}, function(data){
					if(data["name"] == null || data["name"] == ""){
						$("#name4").html("姓名：");
						$("#warning4").html("该学号不存在，请检查输入是否正确");
					}else{
						$("#warning4").html("");
						$("#name4").html("姓名：");
						$("#name4").append(data["name"]);
					}
				});
			}else{
				$("#warning4").html("");
				$("#name4").html("姓名：");
			}
		});

		$("#fifthNumber").change(function(){
			if($("#fifthNumber").val() != null && $("#fifthNumber").val() != ""){
				$.getJSON("../ajax/findStudent.action", {number: $("#fifthNumber").val()}, function(data){
					if(data["name"] == null || data["name"] == ""){
						$("#name5").html("姓名：");
						$("#warning5").html("该学号不存在，请检查输入是否正确");
					}else{
						$("#warning5").html("");
						$("#name5").html("姓名：");
						$("#name5").append(data["name"]);
					}
				});
			}else{
				$("#warning5").html("");
				$("#name5").html("姓名：");
			}
		});

	  })

	  function addFourthAuthor() {
		$("#fourthAuthor").html("<td rowspan='2'>第四作者</td><td>学号：<input type='text' id='fourthNumber' name='fourthNumber'/><em id='warning4'></em></td>");
		$("#table").append("<tr><td id='name4'>姓名：</td></tr>");
		if($("#authorLimit").val() > 4){
			$("#table").append("<tr colspan='2' id='fifthAuthor'><td><a href='#' onclick='addFifthAuthor()'>点击添加第五作者</a></td></tr>");
		}
	  }

	  function addFifthAuthor() {
		$("#fifthAuthor").html("<td rowspan='2'>第五作者</td><td>学号：<input type='text' id='fifthNumber' name='fifthNumber'/><em id='warning5'></em></td>");
		$("#table").append("<tr><td id='name5'>姓名：</td></tr>");
	  }
    </script>
    <jsp:include page="/cxb/_message.jsp"></jsp:include>
    <title>参赛报名</title>
  </head>
  
  <body>
    <div class="formDiv">
    	<s:form action="save" namespace="/project" name="projectFrm">
    	    <input type="hidden" name="id" value="${project.PId}" />
			<input type="hidden" id="authorLimit" name="authorLimit" value="${authorLimit}" />
    		<table id="table" border=1 cellpadding=0 cellspacing=0 width=100%>
				<tr>
    				<td width="30%"><b class="star">*</b>申报项目类型</td>
    				<td><s:select name="projectType" value="#session.project.kind" list="{'科技发明制作类','自然科学类学术论文','哲学社会科学类'}" headerKey="" headerValue="--请选择--"></s:select><em></em></td>
    			</tr>
				<tr>
					<td><b class="star">*</b>项目名称</td>
    				<td><input type="text" name="name" value="${project.mc}"/><em></em></td>
    			</tr>
				<tr>
					<td>指导教师</td>
    				<td><input type="text" name="teacherName" value="${teachers}"/></td>
    			</tr>
				<tr>
					<td>项目创新点</td>
    				<td><textArea name="newIdea" style="width:650px;height:100px;">${project.innovation}</textArea></td>
    			</tr>
				<tr>
					<td>技术难点</td>
    				<td><textArea name="difficult" style="width:650px;height:100px;">${project.keyTech}</textArea></td>
    			</tr>
				<tr>
					<td>附件(项目论文、项目展示视频、系统截图等)</td>
    				<td>此处请对照移动阅读系统中书籍上传根据具体情况编写代码</td>
    			</tr>
    			<tr>
    				<td rowspan="4">第一作者</td>
    				<td>学号：<s:property value="#session.student.SXh"/></td>
    			</tr>
				<tr>
    				<td>姓名：<s:property value="#session.student.SXm"/></td>
    			</tr>
    			<tr>
    				<td>手机号：<input type="text" name="telephone" value="${session.student.SSjh}"/><em></em></td>
    			</tr>
				<tr>
    				<td>邮箱：<input type="text" name="email" value="${session.student.SYx}"/><em></em></td>
    			</tr>
				<tr>
    				<td rowspan="2">第二作者</td>
    				<td>学号：<input type="text" id="secondNumber" name="secondNumber" value="${secondNumber}"/><em id="warning2"></em></td>
    			</tr>
				<tr>
    				<td id="name2">姓名：<c:out value="${secondName}"/></td>
    			</tr>
    			<tr>
    				<td rowspan="2">第三作者</td>
    				<td>学号：<input type="text" id="thirdNumber" name="thirdNumber" value="${thirdNumber}"/><em id="warning3"></em></td>
    			</tr>
				<tr>
    				<td id="name3">姓名：<c:out value="${thirdName}"/></td>
    			</tr>
				<s:if test="%{authorLimit>3}">
				<tr colspan="2" id="fourthAuthor"><td><a href="#" onclick="addFourthAuthor()">点击添加第四作者</a></td></tr>
				</s:if>
    		</table>
    		<div class="btnDiv">
		        <input type="button" value="保存" onclick="submitFrm('projectFrm')"/>
		    	<input type="button" value="返回" onclick="window.history.go(-1)" />
		    </div>
    	</s:form>
    </div> 
  </body>
</html>