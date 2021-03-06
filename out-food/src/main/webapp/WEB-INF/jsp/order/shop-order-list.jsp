<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/d" prefix="d"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%@ include file="../common/init.jsp" %>
    <link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script src="${ctx}/resources/js/jquery.min.js"></script>
		<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
    <title>
        <c:out value="${pageTitle}"/>
    </title>
    <link rel="stylesheet" href="${ctx}/resources/css/webBase.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/base.css"/>
    <%--
    <link rel="stylesheet" href="${ctx}/resources/home/css/head.css"/><!-- DD版 --> --%>
    <script src="${ctx}/resources/js/datepicker/WdatePicker.js"></script> <!--时间选择器 -->
    <script src="${ctx}/resources/js/jquery-1.10.1.min.js"></script>
    <script src="${ctx}/resources/js/main.js"></script>
</head>
<body ctx="${ctx}">
<%@ include file="../common/head1.jsp" %>
<%@ include file="../common/seller_head.jsp" %>
<%@ include file="../common/head_seller.jsp" %>
<div class="content content-box clear-float">
    <%@include file="../common/left_menu_seller.jsp" %>
    <div class="seller-center-info float-right">
        <p class="small-nav">
            <a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx}/order/getShopOrderList.html?status=0">订单管理</a>&gt;
            <c:if test="${status eq 0}"><a href="${ctx}/order/getShopOrderList.html?status=0">全部订单</a></c:if>
            <c:if test="${status eq 2}"><a href="${ctx}/order/getShopOrderList.html?status=2"><d:order code="2"/></a></c:if>
            <c:if test="${status eq 3}"><a href="${ctx}/order/getShopOrderList.html?status=3"><d:order code="3"/></a></c:if>
            <c:if test="${status eq 4}"><a href="${ctx}/order/getShopOrderList.html?status=4"><d:order code="4"/></a></c:if>
            <c:if test="${status eq 5}"><a href="${ctx}/order/getShopOrderList.html?status=5"><d:order code="5"/></a></c:if>
            <c:if test="${status eq 6}"><a href="${ctx}/order/getShopOrderList.html?status=6"><d:order code="6"/></a></c:if>

        </p>
        <!--搜索/导出-->
        <div class="pure-form pure-form-stacked" style="margin-top:10px;">
            <fieldset>
                <div class="pure-g">
                    <div class="pure-u-1 pure-u-md-1-8" style="width: auto;margin:0 15px 0 10px;">
                        <label>订单状态:</label>
                        <select class="search-by-status status-seller">
                            <option value="">全部</option>
                            <option value="0"
                            <c:if test="${status eq '0'}">selected</c:if>
                            >
                            <d:order code="0"/>
                            </option>
                            <option value="1"
                            <c:if test="${status eq '1'}">selected</c:if>
                            >
                            <d:order code="1"/>
                            </option>
                            <option value="2"
                            <c:if test="${status eq '2'}">selected</c:if>
                            >
                            <d:order code="2"/>
                            </option>
                            <option value="3"
                            <c:if test="${status eq '3'}">selected</c:if>
                            >
                            <d:order code="3"/>
                            </option>
                            <option value="4"
                            <c:if test="${status eq '4'}">selected</c:if>
                            >
                            <d:order code="4"/>
                            </option>
                            <option value="5"
                            <c:if test="${status eq '5'}">selected</c:if>
                            >
                            <d:order code="5"/>
                            </option>
                        </select>
                    </div>
                    <div class="pure-u-1 pure-u-md-1-8" style="width: auto;">
                        <label>下单时间:</label>
                        <input id="start-date" type="text" class="text-center Wdate" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'start-date\')}'})"
                               value="${startDate}"/>
                    </div>
                    <div class="pure-u-1 pure-u-md-1-8" style="width: auto;">
                        <label>&nbsp;</label>
                        <span style="line-height: 30px;margin: 0 5px;">&nbsp;到&nbsp;</span>
                    </div>
                    <div class="pure-u-1 pure-u-md-1-8" style="width: auto;margin-right: 15px;">
                        <label>&nbsp;</label>
                        <input id="end-date" type="text" class="text-center Wdate"
                               onFocus="WdatePicker({minDate:'#F{$dp.$D(\'start-date\')}'})" value="${endDate}"/>
                    </div>
                    <div class="pure-u-1 pure-u-md-1-8" style="width: auto;">
                        <label>订单号:</label>
                        <input id="keyword" type="text" placeholder="请输入订单号" value="${orderNum}">
                    </div>
                    <div class="pure-u-1 pure-u-md-1-8" style="width: auto;">
                        <label>&nbsp;</label>
                        <button class="search-seller layui-btn layui-btn-small button-red" style="margin-left: 20px;">
                            搜索
                        </button>
                    </div>
                    <div class="pure-u-1 pure-u-md-1-8" style="width: auto;">
                        <label>&nbsp;</label>
                        <button class="listOrderExport layui-btn layui-btn-small button-orange"
                                style="margin-left: 20px;" target="_blank" shop="true">批量导出
                        </button>
                    </div>
                </div>
            </fieldset>
        </div>
        <div class="user-data">
            <table class="user-data-title">
                <thead>
                <tr>
                    <!-- 							<td width="30%">商品信息</td>
                                                <td width="20%">商品规格</td>
                                                <td width="10%">单价(元)</td>
                                                <td width="7%">数量</td>
                                                <td width="13%">买家信息</td>
                                                <td width="8%">实付款(元)</td>
                                                <td width="12%">交易状态</td> -->
                    <!-- <td width="25%">订单号</td>
                    <td width="20%">下单时间</td>
                    <td width="13%">买家信息</td>
                    <td width="12%">实付款(元)</td>
                    <td width="12%">交易状态</td> -->
                </tr>
                </thead>
            </table>
            <c:forEach items="${orderList}" var="order" varStatus="status">
                <table class="user-data-list" style="margin-top: 0px;">
                    <input type="hidden" value="${order.status}" class="order-status"></input>
                    <input type="hidden" value="${order.orderNum}" class="order-num"></input>
                    <input type="hidden" value="${order.orderPrice}" class="order-price"></input>
                    <thead>
                    <tr>
                        <!-- 							<td width="30%">商品信息</td>
                                                    <td width="20%">商品规格</td>
                                                    <td width="10%">单价(元)</td>
                                                    <td width="7%">数量</td>
                                                    <td width="13%">买家信息</td>
                                                    <td width="8%">实付款(元)</td>
                                                    <td width="12%">交易状态</td> -->
                        <td width="18%">订单号</td>
                        <td width="20%">下单时间</td>
                        <td width="15%">买家信息</td>
                        <td width="15%">实付款(元)</td>
                        <td width="13%">订单状态</td>
                        <td width="20%">订单操作</td>
                    </tr>
                    </thead>
                    <tr>
                        <td style="text-align: center;"><label style="color:#CC2433">${order.orderNum}</label>
                        </td>
                        <td style="text-align: center;" class="border-right">
                            <fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td class="text-center border-right">
                            <label>${order.userName}</label><br/>
                            <label>${order.phone}</label>
                        </td>

                        <td class="text-center border-right">
                            <label style="color:#CC2433;font-weight: 700;">￥${order.orderPrice}</label><br/>
                        </td>
                        <td class="text-center border-right"
                            orderid="${orderDetail.orderId}"
                            orderno="${orderDetail.orderNum}"
                            orderprice="${orderDetail.orderPrice}"
                            shopid="${orderDetail.shopId}"
                            ud="${orderDetail.userId}">
                            <label style="color:#7F7F7F"><d:order code="${orderDetail.orderStatus}"/></label>
                        </td>
                        <td class="text-center"
                            orderid="${orderDetail.orderId}"
                            orderno="${orderDetail.orderNum}"
                            orderprice="${orderDetail.orderPrice}"
                            shopid="${orderDetail.shopId}"
                            ud="${orderDetail.userId}">
                            <c:if test="${order.status eq 0}">
                                <button class="layui-btn layui-btn-small order-detail" status="${order.status}"
                                   id="shop-tips" onclick="orderDetail(${order.id});" >订单详情</button>
                                   <button id="receive_${order.id}" class="layui-btn layui-btn-small button-orange send-goods" onclick="receiveOrder(${order.id});">确认接单</button>
                            </c:if>
                            
                            <c:if test="${order.status eq 1}">
                                <button class="layui-btn layui-btn-small order-detail" status="${order.status}"
                                   id="shop-tips" onclick="orderDetail(${order.id});">订单详情</button>
                                   <button class="layui-btn layui-btn-small button-orange send-goods" style= "color:#330000;background-color:#F1F1F1;">待骑士接单</button>
                            </c:if>
                    </tr>
                </table>
            </c:forEach>
            <div class="pageBox">
                ${pageInfo.pageBar}
            </div>
        </div>
    </div>
</div>

<!-- 发货弹框 -->
<div class="pop class-pop-update">
    <div class="pop-box w933">
        <h3 class="clear-float redText">填写快递信息<i class="colse sprite float-right"></i></h3>
        <div class="pop-data-list">
            <div class="pop-block">
                <input type="hidden" id="addressId_update">
                <table class="msg-text" style="font-size:13px;">
                    <tr>
                        <td align="right" width="30%">快递名称<em style="color: #DD3334;">*</em></td>
                        <td>
                            <select class="expressName">
                                <option value="">--请选择--</option>
                                <option value="shunfeng">顺丰速递</option>
                                <option value="yunda">韵达快递</option>
                                <option value="yuantong">圆通速递</option>
                                <option value="shentong">申通速递</option>
                                <option value="zhongtong">中通快递</option>
                                <option value="youzhengguonei">邮政包裹</option>
                                <option value="huitongkuaidi">百世汇通</option>
                                <option value="tiantian">天天快递</option>
                                <option value="ems">EMS</option>
                            </select>
                            <label style="color:#F13F4D" id="expressName-warning"></label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">快递运单号<em style="color: #DD3334;">*</em></td>
                        <td>
                            <input maxlength="45" type="text" class="textInput expressNum" size="30"/>&nbsp;&nbsp;&nbsp;
                            <label style="color:#F13F4D" id="expressNum-warning"></label>
                        </td>
                    </tr>
                </table>
                <button class="regBtn auto-center" id="processSendGoods-btn">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 底部信息 -->
<%@ include file="../common/footer.jsp" %>
<!-- 底部信息 -->
</body>
<script type="text/javascript">
function receiveOrder(id){
	$.ajax({
		type : 'POST',
		url : ctx + '/order/receiveOrder.html',
		dataType : 'json',
		data : {
			id : id,
		},
		success : function(data) {
			if(data.code=="101"){
				layer.msg(data.message,{offset: '200px'});
				document.getElementById("receive_"+id).style.color="#330000";
				 document.getElementById("receive_"+id).style.background="#F1F1F1";
				document.getElementById("receive_"+id).innerHtml="待骑士接单";
			}else if(data.code=="102"){
				layer.msg(data.message, {
				icon : 7,
				time : 2000,
				offset : '200px'})
			}else{
				layer.msg("系统故障!", {
					icon : 7,
					time : 2000,
					offset : '200px'})
			}
		}
	});
}
$('.search-seller').click(function () {
    var orderNum = $('#keyword').val();
    var start_date = $('#start-date').val();
    var end_date = $('#end-date').val();
    var status = $('.search-by-status').val();
    window.location.href = ctx + '/order/getShopOrderList.html?orderNum=' + orderNum + '&startDate=' + start_date + '&endDate=' + end_date  + '&status=' + status;
});
function orderDetail(id){
	 window.open(ctx + '/order/getOrderDetail/' + id + ".html");
}
</script>
</html>