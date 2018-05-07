package org.jb.common.web.form;

import org.apache.struts.action.ActionForm;
import org.jb.common.util.PageResult;


public class BaseForm extends ActionForm {

	private static final long serialVersionUID = -5726783089661652109L;
	
	private PageResult pageResult = new PageResult();
	public PageResult getPageResult() {
		return pageResult;
	}
	public void setPageResult(PageResult pageResult) {
		this.pageResult = pageResult;
	}
	
}
