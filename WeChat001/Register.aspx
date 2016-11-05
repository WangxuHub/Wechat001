<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WeChat001.Register" %>

<%@ Register Src="~/UserControl/MobileHead.ascx" TagPrefix="uc1" TagName="MobileHead" %>
<%@ Register Src="~/UserControl/MobileTopNav.ascx" TagPrefix="uc1" TagName="MobileTopNav" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户注册</title>
    <uc1:MobileHead runat="server" ID="MobileHead" />

    <style>
        #vue-app {
            width:80%;
            margin:auto;
        }
        .btn {
            width: 100%;
            background-color: #04be02;
            font-size: 15px;
        }

        .ipt-text {
            width:100%;
            border:none;
            /*border-bottom:1px solid rgb(217,217,217);*/
            padding-left: 39px;
            height:26px;
        }
        .p-content {
            margin: auto;
            padding: 10px 0 2px;
        }
        .phone-icon {
            background:url(/Resource/Images/phone-icon.png) no-repeat 6px;
            background-size: 16px;
        }
        .id-icon {
            background:url(/Resource/Images/id-icon.png) no-repeat 6px;
            background-size: 16px;
        }
        .wechat-icon {
            background:url(/Resource/Images/weixin-icon.png) no-repeat 6px;
            background-size: 16px;
        }
    </style>
</head>
<body>
    <uc1:MobileTopNav runat="server" ID="MobileTopNav" />

    <div id="vue-app">
        <p class="app-title">账户注册</p>
        <p class="p-content">
            <input class="ipt-text phone-icon" placeholder="手机号"/>
        </p>
        <p class="p-content">
            <input class="ipt-text id-icon" placeholder="身份证号"/>
        </p>
        <p class="p-content">
            <input class="ipt-text wechat-icon" placeholder="微信号"/>
        </p>
        <p style="margin-top:20px;">
            <button class="btn">绑定注册</button>
        </p>
    </div>
</body>
</html>
