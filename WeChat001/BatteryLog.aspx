﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatteryLog.aspx.cs" Inherits="WeChat001.BatteryLog" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>充电记录</title>
    <script src="Scripts/vue.js"></script>
</head>
<body>
    <div id="vue-app">
        <div>
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
                        <div>充点记录</div>
                        <span>消费时间 {{item.date}}</span>
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
                 { date: '2016年11月04日 12:55:12' },
                 { date: '2016年11月03日 01:22:44' },
                 { date: '2016年01月01日 07:07:33' },
                 { date: '2016年05月05日 05:04:22' },
                 { date: '2016年03月07日 03:02:12' }
                ]
            }
        });
    </script>
</body>
</html>
