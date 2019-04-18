package com.thinkgem.jeesite.modules.jlb.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.jlb.entity.WxUserPhone;

@MyBatisDao
public interface WxUserPhoneDao extends CrudDao<WxUserPhone>{

	public WxUserPhone getByOpenId(String openId);
	
	public WxUserPhone getByPhone(String phone);
	
	public int findCount(WxUserPhone userPhone);
	
	public void lock(String id);
	
}
