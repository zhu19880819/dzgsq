package com.thinkgem.jeesite.modules.pc.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.excel.UrlUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.member.service.WsMemberService;
import com.thinkgem.jeesite.modules.order.entity.WsOrder;
import com.thinkgem.jeesite.modules.order.entity.WsOrderItem;
import com.thinkgem.jeesite.modules.order.service.WsOrderItemService;
import com.thinkgem.jeesite.modules.order.service.WsOrderService;
import com.thinkgem.jeesite.modules.prod.service.WsProdSkuService;
import com.thinkgem.jeesite.modules.returnback.service.WsReturnItemService;
import com.thinkgem.jeesite.modules.ws.utils.WsConstant;

/**
 * PC端订单
 *
 */
@Controller
@RequestMapping(value = "${webPath}/order/pcOrder")
public class WebOrderController extends BaseController {

	@Autowired
	private WsOrderService wsOrderService;

	@Autowired
	private WsProdSkuService wsProdSkuService;

	@Autowired
	private WsMemberService wsMemberService;

	@Autowired
	private WsReturnItemService wsReturnItemService;

	@Autowired
	private WsOrderItemService wsOrderItemService;

	/**
	 * 查询全部订单
	 */
	@RequestMapping(value = "allListOrder")
	public String allListOrder(HttpServletRequest request, HttpServletResponse response, Model model) {
		WsMember wsMember = wsMemberService.get("9a54940b4ddc4872a1eeb18a5aeb6324");

		WsOrder wsOrder = new WsOrder();
		wsOrder.setMemberId(wsMember);
		Page<WsOrder> page = wsOrderService.findPage(new Page<WsOrder>(request, response), wsOrder);
		List<WsOrder> wsAllOrderList = page.getList();
		for (WsOrder order : wsAllOrderList) {
			WsOrderItem wsOrderItem = new WsOrderItem();
			wsOrderItem.setWsOrder(order);
			List<WsOrderItem> wsOrderItemList = wsOrderItemService.findList(wsOrderItem);
			for (WsOrderItem item : wsOrderItemList) {
				item.setThumb(UrlUtils.getNetUrl(item.getThumb()));
				item.setWsOrder(order);
			}
			order.setWsOrderItemList(wsOrderItemList);
		}
		setOrderNum(model, wsOrder);
		model.addAttribute("page", page);
		model.addAttribute("staus", "ALL");
		return "modules/pc/webOrder";
	}

	/**
	 * 查询当前用户待付款订单
	 */
	@RequestMapping(value = "waitePayListOrder")
	public String waitePayListOrder(HttpServletRequest request, HttpServletResponse response, Model model) {
		WsMember wsMember = wsMemberService.get("9a54940b4ddc4872a1eeb18a5aeb6324");

		WsOrder wsOrder = new WsOrder();
		wsOrder.setMemberId(wsMember);
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_PAY);
		Page<WsOrder> page = wsOrderService.findPage(new Page<WsOrder>(request, response), wsOrder);
		List<WsOrder> wsAllOrderList = page.getList();
		for (WsOrder order : wsAllOrderList) {
			WsOrderItem wsOrderItem = new WsOrderItem();
			wsOrderItem.setWsOrder(order);
			List<WsOrderItem> wsOrderItemList = wsOrderItemService.findList(wsOrderItem);
			for (WsOrderItem item : wsOrderItemList) {
				item.setThumb(UrlUtils.getNetUrl(item.getThumb()));
				item.setWsOrder(order);
			}
			order.setWsOrderItemList(wsOrderItemList);
		}
		setOrderNum(model, wsOrder);
		model.addAttribute("page", page);
		model.addAttribute("staus", "waitePay");
		return "modules/pc/webOrder";
	}

	/**
	 * 查询当前用户待发货订单
	 */
	@RequestMapping(value = "waiteSendListOrder")
	public String waiteSendListOrder(HttpServletRequest request, HttpServletResponse response, Model model) {
		WsMember wsMember = wsMemberService.get("9a54940b4ddc4872a1eeb18a5aeb6324");

		WsOrder wsOrder = new WsOrder();
		wsOrder.setMemberId(wsMember);
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_SEND);
		Page<WsOrder> page = wsOrderService.findPage(new Page<WsOrder>(request, response), wsOrder);
		List<WsOrder> wsAllOrderList = page.getList();
		for (WsOrder order : wsAllOrderList) {
			WsOrderItem wsOrderItem = new WsOrderItem();
			wsOrderItem.setWsOrder(order);
			List<WsOrderItem> wsOrderItemList = wsOrderItemService.findList(wsOrderItem);
			for (WsOrderItem item : wsOrderItemList) {
				item.setThumb(UrlUtils.getNetUrl(item.getThumb()));
				item.setWsOrder(order);
			}
			order.setWsOrderItemList(wsOrderItemList);
		}
		setOrderNum(model, wsOrder);
		model.addAttribute("page", page);
		model.addAttribute("staus", "waiteSend");
		return "modules/pc/webOrder";
	}

	/**
	 * 查询当前用户待收货订单
	 */
	@RequestMapping(value = "waiteReceviedListOrder")
	public String waiteReceviedListOrder(HttpServletRequest request, HttpServletResponse response, Model model) {
		WsMember wsMember = wsMemberService.get("9a54940b4ddc4872a1eeb18a5aeb6324");

		WsOrder wsOrder = new WsOrder();
		wsOrder.setMemberId(wsMember);
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_RECEVIED);
		Page<WsOrder> page = wsOrderService.findPage(new Page<WsOrder>(request, response), wsOrder);
		List<WsOrder> wsAllOrderList = page.getList();
		for (WsOrder order : wsAllOrderList) {
			WsOrderItem wsOrderItem = new WsOrderItem();
			wsOrderItem.setWsOrder(order);
			List<WsOrderItem> wsOrderItemList = wsOrderItemService.findList(wsOrderItem);
			for (WsOrderItem item : wsOrderItemList) {
				item.setThumb(UrlUtils.getNetUrl(item.getThumb()));
				item.setWsOrder(order);
			}
			order.setWsOrderItemList(wsOrderItemList);
		}
		setOrderNum(model, wsOrder);
		model.addAttribute("page", page);
		model.addAttribute("staus", "waiteRecevied");
		return "modules/pc/webOrder";
	}

	/**
	 * 查询当前用户待评价订单
	 */
	@RequestMapping(value = "waiteEvaluationListOrder")
	public String waiteEvaluationListOrder(HttpServletRequest request, HttpServletResponse response, Model model) {
		WsMember wsMember = wsMemberService.get("9a54940b4ddc4872a1eeb18a5aeb6324");

		WsOrder wsOrder = new WsOrder();
		wsOrder.setMemberId(wsMember);
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_EVALUATION);
		Page<WsOrder> page = wsOrderService.findPage(new Page<WsOrder>(request, response), wsOrder);
		List<WsOrder> wsAllOrderList = page.getList();
		for (WsOrder order : wsAllOrderList) {
			WsOrderItem wsOrderItem = new WsOrderItem();
			wsOrderItem.setWsOrder(order);
			List<WsOrderItem> wsOrderItemList = wsOrderItemService.findList(wsOrderItem);
			for (WsOrderItem item : wsOrderItemList) {
				item.setThumb(UrlUtils.getNetUrl(item.getThumb()));
				item.setWsOrder(order);
			}
			order.setWsOrderItemList(wsOrderItemList);
		}
		setOrderNum(model, wsOrder);
		model.addAttribute("page", page);
		model.addAttribute("staus", "waiteEvaluation");
		return "modules/pc/webOrder";
	}

	public void setOrderNum(Model model, WsOrder wsOrder) {
		// 查询当前用户待付款订单
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_PAY);
		List<WsOrder> waiePayOrderList = wsOrderService.findList(wsOrder);
		// 查询当前用户待发货订单
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_SEND);
		List<WsOrder> waieSendOrderList = wsOrderService.findList(wsOrder);
		// 查询当前用户待收货订单
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_RECEVIED);
		List<WsOrder> waieReceviedOrderList = wsOrderService.findList(wsOrder);
		// 查询当前用户待评价订单
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_EVALUATION);
		List<WsOrder> waieEvaluationOrderList = wsOrderService.findList(wsOrder);
		model.addAttribute("waiePayOrderList", waiePayOrderList);
		model.addAttribute("waieSendOrderList", waieSendOrderList);
		model.addAttribute("waieReceviedOrderList", waieReceviedOrderList);
		model.addAttribute("waieEvaluationOrderList", waieEvaluationOrderList);
	}

	/**
	 * 查询当前用户订单详情列表
	 */
	@RequestMapping(value = "showListDetailOrder")
	public String showListDetailOrder(String orderId, Model model) {
		WsOrder wsOrder = wsOrderService.get(orderId);
		WsOrderItem wsOrderItem = new WsOrderItem();
		wsOrderItem.setWsOrder(wsOrder);
		List<WsOrderItem> wsOrderItemList = wsOrderItemService.findList(wsOrderItem);
		for (WsOrderItem item : wsOrderItemList) {
			item.setThumb(UrlUtils.getNetUrl(item.getThumb()));
			item.setWsOrder(wsOrder);
		}
		wsOrder.setWsOrderItemList(wsOrderItemList);
		model.addAttribute("wsOrder", wsOrder);
		return "modules/pc/webOrderDetail";
	}

	/**
	 * 取消订单
	 */
	@RequestMapping(value = "closeOrder")
	public String closeOrder(WsOrder wsOrder, RedirectAttributes redirectAttributes) {
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_CANCEL);
		wsOrderService.closeOrder(wsOrder);
		addMessage(redirectAttributes, "取消订单");
		return "redirect:" + Global.getConfig("webPath") + "/order/pcOrder/?repage";
	}

	/**
	 * 待付款
	 */
	@RequestMapping(value = "payOrder")
	public String payOrder(String orderId, Model model) {
		WsMember wsMember = wsMemberService.get("9a54940b4ddc4872a1eeb18a5aeb6324");
		WsOrder wsOrder = wsOrderService.get(orderId);
		WsOrderItem wsOrderItem = new WsOrderItem();
		wsOrderItem.setWsOrder(wsOrder);
		List<WsOrderItem> wsOrderItemList = wsOrderItemService.findList(wsOrderItem);
		for (WsOrderItem item : wsOrderItemList) {
			item.setThumb(UrlUtils.getNetUrl(item.getThumb()));
			item.setWsOrder(wsOrder);
		}
		wsOrder.setWsOrderItemList(wsOrderItemList);

		model.addAttribute("wsMember", wsMember);
		model.addAttribute("wsOrder", wsOrder);
		return "modules/pc/webOrderPay";
	}

	/**
	 * 退款/退货
	 */
	@RequestMapping(value = "applyReturnOrder")
	public String applyReturnOrder(String itemId, String orderSn, Model model) {
		WsMember wsMember = wsMemberService.get("9a54940b4ddc4872a1eeb18a5aeb6324");
		WsOrderItem wsOrderItem = wsOrderItemService.get(itemId);
		model.addAttribute("wsOrderItem", wsOrderItem);
		model.addAttribute("orderSn", orderSn);
		return "modules/pc/webOrderApplyReturn";
	}
}
