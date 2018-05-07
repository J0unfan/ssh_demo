package org.jb.app.demo.web.action;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.jb.app.demo.biz.RoleBiz;
import org.jb.app.demo.entity.SysRight;
import org.jb.app.demo.entity.SysRole;
import org.jb.app.demo.web.form.RoleForm;
import org.jb.common.web.action.BaseAction;


public class RoleAction extends BaseAction {
	//private UserBiz userBiz = null;
	private RoleBiz roleBiz = null;
//	public void setUserBiz(UserBiz userBiz){
//		this.userBiz = userBiz; 
//	}
	public void setRoleBiz(RoleBiz roleBiz){
		this.roleBiz = roleBiz; 
	}
	
    //获取权限列表信息
	public ActionForward toAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception{
	  RoleForm myForm = (RoleForm)form;
	  myForm.setItem(new SysRole());
	  return mapping.findForward("add");
	}
	
	 //添加角色
	public ActionForward doAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception{
	  RoleForm myForm = (RoleForm)form;
	  this.roleBiz.addRole(myForm.getItem());
	  return mapping.findForward("add");
	}
	
	//获取权限列表信息
	public ActionForward toList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		RoleForm myForm = (RoleForm)form;
		this.roleBiz.getList(myForm.getItem(), myForm.getPageResult());
		return mapping.findForward("list");
	}
	
	//去执行分配权限
	public ActionForward toAssignRights(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		RoleForm myForm = (RoleForm)form;
		String id = request.getParameter("id");
		SysRole role = this.roleBiz.getRoleWithRights(Long.parseLong(id));
		myForm.setItem(role);
		
		List allRights = this.roleBiz.getRights();
		Iterator it = allRights.iterator();
		while(it.hasNext()){
			SysRight right = (SysRight)it.next();
			if (role.getRights().contains(right)){
				right.setIsSelected("checked=\"on\"");
			}
		}
		request.setAttribute("ALL_RIGHTS_LIST", allRights);
		
		return mapping.findForward("assign_rights");
	}
	
    //执行分配权限
	public ActionForward doAssignRights(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		String[] selectedRightCodes = request.getParameterValues("selectedRights");
		RoleForm myForm = (RoleForm)form;
		Long roleId = myForm.getItem().getRoleId();
		
		this.roleBiz.assignRights(roleId,selectedRightCodes);
		
		response.sendRedirect("role.do?o=toAssignRights&id="+roleId);
		return null;
	}
}
