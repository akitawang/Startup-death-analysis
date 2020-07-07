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
      <title>中国创业公司公墓 相关报道</title>
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
          <div style="padding-top:40px"> </div>
         
          
      <!--TABLE start -->
      <div class="page-content-wrapper ">
      <div class="card bg-white m-b-30">
					<div class="card-body">
					<div class="general-label">
					<form method = "get"  action="/FinalProject/report_search">
					<div class="row">
	                      <div class="form-group col-md-2">
                                  
                           <select id="locate" name="locate"  class="form-control">
                           <option value="">地区</option>
                           </select>
                          </div>
						 
						 <div class="form-group col-md-2"> 
                                  <select id="field" name="field" class="form-control">
                                  <option value="">所属行业</option>
                                  </select>
                          </div>
                          
                          <div class="form-group col-md-2">
                                  
                                  <select id="born" name="born" class="form-control">
                                  <option value="">发布时间</option>
                                  <option>2020</option>
                                  <option>2019</option>
                                  <option>2018</option>
                                  <option>2017</option>
                                  <option>2016</option>
                                  <option>2015</option>
                                  <option>2014</option>
                                  <option>2013</option>
                                  <option>2012</option>
                                  <option>2011</option>
                                  <option>2010</option>
                                  <option>2009</option>
                                  <option>2008</option>
                                  <option>2007</option>
                                  <option>2006</option>
                                  <option>2005</option>
                                  <option>2004</option>
                                  <option>2003</option>
                                  </select>
                          </div>
                          <div class="form-group col-md-4">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="新闻关键字" value="" />
                          </div>
                          <div class="form-group col-md-2">
                                       <button type="submit"  class="btn btn-primary">搜索</button>
                          </div>
                          
                      </div>
                   </form>      
                   
                   
					</div>
					</div>
					</div>
                        <div style="padding-top:30px"> </div>
                        <div class="row">
                    <div class="col-12">
                        <div class="card-box bg-white">
						
                           <table  id="datatable-buttons" class="table table-hover mb-0">
                                
                                <tbody>
                                <c:forEach var="U" items="${list}" varStatus="status"> 
                                <tr>
                                    <td>
	                                    <div style="padding-top:5px;padding-left:37px">
	                                    	<a href="${U.urll}" ><font color="black" size="4">${U.title}</font></a>
	                                    		<p style="font-weight: 300;font-size: 15px;line-height: 20px;margin:0px;">
	                                    			<font color="#ff441a"><strong>${U.company}</strong></font>
	                                    			&nbsp<font size="2.8">${U.field}</font>
	                                    			&nbsp<font size="2.8">${U.location}</font>
	                                    		</p>
	                                    		<p style="font-weight: 300;font-size: 15px;line-height: 20px;margin:0px;">
	                                    			
	                                    			<font size="2.8">${U.time}</font>
	                                    			&nbsp<font size="2.8">${U.from}</font>
	                                    		</p>
	                                    </div>
                                    </td>
                                    
                                </tr>
                               </c:forEach>
                                </tbody>
                                
                            </table>
                            
                            
                        </div>
                    </div>
                
                </div> <!-- end wrapper -->   
              <!--TABLE end -->                  
            </div>
            	<!--搜索框下方留白-->
            	<div style="height:30px;"></div>
            </div>
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

      
      
      <script type="text/javascript">
      	 function verify(){
      		 var vname =  $("#name").val();
      		 var vlocate =  $("#locate").val();
      		 var vfinancing =  $("#financing").val();
      		 var vborn =  $("#born").val();
      	 }
      	
      	window.onload = Searchlocate();//加载页面时自动执行方法
		 window.onload = Searchfield();//加载页面时自动执行方法
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
						 $("#locate").append("<option value='"+jsonObj.name+"'>" + jsonObj.name + "</option>");
		             }
		         },
		         error: function (msg) {
		             alert("下拉列表地区数据加载出错，请重试！");
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
						 $("#field").append("<option value='"+jsonObj.name+"'>" + jsonObj.name + "</option>");
		             }
		         },
		         error: function (msg) {
		             alert("下拉列表融资情况数据加载出错，请重试！");
		         }
		     });
		 }
      	 
		
        </script>
   </body>
</html>

