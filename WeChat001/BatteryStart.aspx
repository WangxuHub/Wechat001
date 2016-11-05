<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatteryStart.aspx.cs" Inherits="WeChat001.BatteryStart" %>

<%@ Register Src="~/UserControl/MobileHead.ascx" TagPrefix="uc1" TagName="MobileHead" %>
<%@ Register Src="~/UserControl/MobileTopNav.ascx" TagPrefix="uc1" TagName="MobileTopNav" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>开始充电</title>
    <uc1:MobileHead runat="server" ID="MobileHead" />
    <style>
        
        #vue-app {
            width:80%;
            margin:auto;
        }

        .battery-type {
            display: inline-block;
            text-align: center;
            height: 37px;
            width: 75px;
            border: 1px solid rgb(232,232,232);
            color: rgb( 66, 66, 66 );
            line-height: 33px;
            font-size: 12.8px;
        }
        .battery-type.select {
            background-color:#1b9de6;
            color:rgb(255,255,255);
        }

        .col-4 {
            display: inline-block;
            width: 33.333333333%;
            vertical-align: bottom;
        }

        .ipt-value {
            width:100%;
            height:35px;
            padding-left: 10px;
        }

        .btn {
            width: 100%;
            background-color: #04be02;
            font-size: 15px;
        }
        .info {
            color: rgb( 102, 102, 102 );
            font-size: 12px;
            margin-top: 48px;
        }
    </style>
</head>
<body>
    <uc1:MobileTopNav runat="server" ID="MobileTopNav" />
    <div id="vue-app">
        <p class="app-title">请选择充电方式</p>
        <div>
            <div class="col-4">
                <span class="battery-type select">定额充</span>
            </div><div class="col-4" style="text-align:center;">
                <span class="battery-type">定时充</span>
            </div><div class="col-4">
                <span class="battery-type"  style="float:right;">任意充</span>
            </div>
        </div>
        <p style="margin-top: 10px;">
            <input type="number" placeholder="请输入金额" class="ipt-value"/>
        </p>

        <p class="info">您的账户余额100.00,将一次性充完</p>
        <p>
            <button class="btn">开始充电</button>
        </p>
        <p style="text-align: center; margin-top: 10px;"><a class="app-link">当前余额不足,进入充值</a></p>

    </div>
</body>
</html>
