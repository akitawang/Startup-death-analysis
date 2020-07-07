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
      <title>中国创业公司公墓  创业公司领域</title>
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
		<script type="text/javascript" src="/FinalProject/data_index/js/echarts.min.js"></script> 
   </head>
   <body>
   
      <!--header section start -->
      <div class="header_section">
     
         <%@include file="./nav.jsp" %>
         <div class="container">
         <div class="page-content-wrapper ">
      <div class="card bg-white m-b-30">
					<div class="card-body">
					<div class="general-label">
         <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                            <h4 class="header-title ">死亡公司领域</h4>
 
                                    <ul class="nav nav-pills navtab-bg nav-justified">
                                <li class="nav-item">
                                    <a href="#home" data-toggle="tab" aria-expanded="false" class="nav-link " >
                                        	数据图表
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#profile" data-toggle="tab" aria-expanded="true" class="nav-link active">
                                       	 数据详情
                                    </a>
                                </li>
                               <!-- <li class="nav-item">
                                    <a href="#messages" data-toggle="tab" aria-expanded="false" class="nav-link">
                                        Messages
                                    </a>
                                </li> -->
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane" id="home">
                                    
                                    <div id="main" style="width: 1000px;height:400px; "></div>
                                    
                                    
                                    
                                    
                                </div>
                                <div class="tab-pane show active" id="profile">
                                   
                                   <!--TABLE start -->
								      <div class="page-content-wrapper ">
								      <div class="card bg-white m-b-30">
										<div class="card-body">
										<div class="general-label">
										<form method = "get"  action="/FinalProject/field">
										<div class="row">
						                      <div class="form-group col-md-6">
					                                  
					                           <select id="field" name="field"  class="form-control">
					                           <option value="">公司领域</option>
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
											
					                           <table  class="table table-hover mb-0">
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
					                                    <td><font size="3.5" color="#cd5c5c">${U.cat}</font></td>
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
					                            
					                            <br>
					                            <div style="margin:0 auto;text-align:center;">
													<c:if test="${pageNos>0 }">
													<a href="field?field=<%=request.getParameter("field")%>&name=<%=request.getParameter("name")%>&pageNos=1" class="btn btn-light">首页</a>
													<a href="field?field=<%=request.getParameter("field")%>&name=<%=request.getParameter("name")%>&pageNos=${pageNos-1 }" class="btn btn-light">上一页</a>
													</c:if>
													<c:if test="${pageNos <recordCount }">
													<a href="field?field=<%=request.getParameter("field")%>&name=<%=request.getParameter("name")%>&pageNos=${pageNos+1 }" class="btn btn-light">下一页</a>
													<a href="field?field=<%=request.getParameter("field")%>&name=<%=request.getParameter("name")%>&pageNos=${recordCount }" class="btn btn-light">末页</a>
													</c:if>
												</div>
												<div style="margin:0 auto;text-align:center;">
													<form action="/FinalProject/field?field=<%=request.getParameter("field")%>&name=<%=request.getParameter("name")%>">
													<a  >共${recordCount}页 </a> 
													<a>       转到第</a>
													<input type="text" value="${pageNos}" name="pageNos" size="1" >页
													<input class="btn btn-light" type="submit" value="到达">
												</form>
												</div>
					                        </div>
					                    </div>
					                
					                </div> <!-- end wrapper -->   
					              <!--TABLE end -->                  
					           
								</div>



                                   
                                   
                                </div>
                                <!--<div class="tab-pane" id="messages">
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
                                    <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
                                </div>-->
                            </div>
                                    
                                </div> <!-- end col-->
                            </div> <!-- end row-->
                            
                        </div> <!-- end card-box-->
                    </div> <!-- end col -->
         		</div>
         		</div>
         		</div>
         		</div>
         		</div>
         
         
            	<!--搜索框下方留白-->
            	<div style="height:30px;"></div>
           
       
      
       
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
      <script type="text/javascript" src="/FinalProject/data_index/js/jquery.js"></script>
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
      window.onload = Searchfield();//加载页面时自动执行方法
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
		             alert("下拉列表地区数据加载出错，请重试！");
		         }
		     });
		 }
      
        </script>
        <script type="text/javascript">

        var dom = document.getElementById("main");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
                title : {
                    text: '<%=request.getParameter("field")%>  所在地区top10',
                    subtext: '',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient : 'vertical',
                    x : 'left',
                    data:[]
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {
                            show: true, 
                            type: ['pie', 'funnel'],
                            option: {
                                funnel: {
                                    x: '25%',
                                    width: '50%',
                                    funnelAlign: 'left',
                                    max: 1548
                                }
                            }
                        },
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                series : [
                    {
                        name:'',
                        type:'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:[]
                    }
                ]
            };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        //饼图动态赋值
        var year = $("#year-search").val();
            var mouth = $("#mouth-search").val();
            $.ajax({
                   type: "get",
                   url: "/FinalProject/ReasonShow_servlet?cat=<%=request.getParameter("field")%>",
                   data : {"year":year,"mouth":mouth},
                   cache : false,    //禁用缓存
                   dataType: "json",
                   success: function(result) {
                        var names=[];//定义两个数组
                          var nums=[];
                          $.each(result,function(key,values){ //此处我返回的是list<String,map<String,String>>循环map
                              names.push(values.name);
                              var obj = new Object();
                              obj.name = values.name;
                              obj.value = values.number;
                              nums.push(obj);
                           });
                        myChart.setOption({ //加载数据图表
                                  legend: {
                                        data: names
                                       },
                                series: {
                                        // 根据名字对应到相应的系列
                                        name: ['数量'],
                                        data: nums
                                        }    
                   });
                   },
                   error: function(XMLHttpRequest, textStatus, errorThrown) {
                       alert("查询失败");
                   }
               });
      
    </script>
   </body>
</html>

