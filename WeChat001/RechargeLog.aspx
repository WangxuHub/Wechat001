<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RechargeLog.aspx.cs" Inherits="WeChat001.RechargeLog" %>

<%@ Register Src="~/UserControl/MobileHead.ascx" TagPrefix="uc1" TagName="MobileHead" %>
<%@ Register Src="~/UserControl/MobileTopNav.ascx" TagPrefix="uc1" TagName="MobileTopNav" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>充值记录</title>
    <uc1:MobileHead runat="server" ID="MobileHead" />
    
    <style>
        body {
            background:rgb(235,235,235);
        }

        .searchDiv {
            margin-top: 9px;
        }

        .searchDiv p {
            background: rgb(255,255,255);
            margin-bottom: 2px;
            padding: 10px 14px 10px 8px;
            font-size: 14px;
        }

        .searchDiv .search-value {
            float: right;
            font-size: 12px;
            color: rgb( 27, 157, 230 );
            border:none;
        }

        .order {
            display: inline-block;
            width: 64px;
            height: 22px;
            background: rgb(255,255,255);
            font-size: 12px;
            color: rgb( 117, 117, 117 );
            border: 1px solid rgb(206,206,206);
            text-align: left;
            line-height: 18px;
            padding-left: 6px;
            border-radius:2px;
        }
        .order-desc {
        
            margin-left:20px;
        }
        .order-icon {
            display: inline-block;
            float: right;
            display: inline-block;
            width: 20px;
            height: 9px;    

        }

        .order-asc .order-icon {
            background: url("/Resource/Images/zhengxun-icon.png") no-repeat;
            background-size: 12px;
            margin-top: 5px;
        }

        .order-asc.select .order-icon {
            background-position-y: -10px;
        }

        .order-desc .order-icon {
            background: url("/Resource/Images/daoxun-icon.png")no-repeat;
            background-size: 12px;
            margin-top: 5px;
        }

        .order-desc.select .order-icon {
            background-position-y: -9px;
        }

        #list {
            list-style:none;
        }
        #list li {
            margin: 0 15px 5px;
            background-color: #fff;
            border-radius:4px;
            padding:11px 15px 15px;
        }

        .conton-1 {
            width:80px;
            display:inline-block;
        }

        .conton-1 span {
            font-size:12px;
            color: rgb( 136, 136, 136 );
        }
        .title-1 {
            font-size:14px;
            font-weight: 500;
        }

        .title-2 {
            color: rgb(136,136,136 );
            font-size: 14px;
        }
        .conton-2 {
            float:right;
        }

        .fee {
            font-size: 24px;
            font-weight: 600;
            margin-top: 6px;
            display: inline-block;
            min-width: 105px;
        }

    </style>
</head>
<body>
    <div></div>
    <uc1:MobileTopNav runat="server" ID="MobileTopNav" />
    <div id="vue-app">
        <div class="searchDiv">
            <p>
                <label>年份</label>
                <select class="search-value">
                    <option>2014年</option>
                    <option>2015年</option>
                    <option>2016年</option>
                </select>
            </p>
            <p>
                <label>月份</label>
                <select class="search-value">
                    <option>1月</option>
                    <option>2月</option>
                    <option>3月</option>
                    <option>4月</option>
                    <option>5月</option>
                    <option>6月</option>
                    <option>7月</option>
                    <option>8月</option>
                    <option>9月</option>
                    <option>10月</option>
                    <option>11月</option>
                    <option>12月</option>
                </select>
            </p>
            <p>
                <label>地点</label>
                <select class="search-value">
                    <option></option>
                    <option>莫干山充电站</option>
                    <option>新文路充电站</option>
                    <option>广业街充电站</option>
                </select>
            </p>

        </div>
        <p style="text-align:center;margin:7px 0;">
            <span class="order order-asc" v-bind:class="{select:sortAsc}" v-on:click="querySort(true)">正序<span class="order-icon"></span>
            </span>
            <span class="order order-desc" v-bind:class="{select:!sortAsc}" v-on:click="querySort(false)">倒序<span class="order-icon"></span></span>
        </p>
        <ul id="list">
            <template v-for="item in Items">
                <li>
                    <div class="conton-1">
                        <div class="title-1">充值记录</div>
                        <span>{{item.week}} <br />{{item.date}}</span>
                    </div>
                    <div class="conton-2">
                        <div class="title-2">充值金额</div>
                        <span class="fee">￥{{item.fee}}</span>
                    </div>
                </li>
            </template>
        </ul>
        <p id="noMore" style="display:none;text-align: center;font-size: 14px;color:rgb(62,25,25);">没有更多数据了……</p>
    </div>
    <script>

        var vm = new Vue({
            el: "#vue-app",
            data: {
                Items: [
                 { week: '周五', date: '11月04日', fee: '200.00' },
                 { week: '周五', date: '11月04日', fee: '200.00' },
                 { week: '周五', date: '11月04日', fee: '200.00' },
                 { week: '周五', date: '11月04日', fee: '200.00' },
                 { week: '周五', date: '11月04日', fee: '200.00' }
                ],
                sortAsc: true
            },
            methods: {
                querySort: function (isAsc) {
                    this.sortAsc = isAsc;
                }
            }
        });


        window.loading = false;
        window.pageIndex = 1;
        window.pageSize = 20;
        window.isAll = false;
        loadData();

        $(window).scroll(function () {
            var scrollTop = $(this).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(this).height();
            if (scrollTop + windowHeight <= scrollHeight - 5) {
                return;
            }
            if (window.loading || window.isAll) {
                return;
            }
            loadData();
        });
        var tempIndex = 3;
        function loadData() {
            if (tempIndex <= 0) {
                isAll = true;
                $("#noMore").show();
                return;
            }
            window.loading = true;
            setTimeout(function () {
                tempIndex--;
                window.pageIndex++;

                vm.Items.push(
                   { week: '周四', date: '10月04日', fee: '200.00' }
                );
                window.loading = false;
            }, 200);
        }

    </script>
</body>
</html>
