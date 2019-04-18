package com.thinkgem.jeesite.modules.jlb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.jlb.dao.WxUserPhoneDao;
import com.thinkgem.jeesite.modules.jlb.entity.WxUserPhone;
import com.thinkgem.jeesite.modules.member.dao.WsAddressDao;
import com.thinkgem.jeesite.modules.member.dao.WsMemberAttrDao;
import com.thinkgem.jeesite.modules.member.dao.WsMemberConsumeLogDao;
import com.thinkgem.jeesite.modules.member.dao.WsMemberCouponDao;
import com.thinkgem.jeesite.modules.member.dao.WsMemberRechargeLogDao;
import com.thinkgem.jeesite.modules.member.dao.WsMemberRewardLogDao;
import com.thinkgem.jeesite.modules.member.entity.WsAddress;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.member.entity.WsMemberAttr;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.ws.utils.WsUtils;


/**
 * 会员绑定手机号
 * @author 朱亚峰
 * @version 2019-04-14
 */
@Service
@Transactional(readOnly = true)
public class WxUserPhoneService extends CrudService<WxUserPhoneDao, WxUserPhone> {

	@Autowired
	private WxUserPhoneDao wxUserPhoneDao;
	
	
	public WxUserPhone get(String id) {
		WxUserPhone wxUserPhone = super.get(id);
		return wxUserPhone;
	}
	
	public WxUserPhone getByOpenId(String openId){
		return dao.getByOpenId(openId);
	}
	
	public WxUserPhone getByMobile(String mobile){
		return dao.getByPhone(mobile);
	}
	
	public List<WxUserPhone> findList(WxUserPhone wxUserPhone) {
		return super.findList(wxUserPhone);
	}
	
	public int findCount(WxUserPhone wxUserPhone) {
		return dao.findCount(wxUserPhone);
	}
	
	public Page<WxUserPhone> findPage(Page<WxUserPhone> page, WxUserPhone wxUserPhone) {
		return super.findPage(page, wxUserPhone);
	}
	
	@Transactional(readOnly = false)
	public void save(WxUserPhone wxUserPhone) {
		super.save(wxUserPhone);
	}
	
	@Transactional(readOnly = false)
	public void delete(WxUserPhone wxUserPhone) {
		super.delete(wxUserPhone);
	}
	
	@Transactional(readOnly = false)
	public void lock(String id) {
		dao.lock(id);
	}
	
}
