package com.thinkgem.jeesite.modules.prod.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.prod.entity.WsProdAttrivalue;

/**
 * 产品属性DAO接口
 * @author water
 * @version 2017-09-30
 */
@MyBatisDao
public interface WsProdAttrivalueDao extends CrudDao<WsProdAttrivalue> {
	
}