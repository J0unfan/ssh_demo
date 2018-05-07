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
    <title>添加</title>
	<link rel="stylesheet" type="text/css" href="styles.css" >
	<script>
		function doSubmit(o){
			document.getElementById('o').value=o;
			document.forms[0].submit();
		}
	</script>
  </head>
  <body class="main">
  <html:form action="role" method="post">
  	<html:hidden property="o" value="doAdd" />
  		<span style="font-weight:bold;">添加角色</span>
		<table class="input_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<td class="input_title">角色名称</td>
				<td class="input_content">
					<html:text property="item.roleName" />
				</td>
			</tr>
			<tr>
			    <td class="input_title">角色描述</td>
				<td class="input_content">
					<html:text property="item.roleDesc" />			
				</td>
			</tr>
			<tr>
			    <td class="input_title">状态</td>
				<td class="input_content">
					正常<html:hidden property="item.roleFlag" value="1" />
				</td>
			</tr>
		</table>
		<div class="button_bar">
			<button onclick="javascript:doSubmit('doAdd');">保    存</button>
		</div>
		<script>
		build_validate("item.roleName","角色名不能为空","Limit","1","50");
		</script>
	</html:form>	
  </body>
</html:html>
