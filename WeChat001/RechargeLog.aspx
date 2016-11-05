<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RechargeLog.aspx.cs" Inherits="WeChat001.RechargeLog" %>

<%@ Register Src="~/UserControl/MobileHead.ascx" TagPrefix="uc1" TagName="MobileHead" %>
<%@ Register Src="~/UserControl/MobileTopNav.ascx" TagPrefix="uc1" TagName="MobileTopNav" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>充值记录</title>
    <uc1:MobileHead runat="server" ID="MobileHead" />
</head>
<body>
    <uc1:MobileTopNav runat="server" ID="MobileTopNav" />
    <div id="vue-app">
        <div >
            <p>
                <label>年份</label>
            </p>
            <p>
                <label>月份</label>
            </p>
            <p>
                <label>地点</label>
            </p>

        </div>
        <p>
            <span>正序</span>
            <span>倒序</span>
        </p>
        <ul>
            <template v-for="item in Items">
                <li>
                    <div>
                        <div>充值记录</div>
                        <span>{{item.week}} {{item.date}}</span>
                    </div>
                    <div>
                        <div>充值金额</div>
                        <span>￥{{item.fee}}</span>
                    </div>
                </li>
            </template>
        </ul>
    </div>
    <script>
        var vm = new Vue({
            el: "#vue-app",
            data: {
                Items: [
                 { week: '周五', date: '11月04日', fee: '200.00' },
                 { week: '周日', date: '11月03日', fee: '100.00' },
                 { week: '周一', date: '04月04日', fee: '20.00' }
                ]
            }
        });
    </script>
</body>
</html>
