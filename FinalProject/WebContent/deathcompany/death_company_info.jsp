<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="cn.fp.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>中国创业公司公墓首页</title>
      <!-- owl carousel style -->
      <link rel="stylesheet" type="text/css" href="/FinalProject/deathcompany/css/owl.carousel.min.css" />
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="/FinalProject/deathcompany/css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="/FinalProject/deathcompany/css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="/FinalProject/deathcompany/css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="/FinalProject/deathcompany/images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="/FinalProject/deathcompany/css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="/FinalProject/deathcompany/css/font-awesome.css">
       <!-- Sweet Alert css -->
        <link href="/FinalProject/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
      
      
      
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
 
   </head>
   <body>
   
      <!--header section start -->
      <div class="header_section">
     
         <%@include file="./nav.jsp" %>
         <!-- product section start -->
         <div class="container">
          <div class="category_section">
            <div class="card bg-white m-b-30">
					<div class="card-body" style="border: 1px solid white">
					<div class="form-group col-md-12">
                        	 <h1 class="header-title"><%=request.getParameter("com_name")%> 生平介绍</h1>
                         </div>
					<div class="general-label">
					<div class="row">                                  
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">编号</label>
	                          <input  class="form-control" id="number" readonly="readonly" name="number" value="<%=request.getParameter("number")%>">
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">序号</label>
	                          <input  class="form-control" id="id" readonly="readonly" name="id" value="<%=request.getParameter("id")%>">
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">公司名称</label>
	                          <input  class="form-control" id="com_name" name="com_name" readonly="readonly" value="<%=request.getParameter("com_name")%>">
	                      </div>
	                      <div class="form-group col-md-3">
                            <label for="exampleInputEmail1">所在区域</label>    
                            <input  class="form-control" readonly="readonly"id="com_addr" name="com_addr" value="<%=request.getParameter("com_addr")%>">  
                           
                          </div>
                      </div>
					<div class="row">
						 <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">所属领域</label>
	                          <input  class="form-control" readonly="readonly"id="cat" name="cat" value="<%=request.getParameter("cat")%>">
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">所属子领域</label>
	                          <input  class="form-control" readonly="readonly"id="se_cat" name="se_cat" value="<%=request.getParameter("se_cat")%>">
	                      </div>
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">公司描述</label>
	                          <textarea  class="form-control" readonly="readonly" id="com_des"  name="com_des"   rows="3"><%=request.getParameter("com_des")%></textarea>
	                      </div>
	                 </div> 
                      <div class="row">                                  
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">成立日期</label>
	                          <input  class="form-control" readonly="readonly"id="born_data" name="born_data" value="<%=request.getParameter("born_data")%>">
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">倒闭日期</label>
	                          <input  class="form-control" readonly="readonly" id="death_data"  name="death_data" value="<%=request.getParameter("death_data")%>">
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">存活时间</label>
	                          <input  class="form-control" readonly="readonly" id="live_days"  name="live_days" value="<%=request.getParameter("live_days")%>">
	                      </div>
	                       <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">投资公司</label>
	                          <input  class="form-control" readonly="readonly" id="invest_name" name="invest_name" value="<%=request.getParameter("invest_name")%>">
	                      </div>
                      </div>
                      <div class="row">     
                       		<div class="form-group col-md-3">
                            <label for="exampleInputEmail1">融资情况</label>      
                            <input  class="form-control" readonly="readonly" id="financing"  name="financing" value="<%=request.getParameter("financing")%>">
                           
                          </div>      
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">融资总额(元)</label>
	                          <input  class="form-control" readonly="readonly" id="total_money"  name="total_money" value="<%=request.getParameter("total_money")%>0,000">
	                      </div>
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">死亡原因</label>
	                          <input  class="form-control" readonly="readonly" id="death_reason" name="death_reason" value="<%=request.getParameter("death_reason")%>">
	                      </div>
	                      
                      </div>
                      <div class="row">                                  
	                     
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">公司法人</label>
	                          <input  class="form-control" readonly="readonly" id="ceo_name"  name="ceo_name" value="<%=request.getParameter("ceo_name")%>">
	                      </div>
	                      <div class="form-group col-md-3">
	                          <label for="exampleInputEmail1">法人职位</label>
	                          <input  class="form-control" readonly="readonly" id="ceo_des" name="ceo_des" value="<%=request.getParameter("ceo_des")%>">
	                      </div>
	                      <div class="form-group col-md-6">
	                          <label for="exampleInputEmail1">CEO简介</label>
	                          <textarea  class="form-control" readonly="readonly" id="ceo_per_des"  name="ceo_per_des"   rows="3"><%=request.getParameter("ceo_per_des")%></textarea>
	                          
	                      </div>
                      </div>
                      <div style="padding-left:45%">
                      <a onClick="javascript :history.back(-1);"><button class="btn btn-primary">返回</button></a>
                      <button  id="sa-image" class="btn btn-warning">上香</button>
                      </div>
                      </div>
                      </div>
                      </div>
         </div>
         </div>
      <!-- product section end -->
      </div>
      
      <!-- footer section start -->
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-12 col-sm-12">
                  <h4 class="information_text" >死亡公司数据库网页声明</h4>
                  <p class="dummy_text" >
					一、本网页基于开放数据库而打造的“死亡公司数据库”，致力于展现中国新经济领域近些年倒闭的创新创业公司；<br/>
					二、“死亡公司数据库”的公司关闭时间是依据公开媒体报道及部分估算，可能会存在些许误差，但我们着力确保更高的可靠性；<br/>
					三、本系统对所收录公司运营状况的判定来源如下：<br/>
					1、公开媒体报道公司关闭、破产清算的；<br/>
					2、公司自身在微信、微博等渠道宣布关闭、破产清算的；<br/>
					3、公司明显经营异常：公司被注销；公司产品比如APP或微信持续6个月及以上没更新；公司因为监管被抓、无法经营……交叉比对后确认没有持续经营。<br/>
					四、关于一切媒体采用“死亡公司数据库”撰写相关文章报道，媒体需要对使用该信息的结果承担可能的风险或损失，本网站不承诺承担连带责任。对于该部分信息，欢迎用户参与和我们一起完善，<br/>
					五、某些关闭公司，可能由于信息收录时间有所延误而未被列入数据库，如有未收录情况请及时联系我们；<br/>
					六、“死亡公司数据库”欢迎更多的人参与共建，如需对数据纠错或进行其他数据反馈，欢迎随时联系我们。<br/>
				</p>
               </div>
               
            </div>
            <div class="copyright_section">
               <h1 class="copyright_text">
                © 2020  by Wang Xizhong. </h1>
            </div>
         </div>
      </div>
      <!-- footer section end -->
      
      
      <!-- javascript --> 
      
      <script src="/FinalProject/deathcompany/js/jquery.fancybox.min.js"></script> 
      <script type="/FinalProject/deathcompany/js/owl.carousel.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
      <script>window.jQuery || document.write('<script src="/FinalProject/deathcompany/assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
      
      <script src="/FinalProject/deathcompany/js/bootstrap.min.js"></script>
       
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
		<!-- Sweet Alert Js  -->
        <script src="/FinalProject/assets/libs/sweetalert2/sweetalert2.min.js"></script>
        <script src="/FinalProject/assets/js/jquery.sweet-alert.init.js"></script>


      
      
      <script type="text/javascript">
      	 function verify(){
      		 var vname =  $("#name").val();
      		 var vlocate =  $("#locate").val();
      		 var vfinancing =  $("#financing").val();
      		 var vborn =  $("#born").val();
      	 }
      	
      	 
      	 $('#sa-image').click(function () {
             swal({
                 title: '操作成功',
                 text: '您已成功为公司：<%=request.getParameter("com_name")%>  上香',
                 imageUrl: ' ',
                 imageHeight: 50,
                 animation: false,
                 confirmButtonClass: 'btn btn-confirm mt-2'
             })
         });
        </script>
   </body>
</html>

