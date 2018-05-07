package org.jb.app.demo.web.form;

import org.jb.app.demo.entity.SysRole;
import org.jb.app.demo.entity.SysUser;
import org.jb.common.web.form.BaseForm;

public class UserForm extends BaseForm {
	private static final long serialVersionUID = -1667466188886997322L;
	private SysUser item = null;
	private SysRole role = null;
	
	public SysRole getRole() {
		return role;
	}

	public void setRole(SysRole role) {
		this.role = role;
	}

	public UserForm(){
		item = new SysUser();
	}
	
	public SysUser getItem() {
		return item;
	}
	public void setItem(SysUser item) {
		this.item = item;
	}
}
