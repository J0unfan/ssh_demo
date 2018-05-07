package org.jb.common.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 */
public class PageResult<E> {
	private String orderBy = "";
	private String sort = "asc";
	private List<E> list = new ArrayList<E>(); //查询结果
	private int pageNo = 1; //实际页号
	private int pageSize = 15; //每页记录数
	private int recTotal = 0; //总记录数
	
	public List getList() {
		return list;
	}
	public void setList(List<E> list) {
		this.list = list;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return (0==pageSize)?10:pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRecTotal() {
		return recTotal;
	}
	public void setRecTotal(int recTotal) {
		this.recTotal = recTotal;
	}
	
	//获取总页数
	public int getPageTotal() {
		int ret = (this.getRecTotal() - 1) / this.getPageSize() + 1;
		ret = (ret<1)?1:ret;
		return ret;
	}
	//获取当前行号
	public int getFirstRec()
	{
		int ret = (this.getPageNo()-1) * this.getPageSize();// + 1;
		ret = (ret < 1)?0:ret;
		return ret;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
}
