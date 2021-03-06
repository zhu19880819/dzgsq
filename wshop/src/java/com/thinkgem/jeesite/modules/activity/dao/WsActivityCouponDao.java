package com.thinkgem.jeesite.modules.activity.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.activity.entity.WsActivityCoupon;

/**
 * 优惠券活动DAO接口
 * @author 大胖老师
 * @version 2017-11-10
 */
@MyBatisDao
public interface WsActivityCouponDao extends CrudDao<WsActivityCoupon> {
	
}