<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="cn.fp.Fclass.*"   %>  
<%@page import="java.net.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <title>数据分析管理系统</title>
        <meta content="Admin Dashboard" name="description" />
        <meta content="Mannatthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        

        <!-- jvectormap -->
        <link href="assets/plugins/jvectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="assets/css/style.css" rel="stylesheet" type="text/css">

    </head>


    <body class="fixed-left">
	
        <!-- Loader -->
        <div id="preloader"><div id="status"><div class="spinner"></div></div></div>

        <!-- Begin page -->
        <div id="wrapper">

            <%
        String ip=InetAddress.getLocalHost().getHostAddress();
			%>

           <!-- 导入导航侧边栏 -->
    	<%@include file="/nav.jsp" %>

                    <div class="page-content-wrapper ">

                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="page-title-box">
                                        <div class="btn-group float-right">
                                            <ol class="breadcrumb hide-phone p-0 m-0">
                                                <li class="breadcrumb-item"><a href="#">-</a></li>
                                                <li class="breadcrumb-item active">主页</li>
                                            </ol>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <!-- end page title end breadcrumb -->
                            <div class="row">
                                
                                <div class="col-md-6">
                                    <div class="mini-stat clearfix bg-white">
                                        <div class="row align-items-center">
                                            <div class="col-3">
                                                <img src="assets/images/coins/lite.png" alt="" class="rounded-curcle">
                                            </div>
                                            <div class="col-4">
                                                <h4 class="counter text-dark m-0 pb-1"><%=ip %></h4>
                                                <i class="mdi mdi-arrow-up text-success"></i> <small class="text-success">您当前的IP地址</small>
                                            </div>
                                            
                                        </div>                                 
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <div class="mini-stat clearfix bg-white">
                                        <div class="row align-items-center">
                                            <div class="col-3">
                                                <img src="assets/images/coins/dash.png" alt="" class="rounded-curcle">
                                            </div>
                                            <div class="col-4">
                                                <h4 class="counter text-dark m-0 pb-1"><%=user.getUsername() %></h4>
                                                <i class="mdi mdi-arrow-up text-success"></i> <small class="text-success">您当前登录账户名</small>
                                            </div>
                                            
                                        </div>                                 
                                    </div>
                                </div>
                            </div>


                       

                </div> <!-- content -->

                <footer class="footer">
                    © 2020  by Wang Xizhong. 
                </footer>

            </div>
            <!-- End Right content here -->

        </div>
        <!-- END wrapper -->


        <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/modernizr.min.js"></script>
        <script src="assets/js/detect.js"></script>
        <script src="assets/js/fastclick.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/jquery.blockUI.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/jquery.nicescroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>

        <!--Morris Chart-->
        <script src="assets/plugins/flot-chart/jquery.flot.min.js"></script>
        <script src="assets/plugins/flot-chart/jquery.flot.time.js"></script>
        <script src="assets/plugins/flot-chart/curvedLines.js"></script>
        <script src="assets/plugins/flot-chart/jquery.flot.pie.js"></script>
        <script src="assets/plugins/morris/morris.min.js"></script>
        <script src="assets/plugins/raphael/raphael-min.js"></script>
        <script src="assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
        
        <script src="assets/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="assets/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>


        <script src="assets/pages/crypto-dash.init.js"></script>

        <!-- App js -->
        <script src="assets/js/app.js"></script>
        <script>
             
            $(document).ready(function() {        
            $("#boxscroll").niceScroll({cursorborder:"",cursorcolor:"#cecece",boxzoom:true});
            $("#boxscroll2").niceScroll({cursorborder:"",cursorcolor:"#cecece",boxzoom:true}); 
            });

        </script>


    </body>
</html>