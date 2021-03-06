package com.thinkgem.jeesite.modules.returnback.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.returnback.entity.WsReturnItem;

/**
 * 退货管理DAO接口
 * @author 大胖老师
 * @version 2017-12-02
 */
@MyBatisDao
public interface WsReturnItemDao extends CrudDao<WsReturnItem> {
	
}