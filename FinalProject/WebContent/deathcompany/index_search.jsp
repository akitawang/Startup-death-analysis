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
         <!--banner section start -->
         <div class="banner_section layout_padding">
            
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <div class="container">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="taital_main">
                                 <h4 class="banner_taital"style=" text-align:center">中国创业公司公墓</h4> <h2 style="color:white; text-align:center">近年破产公司数据库</h2>
                                 
                                  <p class="banner_text"  style="text-align:center;">
                                	  本破产公司数据库，从破产原因、 破产公司所属领域领域、融资情况等多维度呈现死亡公司全貌，全方位把握风口生死的命脉。 
                                  </p>
                                 
                                 
                              </div>
                           </div>
                        </div>
                       <div style="width:100%;height:100px;margin-top:100px;">
	                        <div style="border-radius: 15px 15px 15px 15px; width:170px;height:90px;top:68%;bottom: 0px; margin-left:13%;position: absolute;background-color:#ededef;">
	                        <div style="text-align:center;">
	                        	<font size="4" color="#003153" ><strong>2016年</strong></font>
	                        	<br/>
	                        	<font size="2" color="#003153"><strong>关闭公司   </strong></font>
	                        	<font size="6" color="#cd5c5c"> <strong> <%=request.getAttribute("year2016") %>  </strong></font>
	                        	<font size="2" color="#003153"><strong>家</strong></font>
	                        </div>
	                        
	                        </div>
	                       <div style="border-radius: 15px 15px 15px 15px;width:170px;height:90px;top:68%;bottom: 0px; margin-left:29%;position: absolute;background-color:#ededef;">
	                        <div style="text-align:center;">
	                        	<font size="4" color="#003153" ><strong>2017年</strong></font>
	                        	<br/>
	                        	<font size="2" color="#003153"><strong>关闭公司   </strong></font>
	                        	<font size="6" color="#cd5c5c"> <strong> <%=request.getAttribute("year2017") %>  </strong></font>
	                        	<font size="2" color="#003153"><strong>家</strong></font>
	                        </div>
	                       </div>
	                       <div style="border-radius: 15px 15px 15px 15px;width:170px;height:90px;top:68%;bottom: 0px; margin-left:44%;position: absolute;background-color:#ededef;">
	                        <div style="text-align:center;">
	                        	<font size="4" color="#003153" ><strong>2018年</strong></font>
	                        	<br/>
	                        	<font size="2" color="#003153"><strong>关闭公司   </strong></font>
	                        	<font size="6" color="#cd5c5c"> <strong> <%=request.getAttribute("year2018") %>  </strong></font>
	                        	<font size="2" color="#003153"><strong>家</strong></font>
	                        </div>
	                       </div>
                        	<div style="border-radius: 15px 15px 15px 15px;width:170px;height:90px;top:68%;bottom: 0px; margin-left:60%;position: absolute;background-color:#ededef;">
                        	 <div style="text-align:center;">
	                        	<font size="4" color="#003153" ><strong>2019年</strong></font>
	                        	<br/>
	                        	<font size="2" color="#003153"><strong>关闭公司   </strong></font>
	                        	<font size="6" color="#cd5c5c"> <strong> <%=request.getAttribute("year2019") %>  </strong></font>
	                        	<font size="2" color="#003153"><strong>家</strong></font>
	                        </div>
                        	</div>
                        </div>
                        
                       
                  </div>
                  
               </div>
               
            </div>
         </div>
         <!--banner section end -->
      </div>
      <!--header section end -->
      
      
       <!--category section start -->
      <div class="container">
         <div class="category_section">
           
      <!--TABLE start -->
      <div class="page-content-wrapper ">
      <div class="card bg-white m-b-30">
					<div class="card-body">
					<div class="general-label">
					<form method = "get"  action="/FinalProject/index_search">
					<div class="row">
	                      <div class="form-group col-md-2">
                                  
                           <select id="locate" name="locate"  class="form-control">
                           <option value="">地区</option>
                           </select>
                          </div>
						 
						 <div class="form-group col-md-2">
                                  
                                  <select id="financing" name="financing" class="form-control">
                                  <option value="">融资情况</option>
                                  </select>
                          </div>
                          
                          <div class="form-group col-md-2">
                                  
                                  <select id="born" name="born" class="form-control">
                                  <option value="">成立年份</option>
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
                                        <input type="text" class="form-control" id="name" name="name" placeholder="公司名称" value="">
                          </div>
                          <div class="form-group col-md-2">
                                       <button type="submit"  class="btn btn-primary">搜索</button>
                          </div>
                          
                      </div>
                   </form>      
                   
                   
					</div>
					</div>
					</div>
                                
                        <div class="row">
                    <div class="col-12">
                        <div class="card-box">
						
                           <table id="datatable-buttons"  class="table table-hover mb-0">
                                <thead>
                                <tr>
                                    <th>公司名称</th>
                                    <th>所属领域</th>
                                    <th>公司地点</th>
                                    <th>融资情况</th>
                                    <th>成立时间</th>
                                    <th>存活时间</th>
                                    <th>详细</th>
                                </tr>
                                </thead>


                                <tbody>
                                <c:forEach var="U" items="${list}" varStatus="status"> 
                                <tr>
                                    <td><font size="3.5">${U.com_name}</font></td>
                                    <td><font size="3.5">${U.cat}</font></td>
                                    <td><font size="3.5">${U.com_addr}</font></td>
                                    <td><font size="3.5">${U.financing}</font></td>
                                    <td><font size="3.5">${U.born_data}</font></td>
                                    <td><font size="3.5">${U.live_days}天</font></td>
                                    <td>
                                    	<a href="/FinalProject/deathcompany/death_company_info.jsp?id=${U.id}&number=${U.number}&com_name=${U.com_name}&com_addr=${U.com_addr}&cat=${U.cat}&se_cat=${U.se_cat}&com_des=${U.com_des}&born_data=${U.born_data} &death_data=${U.death_data} &live_days=${U.live_days}&financing=${U.financing}&total_money=${U.total_money}&death_reason=${U.death_reason}&invest_name=${U.invest_name}&ceo_name=${U.ceo_name}&ceo_des=${U.ceo_des}&ceo_per_des=${U.ceo_per_des}" class="btn btn-info">
											<i class="dripicons-document"></i> <span>详细</span>
										</a>
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
         </div>
        
      </div>
      <!-- category section end -->
     
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
      	 window.onload = Searchlocate();//加载页面时自动执行方法
		 window.onload = Searchfinancing();//加载页面时自动执行方法
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
		 
		 $(document).ready(function() {
             // Default Datatable
             $('#datatable').DataTable({
                 keys: true
             });

             //Buttons examples
             var table = $('#datatable-buttons').DataTable({
                 lengthChange: false,
                 buttons:[{
                     extend: 'copy',
                     text: '复制',
                 },{
                     extend: 'print',
                     text: '打印'
                 } ,'pageLength'　] ,
                 pageLength: 10,
                 lengthMenu: [　
                     [ 10, 20, -1],
                     [ '10 条', '20 条', '全部']
                 ],
                 language: {　　// 这是修改语言的显示
                     buttons: {
                         pageLength: {
                             _: "显示%d条",
                             '-1': "全部显示"
                         }
                     },
                     paginate: {
                         first: "首条",
                         previous: "前一页",
                         next: "下一页",
                         last: "末页"
                     },
                     "info": "第_PAGE_页,共_PAGES_页",
                     "infoEmpty": "未找到相关数据",
                     "search": "查找",
                     "zeroRecords": "未找到相关数据",
                     "decimal": ".",
                     "thousands": ",",
                     "Print":"打印",
                     "Copy":"复制内容"
                 }
             });

             table.buttons().container()
                     .appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
         } );
        </script>
   </body>
</html>

