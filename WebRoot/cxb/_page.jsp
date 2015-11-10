<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!--<%@ page import="edu.buaa.soft.util.*" %>-->

<script type="text/javascript" src="../js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $("#pageSize").change(function(){
          var actionName = $("#actionName").val();
          if(actionName.indexOf("pageSize=")!=-1){
          	  var fromIndex = actionName.indexOf("pageSize=");
    		  var endIndex = actionName.indexOf("&", fromIndex);
    		  if(endIndex != -1)
    		      actionName = actionName.replace(actionName.substring(fromIndex, endIndex+1),"");
    	  	  else{
    	  	  	  actionName = actionName.replace(actionName.substring(fromIndex),"");
    		  }
          }
          var url = actionName + "pageSize=" + $("#pageSize").val();
          jump(url);
      });
   });
</script>

<div >
   <table border=0 cellpadding=0 cellspacing=0 width=100%>
    <tr class="pageDiv">
      <td>
        <div>
            共<s:property value="pageBean.allCount"/>条记录&nbsp;&nbsp;
            共<s:property value="pageBean.allPage"/>页&nbsp;&nbsp;
            当前第<s:property value="pageBean.pageNo"/>页
        </div>
      </td>
      <td align="right">
        <div>
            <s:if test="%{pageBean.pageNo == 1}">首页&nbsp;&nbsp;上一页</s:if>
            <s:else>
                <a href="${pageBean.actionName}pageNo=1">首页</a>&nbsp;&nbsp;
                <a href="${pageBean.actionName}pageNo=<s:property value="%{pageBean.pageNo-1}"/>">上一页</a>
            </s:else>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <s:bean name="org.apache.struts2.util.Counter" id="counter">
			   <s:param name="first" value="%{pageBean.firstNo}" />
			   <s:param name="last" value="%{pageBean.lastNo}" />
			   <s:iterator>
			     <s:if test="%{current-1==pageBean.pageNo}">
			        <s:property value="current-1" />
			     </s:if>
			     <s:else>
			        <a href="${pageBean.actionName}pageNo=<s:property value="current-1"/>"><s:property value="current-1" /></a>
			     </s:else>
			   </s:iterator>
			</s:bean>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <s:if test="%{pageBean.pageNo == pageBean.allPage || pageBean.allPage == 0}">下一页&nbsp;&nbsp;尾页</s:if>
            <s:else>
                <a href="${pageBean.actionName}pageNo=<s:property value="%{pageBean.pageNo+1}"/>">下一页</a>&nbsp;&nbsp;
                <a href="${pageBean.actionName}pageNo=<s:property value="%{pageBean.allPage}"/>">尾页</a>
            </s:else>
        </div>
      </td>
      <td>
        <div>
        	&nbsp;
        	<input type="hidden" id="actionName" value="${pageBean.actionName}" />
            <s:select id="pageSize" name="pageSize" value="%{pageBean.pageSize}" list="#{10:'每页10条',20:'每页20条',30:'每页30条'}" listKey="key" listValue="value"/>
        </div>
      </td>
    </tr>
   </table>
</div>
