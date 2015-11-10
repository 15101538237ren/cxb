<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

	<jsp:include page="/cxb/_message.jsp"></jsp:include>
	
	<!-- list -->
	<div class="listDiv">
	    <table border=0 cellpadding=0 cellspacing=0 width=100%>
	        <thead class="listHead">
	        <tr>
	            <th width=5%>&nbsp;编号</th>
	            <th width=30%>项目名称</th>
	            <th width=10%>项目类型</th>
	            
	            <th width=20%>操作</th>
	        </tr>
	        </thead>
	        
	        <tbody class="listBody">
	        <s:if test="%{pageBean.list.size()>0}">
	        <s:iterator value="%{pageBean.list}" status="i" var="project">
	        <tr class="${(i.index+1)%2==0?'even':''}">
	            <td><s:property value="#i.index+1" /></td>
	            <td><a href='<s:url action="singleShow"><s:param name="id" value="#project.PId"/></s:url>'><s:property value="#project.mc" /></a></td>
	          	<td><s:property value="#project.kind" /></td>	            
	        </tr>
	        </s:iterator>
	        </s:if>
	        <s:else>
	        <tr>
	            <td colspan=10>无符合条件的数据</td>
	        </tr>
	        </s:else>
	        </tbody>
	    </table>
	</div>

    
