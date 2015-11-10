<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />

		<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="../css/docs.css" rel="stylesheet">
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../js/common.js"></script>
		
		<script type="text/javascript" src="../js/jquery.validate.js"></script>
		<script type="text/javascript" src="../js/bootstrap-transition.js"></script>
		<script type="text/javascript" src="../js/bootstrap-alert.js"
			charset="utf-8"></script>
		<script type="text/javascript" src="../js/bootstrap-modal.js"></script>
		<script type="text/javascript" src="../js/bootstrap-dropdown.js"></script>
		<script type="text/javascript" src="../js/bootstrap-scrollspy.js"></script>
		<script type="text/javascript" src="../js/bootstrap-tab.js"></script>
		<script type="text/javascript" src="../js/bootstrap-tooltip.js"></script>
		<script type="text/javascript" src="../js/bootstrap-popover.js"></script>
		<script type="text/javascript" src="../js/bootstrap-button.js"></script>
		<script type="text/javascript" src="../js/bootstrap-collapse.js"></script>
		<script type="text/javascript" src="../js/bootstrap-carousel.js"></script>
		<script type="text/javascript" src="../js/bootstrap-typeahead.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
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
											<div id="project_name">
											<input type="text" id="name" name="name" class="span6" placeholder="必填">
											</div>
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