<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="../css/docs.css" rel="stylesheet">

		<title>个人信息</title>
	</head>

	<body data-spy="scroll" data-target=".bs-docs-sidebar">

		<div class="container">
			<jsp:include page="/cxb/topmenu/menu.jsp"></jsp:include>

			<header style="text-align: center;">
				<h2>
					北京航空航天大学软件学院“创新杯”
				</h2>
			</header>

			<form class="form-horizontal">
				<legend>
					个人信息
				</legend>
				<blockquote>
					<div class="control-group">
						<label class="control-label" for="SID">
							学号
						</label>
						<div class="controls">

							<input type="text" id="SID" disabled="true" placeholder=""
								value="${session.student.SXh}">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputUserName">
							姓名
						</label>
						<div class="controls">
							<input type="text" id="inputUserName" disabled="true"
								placeholder="姓名" value="${session.student.SXm}">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputPhoneNumber">
							手机号
						</label>
						<div class="controls">
							<input type="text" id="inputPhoneNumber" disabled="true"
								placeholder="" value="${session.student.SSjh}">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputEmail">
							邮箱
						</label>
						<div class="controls">
							<input type="text" id="inputEmail" disabled="true" placeholder=""
								value="${session.student.SYx}">
						</div>
					</div>
				</blockquote>
			</form>


			<table class="table table-bordered">
				<legend>
					项目信息
				</legend>
				<s:if test="message!=null&&!message.equals('')">
					<div id="warningMessage" class="alert">
						<button type="button" class="close" data-dismiss="alert">
							×
						</button>
						<strong>警告！</strong> 已经达到可以申报的项目上限。
					</div>

				</s:if>
				<s:if test="error!=null&&!error.equals('')">
					<div id="errorDiv">
						<s:property value="%{error}" />
					</div>
				</s:if>

				<s:if test="#session.project">
					<tr>
						<td class="label" width="5%">
							序号
						</td>
						<td class="label" align="center" width="20%">
							项目名称
						</td>
						<td class="label" align="center" width="15%">
							作者
						</td>
						<td class="label" align="center" width="30%">
							项目难点
						</td>
						<td class="label" align="center" width="30%">
							项目创新点
						</td>
					</tr>
					<s:set name="index" value="1" />
					<s:iterator value="#session.projectAndAuthorsList"
						id="projectAndAuthors">
						<tr>
							<td>
								<s:property value="#index" />
								<s:set name="index" value="#index+1" />
							</td>
							<td>
								<s:url id="selectedProject" namespace="/project" action="single">
									<s:param name="selectedProjectId">
										<s:property value="#projectAndAuthors.key.PId" />
									</s:param>
								</s:url>
								<s:a href="%{selectedProject}">
									<s:property value="#projectAndAuthors.key.mc" />
								</s:a>

							</td>
							<td>
								<s:property value="#projectAndAuthors.value" />
							</td>
							<td>
								<s:property value="#projectAndAuthors.key.keyTech" />
							</td>
							<td>
								<s:property value="#projectAndAuthors.key.innovation" />
							</td>
						</tr>
					</s:iterator>
					<!--					<tr>-->
					<!--						<td align="right">-->
					<!--							1-->
					<!--						</td>-->
					<!--						<td align="right">-->
					<!--							<c:out value="${project.mc}" />-->
					<!--						</td>-->
					<!--						<td align="right">-->
					<!--							<c:out value="${authors}" />-->
					<!--						</td>-->
					<!--						<td align="right">-->
					<!--							<c:out value="${project.keyTech}" />-->
					<!--						</td>-->
					<!--						<td align="right">-->
					<!--							<c:out value="${project.innovation}" />-->
					<!--						</td>-->
					<!--					</tr>-->
				</s:if>
				<s:else>
					<tr>
						<td colspan=10>
							您没有申请项目，请点击“
							<input class="btn btn-success" type="submit" value="新项目"
								onclick="jump('<s:url namespace="/apply" action="signUp"></s:url>')" />
							”按钮申请项目。
							<span class="label label-warning">注意</span>：您只能申请一个项目，申请后项目信息不可更改。
						</td>
					</tr>
				</s:else>
			</table>
			<div>
				<input class="btn btn-success" type="submit" value="新项目"
					onclick="jump('<s:url namespace="/apply" action="signUp"></s:url>')" />
				
			</div>
		</div>
		<hr />

		<!-- Le javascript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->

		<script type="text/javascript" src="../js/common.js"></script>
		<script type="text/javascript" src="../js/jquery.min.js"></script>
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
		<script type="text/javascript" src="../js/bootstrap-affix.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>


	</body>

	<footer>
		<center>
			© 北航软件学院,2011-2012
		</center>
	</footer>
</html>
