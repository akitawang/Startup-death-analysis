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
      <title>中国创业公司公墓 死亡原因</title>
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
         
         
         <!--category section start -->
      <div class="container">
      <div style="padding-top:60px"> </div>
        
           
      <!--TABLE start -->
      <div class="page-content-wrapper ">
      <div class="card bg-white m-b-30">
					<div class="card-body">
					<div class="general-label">
					<div class="row">
	                      <div class="form-group col-md-2">
                                  <h4><strong>市场定位</strong></h4>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=市场伪需求" id="a1">市场伪需求</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=商业模式匮乏" id="a2">商业模式匮乏</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=业务过于分散" id="a3">业务过于分散</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=业务调整" id="a4">业务调整</a></p>
                            
                          </div>
                          
						  <div class="form-group col-md-2">
                                  <h4><strong>团队问题</strong></h4>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=创始人问题" id="b1">创始人问题</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=与投资人冲突" id="b2">与投资人冲突</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=团队能力不足" id="b3">团队能力不足</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=团队缺乏激情" id="b4">团队缺乏激情</a></p>
                            
                          </div>
                          
						 <div class="form-group col-md-2"> 
                                  <h4><strong>产品问题</strong></h4>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=产品缺陷严重" id="c1">产品缺陷严重</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=产品入场时机" id="c2">产品入场时机</a></p>
                          </div>
                          
                          <div class="form-group col-md-2">
                                  <h4><strong>产品入场时机</strong></h4>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=烧钱" id="d1">烧钱</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=现金流断裂" id="d2">现金流断裂</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=融资能力不足" id="d3">融资能力不足</a></p>
                                 
                          </div>
                          <div class="form-group col-md-2">
                                   <h4><strong>运营问题</strong></h4>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=定价/成本问题" id="e1">定价/成本问题</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=营销不足" id="e2">营销不足</a></p> 
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=不重视客户" id="e3">不重视客户</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=转型问题" id="e4">转型问题</a></p>   
                          </div>
                          <div class="form-group col-md-2">
                                   <h4><strong>外部原因</strong></h4>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=政策监管" id="f1">政策监管</a></p>
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=法律法规风险" id="f2">法律法规风险</a></p>  
                                  <p style="margin-bottom: 0.1rem;font-size:0.6rem"><a href="/FinalProject/deathreason?reason=行业竞争" id="f3">行业竞争</a></p>
                          </div>
                          
                      </div>
					</div>
					</div>
					</div>
                               <div style="padding-top:10px"> </div>  
                    
					<!-- 图表展示模块 -->          
                   <div class="page-content-wrapper ">
      				<div class="card bg-white m-b-30">
					<div class="card-body">
					<div class="general-label">
                               
                        <div id="chartshow" style="width: 1080px;height:400px; "></div>
                    </div>
					</div>
					</div>
					</div>
					
					
                     <!-- 数据展示模块 -->              
                                <div class="category_section" style="background-color:white">
                        <div class="row">
                    <div class="col-12">
                        <div class="card-box">
						
                           <table  id="datatable-buttons" class="table table-hover mb-0 bg-white">
                                <thead>
                                <tr>
                                    
                                    <th>公司名称</th>
                                    <th>所属领域</th>
                                    <th>公司地点</th>
                                    <th>融资情况</th>
                                    <th>死亡原因</th>
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
                                    <td><font size="3.5" color="#cd5c5c"><%=request.getParameter("reason")%></font></td>
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
         
         
            	<!--搜索框下方留白-->
            	<div style="height:30px;"></div>
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
      
      
      $("document").ready(function(){
          $("#a1").click(function(){
        	  var reason = '市场伪需求';
 			
          });
       });
      
      $("document").ready(function(){
          $("#a2").click(function(){
        	  var reason = '商业模式匮乏';
        	  
            });
         });
      
      $("document").ready(function(){
          $("#a3").click(function(){
        	  var reason = '业务过于分散';
        	 
            });
         });
      
      $("document").ready(function(){
          $("#a4").click(function(){
        	  var reason = '业务调整' ;
        	 
            });
         });
      
      $("document").ready(function(){
          $("#b1").click(function(){
        	  var reason = '创始人问题' ;
        	  
            });
         });
      
      $("document").ready(function(){
          $("#b2").click(function(){
        	  var reason = '与投资人冲突' ;
        	  
            });
         });
      
      $("document").ready(function(){
          $("#b3").click(function(){
        	  var reason = '团队能力不足' ;
        	  
            });
         });
      
      $("document").ready(function(){
          $("#b4").click(function(){
        	  var reason = '团队缺乏激情' ;
        	 
            });
         });
      
      $("document").ready(function(){
          $("#c1").click(function(){
        	  var reason = '产品缺陷严重' ;
        	 
              });
           });
        
      $("document").ready(function(){
          $("#c2").click(function(){
        	  var reason = '产品入场时机' ;
        	  
              });
           });
        
      $("document").ready(function(){
          $("#d1").click(function(){
        	  var reason = '烧钱' ;
        	  
              });
           });
        
      $("document").ready(function(){
          $("#d2").click(function(){
        	  var reason = '现金流断裂' ;
        	 
              });
           });
        
      $("document").ready(function(){
          $("#d3").click(function(){
        	  var reason = '融资能力不足' ;
        	 
              });
           });
        
      $("document").ready(function(){
          $("#e1").click(function(){
        	  var reason = '定价/成本问题' ;
        	 
              });
           });
        
      $("document").ready(function(){
          $("#e2").click(function(){
        	  var reason = '营销不足' ;
        	  
              });
           });
        
      $("document").ready(function(){
          $("#e3").click(function(){
        	  var reason = '不重视客户' ;
        	 
              });
           });
        
      $("document").ready(function(){
          $("#e4").click(function(){
        	  var reason = '转型问题' ;
        	
              });
           });
        
      $("document").ready(function(){
          $("#f1").click(function(){
        	  var reason = '政策监管' ;
        	 
              });
           });
        
      $("document").ready(function(){
          $("#f2").click(function(){
        	  var reason = '法律法规风险' ;
        	  
              });
           });
        
      $("document").ready(function(){
          $("#f3").click(function(){
        	  var reason = '行业竞争' ;
        	 
              });
           });
        
      
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
              language: {
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
                <script type="text/javascript">

        var dom = document.getElementById("chartshow");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
                title : {
                    text: '<%=request.getParameter("reason")%>  代表领域top10',
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
                   url: "/FinalProject/Company_field_show_servlet?reason=<%=request.getParameter("reason")%> " ,
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

