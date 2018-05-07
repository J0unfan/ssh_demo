<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<logic:empty name="USER" scope="session">
<script>
	window.location.href = "index.jsp?error=2";
</script>
</logic:empty>


<script type="text/javascript" src="menu.js"></script>
<title>XX系统</title>
<SCRIPT LANGUAGE="JavaScript">
<!--

function initialise() {
	// Tell where to find the various index files it needs
	index1 = 'main.html';
	//index2 = 'index2.htm';
	//index3 = 'index3.htm';

	// Set up parameters to control menu behaviour
	theMenu.autoScrolling = true;	
	theMenu.modalFolders = false;
	theMenu.linkOnExpand = false;
	theMenu.toggleOnLink = false;
	theMenu.showAllAsLinks = false;
	theMenu.savePage = true;
	theMenu.tipText = "status";
	theMenu.selectParents = false;
	theMenu.name = "theMenu";
	theMenu.container = "self.menu";
	theMenu.reverseRef = "parent";
	theMenu.contentFrame = "text";
	theMenu.defaultTarget = "text";

	// Initialise all the icons
	initOutlineIcons(theMenu.imgStore);
	
	// Now set up the menu with a whole lot of addEntry and addChild function calls
	var level1ID = -1;
	var level2ID = -1;
	var level3ID = -1;
	var level4ID = -1;
	var level5ID = -1;
	//level表示最高级，level2子级，level3子子级，Document文件，folder文件夹。
	//Set the initial state of the folder to "open"
	//以上不要改变
	//仿照下面的格式增加项目即可；
	ROOT_MENU = theMenu.addEntry(-1, "Folder", "XX管理系统", "home.do?o=welcome", "XX管理系统...");	
	${sessionScope.MENU_STRING}
	theMenu.entry[ROOT_MENU].isopen = true;
}
self.defaultStatus = "";	

//-->
</script>
<SCRIPT LANGUAGE="JavaScript">
<!--
if (self.name == 'menu') {	
	self.location.href = "menu.jsp";
} else {
	initialise();
	var thePage = pageFromSearch('index.jsp', theMenu, true);
}

//-->
</SCRIPT>
<frameset rows="65,*,50">
	<frame src="home.do?o=header">
	<frameset cols="200,*">
		<frame src="home.do?o=menu" name="menu">
		<frame src="home.do?o=welcome" name="text">
	</frameset>
	<frame src="home.do?o=footer">
</frameset>