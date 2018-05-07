package org.jb.app.demo.biz;

import java.util.List;

import org.jb.app.demo.entity.SysRole;
import org.jb.app.demo.entity.SysUser;
import org.jb.common.biz.BaseBiz;
import org.jb.common.util.PageResult;

/**
 * 用户管理业务逻辑类
 * @author
 */
public class UserBiz extends BaseBiz {
	/**
	 * 查询用户列表 
	 */
	public void getList(SysUser item, PageResult pageResult) {
		String hql = "select o from SysUser o where 1=1 ";
		if (null!=item){
			if (isNotNullOrEmpty(item.getUsrName())){
				hql += "and o.usrName like '%"
						+item.getUsrName()+"%' ";				
			}
			if (item.getUsrFlag()!=null && item.getUsrFlag()!=-1){
				hql += "and o.usrFlag = "+item.getUsrFlag()+" ";				
			}
		}
		if (isNotNullOrEmpty(pageResult.getOrderBy())){
			String sort = pageResult.getSort();
			hql += "order by " + pageResult.getOrderBy() + " " +sort; 
			if ("asc".equals(sort)){
				pageResult.setSort("desc");
			}else{
				pageResult.setSort("asc");
			}
		}else{
			hql += "order by o.usrId desc,o.usrName asc";
		}		
		this.getCommonDAO().listByPage(hql,pageResult);
	}
	/**
	 * 删除用户
	 */
	public boolean del(Long id){
		SysUser item = (SysUser)this.getCommonDAO().get(SysUser.class, id);
		item.setUsrFlag(0);
		this.getCommonDAO().update(item);
		return true;
	}
	/**
	 * 添加用户
	 */
	public boolean add(SysUser item){
		//先检查用户名是否已经存在
		List list = this.getCommonDAO().list("select o from SysUser o where o.usrName = '" 
				+ item.getUsrName() +"'");
		if(list.size()>0){
			return false;
		}
		//添加用户
		SysRole  role = (SysRole)this.getCommonDAO().get(SysRole.class, item.getUsrRole().getRoleId());
		item.setUsrRole(role);
		this.getCommonDAO().add(item);		
		return true;
	}
	/**
	 * 加载用户
	 */	
	public SysUser get(Long id){
		SysUser item = null;//(SysUser)this.getCommonDAO().get(SysUser.class, id);
		List list = this.getCommonDAO().list("select o from SysUser o left outer join fetch o.usrRole where o.usrId=" + id);
		if(list.size()>0){
			item = (SysUser)list.get(0);
		}		
		return item;
	}
	/**
	 * 修改用户
	 */	
	public boolean update(SysUser item){
		//先检查新用户名是否已经被使用
		List list = this.getCommonDAO().list("select o from SysUser o where " +
				"o.usrId<> " + item.getUsrId() +" and o.usrName = '" 
				+ item.getUsrName() +"'");
		if(list.size()>0){
			return false;
		}
		if(item.getUsrRole().getRoleId()==null){
			item.setUsrRole(null);
		}
		this.getCommonDAO().update(item);		
		return true;
	}
	/**
	 * 检查是否是系统合法用户
	 */
	public SysUser checkUser(SysUser item) {
		List list = this.getCommonDAO().list("select o from SysUser o where " +
				"o.usrFlag<>0 " +
				"and o.usrName='" + item.getUsrName() +"' " +
				"and o.usrPassword = '"	+ item.getUsrPassword() +"' " );
		if(list.size()==1){
			Long usrId = ((SysUser)list.get(0)).getUsrId();
			SysUser user = this.get(usrId);
			return user;
		}else{
			return null;
		}
	}
	/**
	 * 分配角色
	 */
	@SuppressWarnings("unchecked")
	public boolean assignRole(SysUser item) {
		if(item.getUsrRole()==null||item.getUsrRole().getRoleId()==null){
			return false;
		}else{
			Long usrId = item.getUsrId();
			Long roleId = item.getUsrRole().getRoleId();
			
			SysUser user = (SysUser)this.getCommonDAO().get(SysUser.class, usrId);
			SysRole role = (SysRole)this.getCommonDAO().get(SysRole.class, roleId);
			
			user.setUsrRole(role);
			role.getUsers().add(user);
			
			this.getCommonDAO().update(user);		
			return true;
		}
	}
}
