<%@ page pageEncoding="utf-8" contentType="text/html; utf-8" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Material Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=1" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png"/>
    <style type="text/css">
        @import url('${pageContext.request.contextPath}/css/admin.css');

        a:hover {
            background: rgba(0, 0, 0, 0.06);
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -ms-border-radius: 5px;
            -o-border-radius: 5px;
            border-radius: 5px;
        }
    </style>


</head>
<body>
<script type="text/javascript">
    function del(e) {
        if (confirm("确认要删除该单位和相关的刷卡机信息？")) {
            window.location.href = '/admin/unit/UnitDelete?id=' + e;
        }
    }

</script>
<div class="body-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <aside class="mdc-persistent-drawer mdc-persistent-drawer--open">
        <nav class="mdc-persistent-drawer__drawer">
            <div class="mdc-persistent-drawer__toolbar-spacer">
                <a href="index.html">
                    欢迎使用校园一卡通管理系统
                </a>
            </div>
            <div class="mdc-list-group">
                <nav class="mdc-list mdc-drawer-menu">
                    <div class="mdc-list-item mdc-drawer-item">
                        <a class="mdc-drawer-link " href="/admin/">
                            <%--<i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
                               aria-hidden="true">desktop_mac</i>
--%>
                            <i class="material-icons mdc-drawer-item-icon" aria-hidden="true">account_circle</i>
                            首页
                        </a>
                    </div>
                    <div class="mdc-list-item mdc-drawer-item">
                        <a class="mdc-drawer-link active" href="/admin/unit/">
                            <i class="material-icons mdc-drawer-item-icon" aria-hidden="true">group_work</i>
                            单位管理
                        </a>
                    </div>
                    <div class="mdc-list-item mdc-drawer-item">
                        <a class="mdc-drawer-link" href="/admin/ma/">
                            <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
                               aria-hidden="true">desktop_mac</i>

                            刷卡机管理
                        </a>
                    </div>
                    <div class="mdc-list-item mdc-drawer-item">
                        <a class="mdc-drawer-link" href="/admin/card/">
                            <i class="material-icons mdc-drawer-item-icon" aria-hidden="true">extension</i>
                            办卡中心管理
                        </a>
                    </div>
                    <div class="mdc-list-item mdc-drawer-item">
                        <a class="mdc-drawer-link" href="/admin/report/">
                            <i class="material-icons mdc-drawer-item-icon" aria-hidden="true">timeline</i>
                            统计报表管理
                        </a>
                    </div>
                    <div class="mdc-list-item mdc-drawer-item">
                        <a class="mdc-drawer-link " href="/admin/data/">
                            <i class="material-icons mdc-drawer-item-icon" aria-hidden="true">poll</i>
                            数据分析与挖掘
                        </a>
                    </div>
                </nav>
            </div>
        </nav>
    </aside>
    <!-- partial -->

    <!-- partial:partials/_navbar.html -->
    <header class="mdc-toolbar mdc-elevation--z4 mdc-toolbar--fixed">
        <div class="mdc-toolbar__row">
            <section class="mdc-toolbar__section mdc-toolbar__section--align-start">
                <a href="#" class="menu-toggler material-icons mdc-toolbar__menu-icon">menu</a>
                <span class="mdc-toolbar__input">
          </span>
            </section>
            <section class="mdc-toolbar__section mdc-toolbar__section--align-end" role="toolbar">
                <div class="mdc-menu-anchor mr-1">
                    <a href="#" class="mdc-toolbar__icon toggle mdc-ripple-surface" data-toggle="dropdown"
                       toggle-dropdown="logout-menu" data-mdc-auto-init="MDCRipple">
                        <i class="material-icons">more_vert</i>
                    </a>
                    <div class="mdc-simple-menu mdc-simple-menu--right" tabindex="-1" id="logout-menu">
                        <ul class="mdc-simple-menu__items mdc-list" role="menu" aria-hidden="true">
                            <li class="mdc-list-item" role="menuitem" tabindex="0">
                                <i class="material-icons mdc-theme--primary mr-1">settings</i>
                                Settings
                            </li>
                            <li class="mdc-list-item" role="menuitem" tabindex="0">
                                <i class="material-icons mdc-theme--primary mr-1">power_settings_new</i>
                                Logout
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </header>
    <!-- partial -->
    <div class="page-wrapper mdc-toolbar-fixed-adjust">
        <main class="content-wrapper">
            <div class="mdc-layout-grid">
                <div class="mdc-layout-grid__inner">
                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-10">

                        <form name="frm" action="/admin/unit/">
                            <div class="form-froup" style="float:left;margin-right:30px">
                                <label class="form-label">单位编号：</label><input class="form-control" type="number"
                                                                              name="id"
                                                                              id="id" value='${id}'>
                            </div>
                            <div class="form-group" style="float:left;margin-right:30px">
                                <label class="form-label">单位类型：</label>
                                <select class="form-control" name="type" id="type">
                                    <option value="">请选择</option>
                                    <option value="车队"     <c:if test="${type=='车队'}">${"selected"}</c:if>>车队</option>
                                    <option value="食堂窗口" <c:if test="${type=='食堂窗口'}">${"selected"}</c:if>>食堂窗口</option>
                                    <option value="售电窗口" <c:if test="${type=='售电窗口'}">${"selected"}</c:if>>售电窗口</option>
                                </select>
                            </div>
                            <button onclick="submit" class="btn btn-info" style="float:left;margin-top:32px"> 查找
                            </button>
                        </form>
                    </div>
                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-2">
                        <div id="toolbar" style="text-align:center;margin-right:10px;margin-top: 30px;">
                            <a class="btn btn-success" href="/admin/unit/UnitInsert">新增单位</a>
                        </div>
                    </div>

                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                        <table class="table table-hover" id="unit">
                            <thead>
                            <tr style="font-family: 'Arial Narrow'">
                                    <th class="text-left">单位编号</th>
                                    <th class="text-left">单位类型</th>
                                    <th class="text-left">单位账号</th>
                                    <th class="text-left">单位密码</th>
                                    <th class="text-left">单位联系方式</th>
                                <th class="text-left">操作</th>
                                </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${unit}" var="u">
                                <tr>
                                    <td class="text-left">&nbsp;&nbsp;${u.id}</td>
                                    <td class="text-left">&nbsp;&nbsp;${u.type}</td>
                                    <td class="text-left">&nbsp;&nbsp;${u.account}</td>
                                    <td class="text-left">&nbsp;&nbsp;${u.password}</td>
                                    <td class="text-left">&nbsp;&nbsp;${u.pnum}</td>

                                    <td class="text-left"><a class="btn btn-primary"
                                                             href='/admin/unit/UnitSelect?id=${u.id}'>修改</a>
                                        <button class="btn btn-danger" onclick="del(${u.id})">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </main>
        <!-- partial:partials/_footer.html -->
        <footer>
            <div class="mdc-layout-grid">
                <div class="mdc-layout-grid__inner">
                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6">
                        <span class="text-muted"></span>
                    </div>
                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6 d-flex justify-content-end">
                        <span class="mt-0 text-right">g2t006 单位管理</span>
                    </div>
                </div>
            </div>
        </footer>
        <!-- partial -->
    </div>
</div>
<!-- body wrapper -->

<!-- plugins:js -->
<script src="${pageContext.request.contextPath}/node_modules/material-components-web/dist/material-components-web.min.js"></script>
<script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.min.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<script src="${pageContext.request.contextPath}/node_modules/chart.js/dist/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/node_modules/progressbar.js/dist/progressbar.min.js"></script>
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="${pageContext.request.contextPath}/js/misc.js"></script>
<script src="${pageContext.request.contextPath}/js/material.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- End custom js for this page-->
</body>
</html>
