<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatteryLog.aspx.cs" Inherits="WeChat001.BatteryLog" %>

<%@ Register Src="~/UserControl/MobileHead.ascx" TagPrefix="uc1" TagName="MobileHead" %>
<%@ Register Src="~/UserControl/MobileTopNav.ascx" TagPrefix="uc1" TagName="MobileTopNav" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>充电记录</title>
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
            padding:11px 15px 2px;
        }

        .title-1 {
            font-size: 14px;
        }

        .content-1 {
            font-size: 13px;
            color: rgb(136,136,136 );
        }
        .detail {
            background: url(/Resource/Images/down-detail.png) no-repeat center center;
            display: block;
            width: 80px;
            height: 25px;
            margin: auto;
            background-size: 15px;
            transition: all 0.5s ease;
        }
        .detail.down {
            transform: rotate(180deg);
        }

        .info {
            transition: all 0.5s ease;
            height:0px;
            display:block;
            overflow:hidden;
            font-size:13px;
        }
        .info.down {
            height:60px;
        }

    </style>
</head>
<body>
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
                    <div class="title-1">充电记录</div>
                    <span class="content-1">消费时间：{{item.date}}</span>
                    <span class="info">{{item.detail}}</span>
                    <span class="detail" v-on:click="showDetail"></span>
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
                 { date: '2016年11月04日 12:55:12' ,detail:'详细数据'},
                 { date: '2016年11月03日 01:22:44' ,detail:'详细数据' },
                 { date: '2016年01月01日 07:07:33' },
                 { date: '2016年05月05日 05:04:22' },
                 { date: '2016年03月07日 03:02:12' }
                ],
                sortAsc: true
            },
            methods: {
                querySort: function (isAsc) {
                    this.sortAsc = isAsc;
                },
                showDetail: function (e) {
                    var $curDom = $(e.target);
                    if ($curDom.hasClass('down')) {
                        $curDom.siblings('.info').removeClass('down');
                        $curDom.removeClass('down');
                    }
                    else {
                        $curDom.addClass('down');
                        $curDom.siblings('.info').addClass('down');
                    }
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
                   { date: '2014年03月07日 03:02:12', detail: '详细数据' }
                );
                window.loading = false;
            }, 200);
        }
    </script>
</body>
</html>
