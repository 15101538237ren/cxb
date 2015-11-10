<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- Navbar================================================== -->
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="#">创新杯</a>
			<a class="logo" href="#"> </a>
			<div class="nav-collapse">
				<ul class="nav">
					<s:if test="#session.student.SXm != null">
						<li>
							<a href="<s:url namespace='/project' action='show'></s:url>">项目</a>
						</li>
					</s:if>
				</ul>

				<ul class="nav pull-right">
					<s:if test="#session.student.SXm != null">
						<li class="divider-vertical"></li>
						<li>
							<a data-toggle="modal" href="#Login"><s:property
									value="#session.student.SXm" /> </a>
						</li>

						<li>
							<a data-toggle="modal"
								href="<s:url namespace="/login" action="logout"></s:url>">退出</a>
						</li>

					</s:if>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>