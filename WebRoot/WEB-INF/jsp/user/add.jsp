<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/jb-common.tld" prefix="jb" %>
<script src="validate.js" ></script>
<script src="icommon.js" ></script>
<html:errors/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <title>增加用户</title>
	<link rel="stylesheet" type="text/css" href="styles.css" >
	<script>
		function doSubmit(o){
		   var roleId = document.getElementById('item.usrRole.roleId').value;
		   if(roleId!=""){
			document.getElementById('o').value=o;
			document.forms[0].submit();
		   }else 
		    alert("请选择角色类型！");
		}
	</script>
  </head>

  <body class="main">
  <html:form action="user" method="post">
  	<html:hidden property="o" value="doAdd" />
  		<span style="font-weight:bold;">添加用户</span>
		<table class="input_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<td class="input_title">用户名</td>
				<td class="input_content">
					<html:text property="item.usrName" />
				</td>
				<td class="input_title">密码</td>
				<td class="input_content">
					<html:password property="item.usrPassword" />			
				</td>
			</tr>
			<tr>
				<td class="input_title">角色</td>
				<td class="input_content">
				<html:select property="item.usrRole.roleId" >
		          <html:option value="">请选择</html:option>
		          <html:optionsCollection name="roleList" label="roleName" value="roleId"/>
		        </html:select>
				</td>
				<td class="input_title">状态</td>
				<td class="input_content">
					正常<html:hidden property="item.usrFlag" value="1" />
				</td>
			</tr>
		</table>
		<div class="button_bar">
			<button onclick="javascript:doSubmit('doAdd');">保    存</button>
		</div>
		<script>
		</script>
	</html:form>	
  </body>
</html:html>
