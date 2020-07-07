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
        <title>公司信息展示</title>
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
                                <!-- remain space from top to next div -->
                               
                      
                        <div class="card bg-white m-b-30">
					<div class="card-body">
					<div class="form-group col-md-12">
                        	 <h4 class="header-title">所有公司信息展示</h4>
                         </div>
					<div class="general-label">
					<form method = "get"  action="/FinalProject/List_company_search_servlet">
					<div class="row">
	                      <div class="form-group col-md-2">
                                  
                           <select id="locate" name="locate" class="form-control">
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
						
                           <table id="datatable-buttons" class="table table-hover mb-0">
                                <thead>
                                <tr>
                                    <th>序号</th>
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
                                    <td>${U.id}</td>
                                    <td>${U.com_name}</td>
                                    <td>${U.cat}</td>
                                    <td>${U.com_addr}</td>
                                    <td>${U.financing}</td>
                                    <td>${U.born_data}</td>
                                    <td>${U.live_days}天</td>
                                    <td>
                                    	<a href="/FinalProject/list_show/company_do.jsp?id=${U.id}&number=${U.number}&com_name=${U.com_name}&com_addr=${U.com_addr}&cat=${U.cat}&se_cat=${U.se_cat}&com_des=${U.com_des}&born_data=${U.born_data} &death_data=${U.death_data} &live_days=${U.live_days}&financing=${U.financing}&total_money=${U.total_money}&death_reason=${U.death_reason}&invest_name=${U.invest_name}&ceo_name=${U.ceo_name}&ceo_des=${U.ceo_des}&ceo_per_des=${U.ceo_per_des}" class="btn btn-info">
											<i class="dripicons-document"></i> <span>详细</span>
										</a>
									</td>
                                </tr>
                               </c:forEach>
                                </tbody>
                            </table>
                            
                            
                        </div>
                    </div>
                </div>
                <!-- end row -->        
                                
                 
			
			</div> <!-- end wrapper -->
                                

                        </div><!-- container -->
					

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
                 pageLength: 10,　//初始化显示几条数据
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