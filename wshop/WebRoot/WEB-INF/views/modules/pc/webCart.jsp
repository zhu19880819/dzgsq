<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="pc_shop" />
<title>${prod:getParam('shopTitle').paramValue}</title>
<style type="text/css">
.new-li a {
	color: #9D9D9D;
}

.new-li a:hover {
	color: white;
}
</style>
</head>
<body>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="user-content__box clearfix bgf">
				<div class="title">购物车</div>
				<form action="hd_shopcart_pay.html" class="shopcart-form__box">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="150"><label class="checked-label"><input
										type="checkbox" class="check-all"><i></i> 全选</label></th>
								<th width="300">商品信息</th>
								<th width="150">单价</th>
								<th width="200">数量</th>
								<th width="200">现价</th>
								<th width="80">操作</th>
							</tr>
						</thead>
						<tbody>
						    <c:forEach items="${wsCartList}" var="wsCart">
							<tr>
								<th scope="row"><label class="checked-label"><input type="checkbox" value="${wsCart.id}"><i></i>
										<div class="img">
											<img src="${wsCart.thumb}" alt="" class="cover">
										</div> </label></th>
								<td>
									<div class="name ep3">${wsCart.title}</div>
									<div class="type c9">${wsCart.skuSpec}</div>
								</td>
								<td>${wsCart.unitPrice}</td>
								<td>
									<div class="cart-num__box">
										<input type="button" class="sub" value="-" price="${wsCart.price}"> 
										<input type="text" class="val" value="1" maxlength="2" price="${wsCart.price}" onchange="sumPrice()"> 
										<input type="button" class="add" value="+" price="${wsCart.price}">
									</div>
								</td>
								<td class="price">${wsCart.price}</td>
								<td><a href="${ctxWeb}/cart/delete?id=${wsCart.id}">删除</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="user-form-group tags-box shopcart-submit pull-right">
						<button type="submit" class="btn">提交订单</button>
					</div>
					<div class="checkbox shopcart-total">
						<label><input type="checkbox" class="check-all"><i></i>
							全选</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a id="deleteAll"  href="javascript:void(0);"  onclick="cleanCart()">删除</a>
						<div class="pull-right">
							已选商品 <span id="num">${num}</span> 件 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合计（不含运费） <b
								class="cr">¥<span class="fz24">${totalPrice}</span></b>
						</div>
					</div>
					<script>
						$(document).ready(function() {
											var $item_checkboxs = $('.shopcart-form__box tbody input[type="checkbox"]'), $check_all = $('.check-all');
											// 全选
											$check_all.on('change',function() {
													$check_all.prop('checked',$(this).prop('checked'));
													$item_checkboxs.prop('checked',$(this).prop('checked'));
												});
											// 点击选择
											$item_checkboxs.on('change',function() {
												   var flag = true;
													$item_checkboxs.each(function() {
														if (!$(this).prop('checked')) {flag = false}});
															$check_all.prop('checked',flag);
												});
											
											
											// 个数限制输入数字
											$('input.val').onlyReg({
												reg : /[^0-9.]/g
												
											});
											// 加减个数
											$('.cart-num__box').on('click','.sub,.add',
															function() {
																var value = parseInt($(this).siblings('.val').val());
																var prodprice=$(this).attr("price");
																if ($(this).hasClass('add')) {
																	$(this).siblings('.val')
																			.val(Math.min((value += 1),99));
																	
																        sumPrice();
																        
																} else {
																	$(this).siblings('.val').val(Math.max((value -= 1),1));
																	sumPrice();
																}
															});
										});
						//删除
						 function cleanCart(){ 
							  if(confirm('确定要删除所选吗?')){ 
							     var checks = $("input[type='checkbox']:checked");
							     if(checks.length == 0){ alert('未选中任何项！');return false;}
								     //将获取的值存入数组   
								     var checkData = new Array();
								     checks.each(function(){ 
								       checkData.push($(this).val()); 
								     });   
								     var newUrl = "${ctxWeb}/cart/batchdelete?id="+checkData.toString();   
								     window.location.href=newUrl;
							     }
						}
						 function sumPrice(){
							 var checks = $(".sub");
							 var sumPrice=0.0;
							 checks.each(function(){ 
							       sumPrice=sumPrice+parseFloat($(this).siblings('.val').val())*parseFloat($(this).attr("price"));
							     });   
							 sumPrice.toFixed(2);
							 $(".fz24").text(sumPrice);
							 cartNum();
						}
						 function cartNum(){
							 var checks = $(".sub");
							 var num=0;
							 checks.each(function(){ 
							       num=num+parseInt($(this).siblings('.val').val());
							     });   
							 $("#num").text(num);
						}
					</script>
				</form>
			</div>
		</section>
	</div>
</body>
</html>