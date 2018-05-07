<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/jb-common.tld" prefix="jb" %>
<script src="validate.js" ></script>
<script src="icommon.js" ></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <title>欢迎使用！</title>
	<link rel="stylesheet" type="text/css" href="styles.css" >
  </head>
  <body>
 	当前登录用户: ${sessionScope.USER.usrName } [<a href="user.do?o=doLogout">注销</a>]
  </body>
</html:html>
