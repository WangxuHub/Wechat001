<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountInfo.aspx.cs" Inherits="WeChat001.AccountInfo" %>

<%@ Register Src="~/UserControl/MobileHead.ascx" TagPrefix="uc1" TagName="MobileHead" %>
<%@ Register Src="~/UserControl/MobileTopNav.ascx" TagPrefix="uc1" TagName="MobileTopNav" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>账户信息</title>


    <uc1:MobileHead runat="server" id="MobileHead" />

    <style>
        .bot-link {
            width:50%;
            display:inline-block;
            text-align:center;
        }
    </style>

</head>
<body>
    <uc1:MobileTopNav runat="server" id="MobileTopNav" />
    <div id="vue-app">
        <p class="app-title">账户信息</p>
        <p class="p-content">
            <label>账户</label>
            <span class="ipt-content">{{account}}</span>
        </p>
        <p class="p-content">
            <label>昵称</label>
            <span class="ipt-content">{{nickName}}</span>
        </p>
        <p class="p-content">
            <label>账户余额</label>
            <span class="ipt-content">{{balance}}</span>
        </p>

        <p style="margin:20px 0">
            <button class="btn">充值</button>
        </p>

        <p>
            <div class="bot-link">
                <a class="app-link" href="RechargeLog.aspx">充值记录</a>
            </div><div class="bot-link">
                <a class="app-link" href="BatteryLog.aspx">充电记录</a>
            </div>
        </p>
    </div>
    <script>
        var vm = new Vue({
            el: '#vue-app',
            data: {
                account: '胡广',
                nickName: '小胡',
                balance:'200.00'
            }
        })
    </script>
</body>
</html>
