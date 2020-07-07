<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="cn.fp.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <title>大屏数据修改 - 融资情况</title>
        <meta content="Admin Dashboard" name="description" />
        <meta content="Mannatthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- DataTables -->
        <link href="/FinalProject/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="/FinalProject/assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="/FinalProject/assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="/FinalProject/assets/libs/datatables.net-select-bs4/css/select.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <!-- Icons css -->
        <link href="/FinalProject/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="/FinalProject/assets/libs/dripicons/webfont/webfont.css" rel="stylesheet" type="text/css" />
        <link href="/FinalProject/assets/libs/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css" />

		 <!-- Datatable js -->
        <script src="/FinalProject/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="/FinalProject/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="/FinalProject/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="/FinalProject/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
        <!-- Buttons examples -->
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/buttons.colVis.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
        <!-- Key Tables -->
        <script src="/FinalProject/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <!-- Selection table -->
        <script src="/FinalProject/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>
        <!-- build:css -->
        <link href="/FinalProject/assets/css/app.css" rel="stylesheet" type="text/css" />
        
        <link href="/FinalProject/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="/FinalProject/assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="/FinalProject/assets/css/style.css" rel="stylesheet" type="text/css">

    </head>


    <body class="fixed-left">

        <!-- Loader -->
        <div id="preloader"><div id="status"><div class="spinner"></div></div></div>

        <!-- Begin page -->
        <div id="wrapper">

            <!-- ========== Left Sidebar Start ========== -->
            <%@include file="../nav.jsp" %>
             <!-- end sidebarinner -->
            
            <!-- Left Sidebar End -->

                    <div class="page-content-wrapper ">

                        <div class="container-fluid">

                             <div style="padding-top:20px"> </div>

                       
                      
                        <div class="card bg-white m-b-30">
					<div class="card-body">
					<div class="form-group col-md-12">
                        	 <h4 class="header-title">融资情况数据操作</h4>
                         </div>
					<div class="general-label">
					
					<div class="row">                                  
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">编号</label>
	                          <input type="number" class="form-control" id="id" readonly="readonly" name="id" value="<%=request.getParameter("id")%>">
	                      </div>
	                      
                      </div>
					<div class="row">
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">融资情况名称</label>
	                          <input type="text" class="form-control" id="name" name="name" readonly="readonly" value="<%=request.getParameter("name")%>">
	                      </div>
	                 </div> 
                      <div class="row">                                  
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">数量</label>
	                          <input type="number" class="form-control" id="number" name="number" value="<%=request.getParameter("number")%>">
	                      </div>
	                      
                      </div>
                      <div style="padding-left:40%">
                      <button  id="rec" class="btn btn-primary">修改</button>
                      <button  id="del" class="btn btn-danger">删除</button>  
                      </div>
                     
                   
					</div>
					</div>
					</div>
                   
                   
                        
                  </div>
					
                    </div> <!-- Page content Wrapper -->

                </div> <!-- content -->

                <footer class="footer">
                    © 2020 大数据可视化管理系统   by Wang Xizhong 
                </footer>

           


        <!-- jQuery  -->
        <script src="/FinalProject/assets/js/jquery.min.js"></script>
        <script src="/FinalProject/assets/js/popper.min.js"></script>
        <script src="/FinalProject/assets/js/bootstrap.min.js"></script>
        <script src="/FinalProject/assets/js/modernizr.min.js"></script>
        <script src="/FinalProject/assets/js/detect.js"></script>
        <script src="/FinalProject/assets/js/fastclick.js"></script>
        <script src="/FinalProject/assets/js/jquery.slimscroll.js"></script>
        <script src="/FinalProject/assets/js/jquery.blockUI.js"></script>
        <script src="/FinalProject/assets/js/waves.js"></script>
        <script src="/FinalProject/assets/js/jquery.nicescroll.js"></script>
        <script src="/FinalProject/assets/js/jquery.scrollTo.min.js"></script>

        <!-- App js -->
        <script src="/FinalProject/assets/js/app.js"></script>
        
        <!-- select2 js -->
        <script src="/FinalProject/assets/libs/select2/js/select2.min.js"></script>
        <script src="/FinalProject/assets/libs/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
        <script src="/FinalProject/assets/libs/mohithg-switchery/switchery.min.js"></script>
        <script src="/FinalProject/assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <!-- Mask input -->
        <script src="/FinalProject/assets/libs/jquery-mask-plugin/jquery.mask.min.js"></script>
        <!-- Bootstrap Select -->
        <script src="/FinalProject/assets/libs/bootstrap-select/js/bootstrap-select.min.js"></script>

        <script src="/FinalProject/assets/libs/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>

        <script src="/FinalProject/assets/libs/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>

        <script src="/FinalProject/assets/libs/moment/moment.js"></script>

        <script src="/FinalProject/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

        <script src="/FinalProject/assets/libs/bootstrap-daterangepicker/daterangepicker.js"></script>
		<!-- Parsley js -->
        <script type="text/javascript" src="/FinalProject/assets/libs/parsleyjs/parsley.min.js"></script>

        <!-- Init Js file -->
        <script src="/FinalProject/assets/js/jquery.form-advanced.js"></script>

        <!-- Datatable js -->
        <script src="/FinalProject/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="/FinalProject/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="/FinalProject/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="/FinalProject/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
        <!-- Buttons examples -->
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons/js/buttons.colVis.min.js" type="text/javascript"></script>
        <script src="/FinalProject/assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
        <!-- Key Tables -->
        <script src="/FinalProject/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <!-- Selection table -->
        <script src="/FinalProject/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>

        
        <!-- Toastr js -->
        <script src="/FinalProject/assets/libs/jquery-toast-plugin/jquery.toast.min.js"></script>
        <script src="/FinalProject/assets/js/jquery.toastr.js"></script>

    </body>
     <script>

    		
  		 $(document).ready(function() {
			 $("#rec").click(function(){
   		          //得到input的值
   		          var id = $("#id").val();
   		      	  var number = $("#number").val();
   		      	var name = $("#name").val();
   		          //设置linkToCart的href的值
   		          $.ajax({
	                url:"/FinalProject/Financing_rectify?id="+id+"&number="+number+"&name="+name,
	                type:"post",
	                success:function(data){
	                	if(data > 0){
	                		alert("操作成功");
	                		 window.location.href='/FinalProject/Financing_list_servlet';
	                	}
	                	else{
	                		alert("操作失败");
	                	}
	                },
	                error:function(data){
	                	alert("操作异常(请将以下内容截取给服务供应商以排除错误)：" +  data.responseText);
	                	
	                }
	            });
	            return false;
    		 });
  		});
    		 
    		 $(document).ready(function() {
    			 $("#del").click(function(){
   		          //得到input的值
   		          var namee = $("#name").val();
   		          var idd = $("#id").val();
   		          //设置linkToCart的href的值
   		          $.ajax({
	                url:"/FinalProject/Financing_del_servlet?id="+idd+"&name="+namee,
	                type:"post",
	                success:function(data){
	                	if(data > 0){
	                		alert("操作成功");
	                		 window.location.href='/FinalProject/Financing_list_servlet';
	                	}
	                	else{
	                		alert("操作失败");
	                	}
	                },
	                error:function(data){
	                	alert("操作异常(请将以下内容截取给服务供应商以排除错误)：" +  data.responseText);
	                	
	                }
	            });
	            return false;
   		         
   		      });
    		 });
    		 
    	
    		
    		 

</script>
</html>