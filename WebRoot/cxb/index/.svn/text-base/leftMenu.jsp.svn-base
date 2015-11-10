<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../css/global.css">
    <script type="text/javascript" src="../js/jquery-1.4.2.js"></script>
    <script type="text/javascript">
       $(document).ready(function(){
		  $(".singleMenu a").click(function(){
			 $(".singleMenu a").removeClass("selected");
			 $(this).addClass("selected");
		  });
	   });
       function openJsp(url){
		  if(url && url != "")	parent.executeCmd("showPage", url);
	   };
    </script>
  </head>
  
  <body>
    <div class="leftMenu">
        <div class="leftMenuTop"></div>
		<div id="topMenu_1" class="module">
			<h4>我的工作区</h4>
			<div class="singleMenu">
				<h5>我的工作</h5>
				<a href="#" onclick="openJsp('<s:url namespace="/admin" action="list"/>')">查看项目列表</a>
				<a href="#" onclick="openJsp('<s:url namespace="/project" action="export"/>')">导出项目列表</a>
				<a href="#" onclick="openJsp('<s:url  namespace="/admin"action="publishNotice"/>')">发布页面通知</a>
				<a href="#" onclick="openJsp('<s:url action="flow" namespace="/my"/>')">发布邮箱通知</a>
				<h5>个人设置</h5>
				<a href="#" onclick="openJsp('<s:url action="show" namespace="/managerInfo"/>')">个人信息</a>
				<a href="#" onclick="openJsp('<s:url action="changePwd" namespace="/managerInfo"/>')">修改密码</a>
			</div>
	        <br/>
		</div>
		
		<div id="topMenu_2" class="module hide">
			<h4>数据分析</h4>
			<div class="singleMenu">
			    <a href="#" onclick="openJsp('<s:url action="listMyBook" namespace="/book"/>')">统计</a>
				<a href="#" onclick="openJsp('<s:url action="listToAudit" namespace="/book"/>')">相似性分析</a>
				<a href="#" onclick="openJsp('<s:url action="listAuditing" namespace="/book"/>')">关联分析</a>

			</div>
	        <br/>
		</div>
		
		<div id="topMenu_3" class="module hide">
			<h4>项目管理</h4>
			<div class="singleMenu">
				<a href="#" onclick="openJsp('<s:url action="list" namespace="/badKeyword"/>')">分组</a>
				<a href="#" >分配审核地点</a>
			</div>
	        <br/>
		</div>
		
		<div id="topMenu_4" class="module hide">
			<h4>学生信息</h4>
			<div class="singleMenu">
				<a href="#" onclick="openJsp('<s:url action="list" namespace="/section"/>')">所有学生信息</a>
			</div>
	        <br/>
		</div>
				
		<div id="topMenu_7" class="module hide">
			<h4>系统管理</h4>
			<div class="singleMenu">
				<h5>人员管理</h5>
				<a href="#" onclick="openJsp('<s:url action="list" namespace="/manager"/>')">后台用户管理</a>
				<a href="#" onclick="openJsp('<s:url action="list" namespace="/user"/>')">前台用户管理</a>
				
				<h5>安全管理</h5>
				<a href="#" onclick="openJsp('<s:url action="list" namespace="/role"/>')">角色权限管理</a>
				<a href="#" onclick="openJsp('<s:url action="list" namespace="/log"/>')">业务日志管理</a>
	        </div>
	    </div>
	    <div class="leftMenuBtm"></div>
	</div>
  </body>
</html>