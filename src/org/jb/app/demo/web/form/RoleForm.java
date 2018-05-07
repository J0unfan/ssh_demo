package org.jb.app.demo.web.form;

import org.jb.app.demo.entity.SysRole;
import org.jb.common.web.form.BaseForm;

public class RoleForm extends BaseForm {
	private static final long serialVersionUID = -1667466188886997322L;
	private SysRole item = null;
	
	public RoleForm(){
		item = new SysRole();
	}
	public SysRole getItem() {
		return item;
	}
	public void setItem(SysRole item) {
		this.item = item;
	}
}
