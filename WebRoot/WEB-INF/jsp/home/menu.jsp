<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/jb-common.tld" prefix="jb"%>
<script src="validate.js"></script>
<script src="icommon.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
<title>欢迎使用！</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<STYLE ID="JoustStyles" TYPE="text/css">
<!--
.menuItem {position:absolute; visibility:hidden; left:0px;}
.node { color: #000000;
font-family : "宋体";
font-size : 12px;}
.node A:link { color: #000000; text-decoration: none; }
.node A:visited { color: #000000; text-decoration: none; }
.node A:active { color: #005BB7; text-decoration: none; }
.node A:hover { color: #000000; text-decoration: none; }
.leaf { color: #000000;
font-family : "宋体";
font-size : 12px;}
.leaf A:link { color: #000000; text-decoration: none;}
.leaf A:visited { color: #000000; text-decoration: none; }
.leaf A:active { color: #005BB7; text-decoration: none; }
.leaf A:hover { color: #000000; text-decoration: none; }
-->
</STYLE>
<script language="JavaScript">
<!--  
var theMenuRef = "parent.theMenu";
var theMenu = eval(theMenuRef);
var theBrowser = parent.theBrowser;
var belowMenu = null;
var menuStart = 0;
if (parent.theBrowser) {
	if (parent.theBrowser.canOnError){
		window.onerror = parent.defOnError;
	}
}
if (theMenu) {
	theMenu.amBusy = true;
	if (theBrowser.hasDHTML) {
		if (document.layers) {
			document.ids.menuTop.position = "absolute";
			document.ids.menuBottom.position = "absolute";
			document.ids.menuBottom.visibility = "hidden";
			document.ids.statusMsgDiv.position = "absolute";
		} else {
			if (document.all) {
				with (document.styleSheets["JoustStyles"]) {
					addRule ("#menuTop", "position:absolute");
					addRule ("#menuBottom", "position:absolute");
					addRule ("#menuBottom", "visibility:hidden");
					addRule ("#statusMsgDiv", "position:absolute");
				}
			}
		}
	}
}
function getDHTMLObj(objName) {
	return eval('document' + theBrowser.DHTMLRange + '.' + objName + theBrowser.DHTMLStyleObj);
}
function getDHTMLObjHeight(objName) {
	return eval('document' + theBrowser.DHTMLRange + '.' + objName + theBrowser.DHTMLDivHeight);
}
function getDHTMLObjTop(theObj) {
	return (theBrowser.code == "MSIE") ? theObj.pixelTop + 0 : theObj.top;
}
function myVoid() { ; }
function setMenuHeight(theHeight) {
	getDHTMLObj('menuBottom').top = theHeight;
}
function drawStatusMsg() {
	if (document.layers) {
		document.ids.statusMsgDiv.top = menuStart;
	} else{
		if (document.all) {
			document.styleSheets["JoustStyles"].addRule ("#statusMsgDiv", "top:" + menuStart);
		}
	}
	document.writeln('<DIV ID="statusMsgDiv"><CENTER>请稍等...</CENTER></DIV>');
}
function drawLimitMarker() {
	var b = theBrowser;
	if (theMenu && b.hasDHTML && b.needLM) {
		var limitPos = theMenu.maxHeight + menuStart + getDHTMLObjHeight('menuBottom');
		if (b.code == 'NS') {
			document.ids.limitMarker.position = "absolute";
			document.ids.limitMarker.visibility = "hidden";
			document.ids.limitMarker.top = limitPos;
		}
		if (b.code == 'MSIE') {
			with (document.styleSheets["JoustStyles"]) {
			addRule ("#limitMarker", "position:absolute");
			addRule ("#limitMarker", "visibility:hidden");
			addRule ("#limitMarker", "top:" + limitPos + "px");
			}
		}
		document.writeln('<DIV ID="limitMarker">&nbsp;</DIV>');
	}
}
function setTop() {
	if (theMenu && theBrowser.hasDHTML) {
		if (getDHTMLObj('menuTop')) {
			menuStart = getDHTMLObjHeight("menuTop");
			drawStatusMsg();
		} else {
			theBrowser.hasDHTML = false;
		}
	}
}
function setBottom() {
	if (theMenu) {
		if (theBrowser.hasDHTML) {
			drawLimitMarker();
			getDHTMLObj("statusMsgDiv").visibility = 'hidden';
			theMenu.refreshDHTML();
			getDHTMLObj('menuBottom').visibility = 'visible';
		}
		theMenu.amBusy = false;
	}
}
function frameResized() {
	if (theBrowser.hasDHTML) {
		theMenu.refreshDHTML();
	}
}
if (self.name != 'menu') { 
	self.location.href = 'main.jsp'; 
}
//-->
</script>
</head>
<BODY LINK="#FFFFFF" marginwidth="1" marginheight="1"
	onResize="frameResized();" topmargin="0" leftmargin="0"
	bgcolor="#99CCFF" text="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">

<DIV ID="menuTop">&nbsp;</DIV>
<SCRIPT LANGUAGE="JavaScript">
<!--
setTop();
//-->
</SCRIPT>
<!--这些字体，颜色等参数应用于后面的菜单 -->
<FONT FACE="宋体" color="#000000"> <SCRIPT LANGUAGE="JavaScript">
<!--
if (theMenu) {
	parent.DrawMenu(theMenu);
}
//-->
</SCRIPT> </FONT>
<DIV ID="menuBottom"><!-- Place anything you want to appear after the menu between these DIV tags. -->
&nbsp;</DIV>
<SCRIPT LANGUAGE="JavaScript">
<!--
setBottom();
//-->
</SCRIPT>
</BODY>
</html:html>






