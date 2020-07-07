<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="cn.fp.Fclass.*"   %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<%
	Admin user = (Admin)session.getAttribute("user");
	
	if(user==null)
	{
		response.setHeader("refresh", "0;url=/FinalProject/login.html");
	}
	
	else if(user!=null)
	{
	
%>
<!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">
                <button type="button" class="button-menu-mobile button-menu-mobile-topbar open-left waves-effect">
                    <i class="ion-close"></i>
                </button>

                <!-- LOGO -->
                <div class="topbar-left">
                    <div class="text-center">
                        <a href="/FinalProject/index.jsp" class="logo"><i class="mdi mdi-assistant"></i> 创业公司库管理系统</a>
                        <!-- <a href="index.html" class="logo"><img src="assets/images/logo.png" height="24" alt="logo"></a> -->
                    </div>
                </div>

                <div class="sidebar-inner slimscrollleft">

                    <div id="sidebar-menu">
                        <ul>
                            <li>
                                <a href="/FinalProject/index.jsp" class="waves-effect"><i class="mdi mdi-airplay"></i><span> 首页/控制台</span></a>
                            </li>
                            <li>
                                <a href="/FinalProject/Company_field_list_servlet" class="waves-effect"><i class="mdi mdi-vector-square"></i><span>公司所属领域修改 </span></a>
                            </li>
                            <li>
                                <a href="/FinalProject/Sub_type_list_servlet" class="waves-effect"><i class="mdi mdi-vector-polyline"></i><span>公司所属子领域修改 </span></a>
                            </li>
                            <li>
                                <a href="/FinalProject/Financing_list_servlet" class="waves-effect"><i class=" mdi mdi-led-on"></i><span>当前融资情况修改 </span></a>
                            </li>
                            <li>
                                <a href="/FinalProject/Invest_company_list_servlet" class="waves-effect"><i class=" mdi mdi-bullhorn"></i><span>投资公司情况修改 </span></a>
                            </li> 
                            <li>
                                <a href="/FinalProject/Map_list_servlet" class="waves-effect"><i class="mdi mdi-map"></i><span>地图信息修改 </span></a>
                            </li>  
                            <li>
                                <a href="/FinalProject/List_company_servlet" class="waves-effect"><i class="mdi mdi-bulletin-board"></i><span>公司信息修改 </span></a>
                            </li>  
                            <li>
                                <a href="/FinalProject/News_list_servlet" class="waves-effect"><i class="mdi mdi-new-box"></i><span>相关报道修改 </span></a>
                            </li>  
                        </ul>
                       
                    </div>
                    <div class="clearfix"></div>
                </div> <!-- end sidebarinner -->
            </div>
            <!-- Left Sidebar End -->

<!-- Start right Content here -->

            <div class="content-page">
                <!-- Start content -->
                <div class="content">

                    <!-- Top Bar Start -->
                    <div class="topbar">

                        <nav class="navbar-custom">

                            <ul class="list-inline float-right mb-0">
                                <!-- data index-->
                                <li class="list-inline-item dropdown notification-list">
                                    <a class="nav-link dropdown-toggle arrow-none waves-effect text-white" data-toggle="dropdown" href="#" role="button"
                                        aria-haspopup="false" aria-expanded="false">
                                                                                                                                              显示 <img src="/FinalProject/assets/images/index_data.png" class="ml-2" height="16" alt=""/>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-menu-lg">
                                       <div class="dropdown-item noti-title">
                                            <h5>欢迎</h5>
                                        </div>
                                        <!-- item-->
                                        <a href="/FinalProject/data_index/map.jsp" class="dropdown-item notify-item">
                                            <div class="notify-icon">
                                            	<img src="/FinalProject/assets/images/index_data2.png" alt="user-img" class="img-fluid rounded-circle" /> 
                                            </div>
                                            <p class="notify-details"><b>可视化大屏显示</b><small class="text-muted">数据大屏展示数据分析结果.便于直观感受数据信息</small></p>
                                        </a>
										<a href="/FinalProject/index" class="dropdown-item notify-item">
                                            <div class="notify-icon"><img src="/FinalProject/assets/images/index_data2.png" alt="user-img" class="img-fluid rounded-circle" /> </div>
                                            <p class="notify-details"><b>死亡公司公墓首页</b><small class="text-muted">全方位展示死亡公司的各种详细情况及分析</small></p>
                                        </a>
                                    </div>
                                   
                                </li>
                                

                                <li class="list-inline-item dropdown notification-list">
                                    <a class="nav-link dropdown-toggle arrow-none waves-effect nav-user" data-toggle="dropdown" href="#" role="button"
                                       aria-haspopup="false" aria-expanded="false" >
                                     	  <font color="white"> 欢迎您！<%=user.getUsername() %></font>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                        <!-- item-->
                                        <div class="dropdown-item noti-title">
                                            <h5>欢迎使用</h5>
                                        </div>
                                        <a class="dropdown-item" href="/FinalProject/me.jsp"><i class="mdi mdi-account-circle m-r-5 text-muted"></i> 我的</a>
                                        
                                        <a class="dropdown-item" href="/FinalProject/Lock_servlet?username=<%=user.getUsername() %>"><i class="mdi mdi-lock-open-outline m-r-5 text-muted"></i> 锁定账号</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="/FinalProject/Logout_servlet"><i class="mdi mdi-logout m-r-5 text-muted"></i> 登出</a>
                                    </div>
                                </li>

                            </ul>
							<!-- 
                            <ul class="list-inline menu-left mb-0">
                                <li class="float-left">
                                    <button class="button-menu-mobile open-left waves-light waves-effect">
                                        <i class="mdi mdi-menu"></i>
                                    </button>
                                </li>
                                <li class="hide-phone app-search">
                                    <form role="search" class="">
                                        <input type="text" placeholder="啊啊啊啊啊" class="form-control">
                                        <a href=""><i class="fa fa-search"></i></a>
                                    </form>
                                </li>
                            </ul>-->
 							
                            <div class="clearfix"></div>

                        </nav>

                    </div>
                    <!-- Top Bar End -->
                   
      <%} %>




</body>
</html>