<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayDetail.aspx.cs" Inherits="WeChat001.PayDetail" %>

<%@ Register Src="~/UserControl/MobileHead.ascx" TagPrefix="uc1" TagName="MobileHead" %>
<%@ Register Src="~/UserControl/MobileTopNav.ascx" TagPrefix="uc1" TagName="MobileTopNav" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>结束充电</title>
    <uc1:MobileHead runat="server" ID="MobileHead" />
</head>
<body>
    <uc1:MobileTopNav runat="server" ID="MobileTopNav" />
    <div id="vue-app">
        <div class="app-title">
            <p style="font-size:14px;">充电消费提醒</p>
            <p style="font-size:12px;margin: 23px 0 49px;">尊敬的用户,您本次充电消费详情如下:</p>
        </div>
        <p class="p-content">
            <label>消费时间</label>
            <span class="ipt-content">2016年11月01日 12:12:12</span>
        </p>
        <p class="p-content">
            <label>消费金额</label>
            <span class="ipt-content">{{model.fee}}</span>
        </p>
        <p class="p-content">
            <label>充电方式</label>
            <span class="ipt-content">定时充</span>
        </p>
        <p class="p-content clearfix">
            <label>充电地点</label>
            <span class="ipt-content">莫干山路充电站</span>
        </p>
        <p class="p-content">
            <label>账户余额</label>
            <span class="ipt-content">100.00元</span>
        </p>
        <p style="text-align: center;margin-top: 16px;">
            <a class="app-link">
                查看历史充值记录
            </a>
        </p>
    </div>
    <script>
        var vm = new Vue({
            el: '#vue-app',
            data: {
                model: {
                    fee: '50.00元',
                }
            }
        });

    </script>
</body>
</html>
