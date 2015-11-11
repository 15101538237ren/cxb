<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />

		<link href="/cxb/css/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/cxb/css/docs.css" rel="stylesheet">
		<script type="text/javascript" src="/cxb/js/jquery.min.js"></script>
		<script type="text/javascript" src="/cxb/js/common.js"></script>
		
		<script type="text/javascript" src="/cxb/js/jquery.validate.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-transition.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-alert.js"
			charset="utf-8"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-modal.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-dropdown.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-scrollspy.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-tab.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-tooltip.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-popover.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-button.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-collapse.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-carousel.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-typeahead.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap.min.js"></script>
		<script>
	$("#mymodal").modal({
		show : false
	});
</script>

		<script type="text/javascript">
	var vBundle = {
		rules : {
			projectType : "required",
			name : "required",
			newIdea : "required",
			difficult : "required",
			telephone : "required",
			email : {
				required : true,
				email : true
			},
			secondNumber : "required",
			thirdNumber : "required"
		},
		messages : {
			projectType : "此项为必填项",
			name : "此项为必填项",
			newIdea : "此项为必填项",
			difficult : "此项为必填项",
			telephone : "此项为必填项",
			email : {
				required : "此项为必填项",
				email : "电子邮件格式不正确"
			},
			secondNumber : "此项为必填项",
			thirdNumber : "此项为必填项"
		}
	};

	$(document).ready(
			function() {
				$("#secondNumber").change(
						function() {
							if ($("#secondNumber").val() != null
									&& $("#secondNumber").val() != "") {
								$.getJSON("../ajax/findStudent.action", {
									number : $("#secondNumber").val()
								},
										function(data) {
											if (data["name"] == null
													|| data["name"] == "") {
												$("#name2").html("姓名：");
												$("#warning2").html(
														"该学号不存在，请检查输入是否正确");
											} else {
												$("#warning2").html("");
												$("#name2").html("姓名：");
												$("#name2")
														.append(data["name"]);
											}
										});
							} else {
								$("#warning2").html("");
								$("#name2").html("姓名：");
							}
						});

				$("#thirdNumber").change(
						function() {
							if ($("#thirdNumber").val() != null
									&& $("#thirdNumber").val() != "") {
								$.getJSON("../ajax/findStudent.action", {
									number : $("#thirdNumber").val()
								},
										function(data) {
											if (data["name"] == null
													|| data["name"] == "") {
												$("#name3").html("姓名：");
												$("#warning3").html(
														"该学号不存在，请检查输入是否正确");
											} else {
												$("#warning3").html("");
												$("#name3").html("姓名：");
												$("#name3")
														.append(data["name"]);
											}
										});
							} else {
								$("#warning3").html("");
								$("#name3").html("姓名：");
							}
						});
						
});

function showorNot()
{
	$selected=$("#teacherproject_select").children('option:selected');
	if ($selected.val()!="0")
	{
		$("#project_name").hide();
		
		$("#name").val($selected.text());
		$selected_text=$selected.text();
		$index=$selected_text.indexOf("-");
		if ($index>-1)
		{
			$str=$selected_text.substr($index+1,$selected_text.length);
			$("#teacherName").each(function(){
				$('option',$(this)).each(function(){
					if($(this).val()==$str)
					{
						$(this).attr("selected","selected");
						$("#teacherName").attr("disabled","disabled");
					}
				});
			});
			$("#teacherNametxt").val($str);
		}
		
	}
	else
	{
		$("#project_name").show();
		$("#name").val("");
		$("#teacherNametxt").val("无");
		$("#teacherName").removeAttr("disabled");
	}
}
function teacherChange()
{
	$selected=$("#teacherName").children('option:selected');
	$("#teacherNametxt").val($selected.text());
}
</script>

		<title>参赛报名</title>
	</head>

	<body data-spy="scroll" data-target=".bs-docs-sidebar">

		<div class="container">
			<jsp:include page="/cxb/topmenu/menu.jsp"></jsp:include>
			<header style="text-align: center;">
				<h3>
					新建项目
				</h3>
			</header>

			<s:form class="form-horizontal" action="new" namespace="/project"
				name="projectFrm" id="projectFrm">

				<input type="hidden" name="id" value="${project.PId}" />
				<input type="hidden" id="authorLimit" name="authorLimit"
					value="${authorLimit}" />

				<div class="row">
					<div class="span12">
						<div class="row">
							<div class="span6">
								<legend>
									填写项目基本信息
								</legend>
								<div class="control-group">
									<label class="control-label" for="projectType">
										申报项目类型
									</label>
									<div class="controls">
										<s:select name="projectType" value="#session.project.kind" list="{'科技发明制作类'}" headerKey="" headerValue="--请选择--" placeholder="必填">
											</s:select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="name">
										项目名称
									</label>
									
									<div class="controls">
											<select id="teacherproject_select" class="controls span6" onchange="showorNot()" >
											<option value ="0" selected="selected">自主命题</option>
											<option value ="1">基于声纹和位置信息的签到APP设计-宋友</option>
											<option value ="2">基于声纹等身份特征识别的（移动、物联网）安全应用设计-宋友</option>
											<option value ="3">盲人智能交互App的设计与实现-宋友</option>
											<option value ="4">光线变化情况下的颜色识别改善方案-宋友</option>
											<option value ="14">城市交通车流量统计APP的设计与实现-杜孝平</option>
											<option value ="15">城市轨道交通站客流量统计软硬件设计与实现-杜孝平</option>
											<option value ="16">基于图形图像特征的敏感文字信息提取-邵兵</option>
											<option value ="17">移动端无线WiFi侦测及位置分析软件-邵兵</option>
											<option value ="9">手持式虹膜采集仪-王海泉</option>
											<option value ="10">食物热量自动检测-王海泉</option>
											<option value ="11">出游日记/游记-王海泉</option>
											<option value ="12">麻将胡牌后自动计算-王海泉</option>
											<option value ="13">二手货估价-王海泉</option>
											<option value ="5">基于领域模型的业务表单框架-林广艳</option>
											<option value ="6">基于OpenXML的富文本生成和处理工具-谭火彬</option>
											<option value ="7">UML模型检测和分析工具-谭火彬</option>
											<option value ="8">软件库分析平台-谭火彬</option>
											</select>
											<div id="project_name">
												<input type="text" id="name" name="name" class="span6" placeholder="必填">
											</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="teacherName">
										指导老师
									</label>
									<div class="controls">
										<select id="teacherName" name="teacherName2" class="controls span6" onchange="teacherChange()" >
										<option value ="无" selected="selected">无</option>
										<option value ="宋友">宋友</option>
										<option value ="杜孝平">杜孝平</option>
										<option value ="杜孝平">杜孝平</option>
										<option value ="邵兵">邵兵</option>
										<option value ="林广艳">林广艳</option>
										<option value ="谭火彬">谭火彬</option>
										<option value ="王海泉">王海泉</option>
										<option value ="吕云翔">吕云翔</option>
										<option value ="原仓周">原仓周</option>
										<option value ="贾经冬">贾经冬</option>
										<option value ="申雪萍">申雪萍</option>
										<option value ="贾经冬">贾经冬</option>
										<option value ="王华峰">王华峰</option>
										</select>
										<input style="display:none" type="text" id="teacherNametxt" name="teacherName" class="span6" placeholder="必填">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="newIdea">
										项目创新点
									</label>
									<div class="controls">
										<textarea rows="3" class="span6" id="newIdea" name="newIdea" placeholder="必填"></textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="difficult">
										技术难点
									</label>
									<div class="controls">
										<textarea rows="4" class="span6" id="difficult"
											name="difficult" placeholder="必填"></textarea>
										<em id="warningDifficult"></em>
									</div>
								</div>
							</div>
							<div class="span6">
								<legend>
									团队成员信息
								</legend>
								<table id="table" class="table table-bordered">
									<tr>
										<td rowspan="4">
											第一作者
										</td>
										<td>
											学号：
											<s:property value="#session.student.SXh" />
										</td>
									</tr>
									<tr>
										<td>
											姓名：
											<s:property value="#session.student.SXm" />
										</td>
									</tr>
									<tr>
										<td>
											手机：
											<input type="text" id="telephone" name="telephone"
												value="${session.student.SSjh}" />
											<em id="warningTelephone"></em>
										</td>
									</tr>
									<tr>
										<td>
											邮箱：
											<input type="text" id="email" name="email"
												value="${session.student.SYx}" />
											<em id="warningEmail"></em>
										</td>
									</tr>

									<tr>
										<td rowspan="1">
											第二作者
										</td>
										<td>
											学号：
											<input class="ignore" type="text" id="secondNumber" name="secondNumber"
												value="${secondNumber}" />
											<em id="warning2"></em>
										</td>
									</tr>
									<%--									<tr>--%>
									<%--										<td id="name2">--%>
									<%--											姓名：--%>
									<%--											<c:out value="${secondName}" />--%>
									<%--										</td>--%>
									<%--									</tr>--%>
									<tr>
										<td rowspan="1">
											第三作者
										</td>
										<td>
											学号：
											<input class="ignore" type="text" id="thirdNumber" name="thirdNumber"
												value="${thirdNumber}" />
											<em id="warning3"></em>
										</td>
									</tr>
									<%--									<tr>--%>
									<%--										<td id="name3">--%>
									<%--											姓名：--%>
									<%--											<c:out value="${thirdName}" />--%>
									<%--										</td>--%>
									<%--									</tr>--%>
									<s:if test="%{authorLimit>3}">
										<tr colspan="2" id="fourthAuthor">
											<td>
												<a href="#" onclick="addFourthAuthor()">点击添加第四作者</a>
											</td>
										</tr>
									</s:if>
								</table>
								<div class="btnDiv">
									<input type="button" class="btn btn-primary offset4" value="提交"
										onclick="submitFrm('projectFrm')" />
									<input type="button" class="btn btn-inverse" value="放弃"
										onclick="window.history.go(-1)" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</s:form>
		</div>

		<!-- Le javascript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->

	</body>
</html>