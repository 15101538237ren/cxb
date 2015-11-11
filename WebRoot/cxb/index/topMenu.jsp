<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="/cxb/css/global.css">
    <script type="text/javascript" src="/cxb/js/jquery-1.4.2.js"></script>
    <script type="text/javascript">
       $(document).ready(function(){
			$("#topMenuRight ul li a").click(function(){
				$("#topMenuRight ul li").each(function(){ 
				    $(this).removeClass("selected");
				});
				$(this).parent().addClass("selected");
				showSingleMenu($(this).attr("id"));
			});
	   });
	   function showSingleMenu(id){
			parent.executeCmd("refreshLeftMenu", id);
	   }
	   function getWorkspaceWidth(){
	        var bodyWidth = parent.document.documentElement.clientWidth;
	        var cols = parent.document.getElementById("middleFrame").cols;
	        var colsItems = cols.split(",");
	        return bodyWidth-colsItems[0];
	   }
    </script>
  </head>
  
  <body class="rheaderBody">
		<div id="topMenuRight">
			<ul>
				<li><a href="javascript:void(0)" id="topMenu_7">系统管理</a></li>
				<li><a href="javascript:void(0)" id="topMenu_4">学生信息</a></li>
				<li><a href="javascript:void(0)" id="topMenu_3">项目管理</a></li>
				<li><a href="javascript:void(0)" id="topMenu_2">数据分析</a></li>
				<li class="selected"><a href="javascript:void(0)" id="topMenu_1">我的工作区</a></li>
			</ul>
		</div>
  </body>
</html>