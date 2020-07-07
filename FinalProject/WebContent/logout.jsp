<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <title>账户已锁定</title>
        <meta content="Admin Dashboard" name="description" />
        <meta content="Mannatthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="assets/css/style.css" rel="stylesheet" type="text/css">

    </head>


    <body>

        
        <!-- Begin page -->
        <div class="accountbg"></div>
        <div class="wrapper-page">

            <div class="card">
                <div class="card-body">

                    <h3 class="text-center mt-0 m-b-15">
                        <a href="index.html" class="logo logo-admin"><img src="assets/images/logo.png" height="24" alt="logo"></a>
                    </h3>
					<form class="form-horizontal m-t-20" action="/FinalProject/Lock_Log_Servlet">
                    <div class="p-3">
                        <div class="text-center">
                            <h5><i class="mdi mdi-lock mr-1 text-danger"></i>已锁定</h5>
                            <p class="text-muted pt-2 font-14">当前账户：<%=request.getParameter("name") %></p>
                        </div>
                        <div class="form-group row">
                                <div class="col-12">
                                    <input class="form-control" type="text" required="" name="username" readonly="" value="<%=request.getParameter("name") %>">
                                </div>
                        </div>
                        <div class="form-group row">
                                <div class="col-12">
                                    <input class="form-control" type="password" required="" name="userpass" placeholder="密码">
                                </div>
                        </div>
                        <div class="form-group text-center row m-t-20">
                            <div class="col-12">
                                <button type="submit" class="btn btn-danger btn-block waves-effect waves-light text-white">登录</button>
                            </div>
                        </div>
                    </div>  
                    </form>
                    <div class="form-group m-t-10 mb-0 row">
                                <div class="col-sm-7 m-t-20">
                                    <a href="login.html" class="text-muted"><i class="mdi mdi-lock"></i> <small>重新登陆</small></a>
                                </div>
                                
                            </div>

                </div>
            </div>
        </div>



        <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/modernizr.min.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/jquery.nicescroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.js"></script>

    </body>
</html>