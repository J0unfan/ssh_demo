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
    <title>编辑用户</title>
	<link rel="stylesheet" type="text/css" href="styles.css" >
	<script>
		function doDel(id){
			if ( window.confirm("确定删除？") ){
				window.location.href = "?o=doDel&id=" + id;
			}
		}
	</script>
  </head>

  <body class="main">
  <html:form action="user" method="post">
  	<html:hidden property="o" value="doEdit" />
  	<html:hidden property="item.usrId" />
  	<html:hidden property="item.usrFlag" />
    <html:hidden property="item.usrRole.roleId"/>
  		<span style="font-weight:bold;">编辑用户</span>
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
					${userForm.item.usrRole.roleName==null?"未指定":userForm.item.usrRole.roleName }&nbsp;
				</td>
				<td class="input_title">状态</td>
				<td class="input_content">
					${userForm.item.usrFlagString }&nbsp;
				</td>
			</tr>
		</table>
		<div class="button_bar">
			<button onclick="javascript:history.go(-1);">取    消</button>
			<button onclick="javascript:doSubmit('doEdit');">保    存</button>
		</div>
		<script>
		build_validate("item.usrName","用户名不能为空","Limit","1","50");
		build_validate("item.usrPassword","密码不能为空","Limit","1","50");
		</script>
	</html:form>	
  </body>
</html:html>
