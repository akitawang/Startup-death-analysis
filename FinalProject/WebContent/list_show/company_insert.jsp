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
        <title>大屏数据修改 - 公司信息添加</title>
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
                        	 <h4 class="header-title">添加新死亡的公司</h4>
                         </div>
					<div class="general-label">
					
					<div class="row">                                  
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">编号</label>
	                          <input  class="form-control" id="number" readonly="readonly" name="number"   value="">
	                      </div>
	                      
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">公司名称</label><a style="color:red;"> *</a>
	                          <input  class="form-control" id="com_name" name="com_name" value="">
	                      </div>
	                      <div class="form-group col-md-3">
                            <label for="exampleInputEmail1">所在区域</label>      <a style="color:red;"> *</a>
                           <select id="com_addr" name="com_addr" class="form-control">
                           <option value=""></option>
                           </select>
                          </div>
                      </div>
					<div class="row">
						 <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">所属领域</label><a style="color:red;"> *</a>
	                          <select id="cat" name="cat" class="form-control">
                           <option value=""></option>
                           </select>
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">所属子领域</label><a style="color:red;"> *</a>
	                          <input  class="form-control" id="se_cat" name="se_cat" value="">
	                      </div>
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">公司描述</label>
	                          <input  class="form-control" id="com_des"  name="com_des" value="">
	                      </div>
	                 </div> 
                      <div class="row">                                  
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">成立日期</label>
	                          <input  class="form-control" id="born_data" name="born_data" value="">
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">倒闭日期</label>
	                          <input  class="form-control" id="death_data"  name="death_data" value="">
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">存活时间</label>
	                          <input  class="form-control" id="live_days"  name="live_days" value="">
	                      </div>
	                       <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">投资公司</label>
	                          <input  class="form-control" id="invest_name" name="invest_name" value="">
	                      </div>
                      </div>
                      <div class="row">     
                       		<div class="form-group col-md-3">
                            <label for="exampleInputEmail1">融资情况</label>  <a style="color:red;"> *</a>    
                           <select id="financing" name="financing" class="form-control">
                           <option value=""></option>
                           </select>
                          </div>      
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">融资总额(万元)</label>
	                          <input  class="form-control" id="total_money"  name="total_money" value="">
	                      </div>
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">死亡原因</label>
	                          <input  class="form-control" id="death_reason" name="death_reason" value="">
	                      </div>
	                      
                      </div>
                      <div class="row">                                  
	                     
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">公司法人</label><a style="color:red;"> *</a>
	                          <input  class="form-control" id="ceo_name"  name="ceo_name" value="">
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">法人职位</label>
	                          <input  class="form-control" id="ceo_des" name="ceo_des" value="">
	                      </div>
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">CEO简介</label>
	                          <input  class="form-control" id="ceo_per_des" name="ceo_per_des" value="">
	                      </div>
                      </div>
                     
                      <div style="padding-left:40%">
                      <button  id="insert" class="btn btn-primary">添加</button>
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
			 $("#insert").click(function(){
   		          //得到input的值
   		          var id = $("#id").val();
   		      	  var number = $("#number").val();
   		      	  var com_name= $("#com_name").val();
   		       	  if(com_name==""){
					  alert("请填写公司名称！");
					  return false;
				  }
				  var com_addr= $("#com_addr").val();
   		       	  if(com_addr==""){
					  alert("请选择公司所在区域！");
					  return false;
				  }
				  var cat= $("#cat").val();
				  if(cat==""){
					  alert("请选择公司领域！");
					  return false;
				  }
				  var se_cat= $("#se_cat").val();
   		       	  if(se_cat==""){
					  alert("请填写公司子领域！");
					  return false;
				  }
				  var com_des= $("#com_des").val();
				  var born_data= $("#born_data").val();
				  var death_data= $("#death_data").val();
				  var live_days= $("#live_days").val();
				  var financing= $("#financing").val();
   		       	  if(financing==""){
					  alert("请选择融资情况！");
					  return false;
				  }
				  var total_money= $("#total_money").val();
				  if(total_money == ""){
					  total_money=0;
				  }
			      var death_reason= $("#death_reason").val();
			      var invest_name= $("#invest_name").val(); 
			      var ceo_name= $("#ceo_name").val();
   		       	  if(ceo_name==""){
					  alert("请填写CEO名称！");
					  return false;
				  }
			      var ceo_des= $("#ceo_des").val();
			      var ceo_per_des= $("#ceo_per_des").val();
   		          //设置linkToCart的href的值
   		          $.ajax({
	                url:"/FinalProject/List_company_insert_servlet?number="+number+"&com_name="+com_name+"&com_addr="+com_addr+"&cat="+cat+"&se_cat="+se_cat+"&com_des="+com_des+"&born_data="+born_data+"&death_data="+death_data+"&live_days="+live_days+"&financing="+financing+"&total_money="+total_money+"&death_reason="+death_reason+"&invest_name="+invest_name+"&ceo_name="+ceo_name+"&ceo_des="+ceo_des+"&ceo_per_des="+ceo_per_des,
	                type:"post",
	                success:function(data){
	                	if(data > 0){
	                		alert("操作成功");
	                		window.location.href='/FinalProject/List_company_servlet';
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
    		 
    		
    	
    		 window.onload = Searchlocate();//加载页面时自动执行方法
    		 window.onload = Searchfinancing();//加载页面时自动执行方法
    		 window.onload = Searchfield();
    		 function Searchlocate(){
    			 $.ajax({
    		         url: "/FinalProject/Campany_select_locate_servlet",  
    		         type: "post",
    		         dataType: "json",
    		         contentType: "application/json",
    		         traditional: true,
    		         success: function (data) {
    		             for (var i = 0; i < data.length; i++) {
    		                 var jsonObj =data[i];
    						 $("#com_addr").append("<option value='"+jsonObj.name+"'>" + jsonObj.name + "</option>");
    		             }
    		         },
    		         error: function (msg) {
    		             alert("下拉列表地区数据加载出错，请重试！");
    		         }
    		     });
    		 }
    		 function Searchfinancing(){
    			 $.ajax({
    		         url: "/FinalProject/Campany_select_financing_servlet",  
    		         type: "post",
    		         dataType: "json",
    		         contentType: "application/json",
    		         traditional: true,
    		         success: function (data) {
    		             for (var i = 0; i < data.length; i++) {
    		                 var jsonObj =data[i];
    						 $("#financing").append("<option value='"+jsonObj.name+"'>" + jsonObj.name + "</option>");
    		             }
    		         },
    		         error: function (msg) {
    		             alert("下拉列表融资情况数据加载出错，请重试！");
    		         }
    		     });
    		 }
    		 function Searchfield(){
    			 $.ajax({
    		         url: "/FinalProject/Campany_select_field_servlet",  
    		         type: "post",
    		         dataType: "json",
    		         contentType: "application/json",
    		         traditional: true,
    		         success: function (data) {
    		             for (var i = 0; i < data.length; i++) {
    		                 var jsonObj =data[i];
    						 $("#cat").append("<option value='"+jsonObj.name+"'>" + jsonObj.name + "</option>");
    		             }
    		         },
    		         error: function (msg) {
    		             alert("下拉列表融资情况数据加载出错，请重试！");
    		         }
    		     });
    		 }

</script>
</html>