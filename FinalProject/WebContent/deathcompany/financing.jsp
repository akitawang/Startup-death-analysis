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
      <title>中国创业公司公墓 烧钱情况</title>
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
                            <h4 class="header-title ">烧钱榜</h4>

                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="nav flex-column nav-pills nav-pills-tab" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                        <a class="nav-link active show mb-2" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home"
                                            aria-selected="true">
                                           		    数据图表</a>
                                        <a class="nav-link mb-2" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile"
                                            aria-selected="false">
                                            	融资额TOP100榜单</a>
                                        <a class="nav-link mb-2" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages"
                                            aria-selected="false">
                                           		 机构TOP100榜单</a>
                                        <!--<a class="nav-link mb-2" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings"
                                            aria-selected="false">
                                            Settings</a> -->
                                    </div>
                                </div> <!-- end col-->
                                <div class="col-sm-9">
                                    <div class="tab-content pt-0">
                                        <div class="tab-pane fade active show" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                             
                                             
										    	<div id="e_left" style="width:800px;height:400px;"></div>
										     
										    	<div id="e_right"  ></div>
                                              
                                             
                                             <span>在所有倒下的这些企业中，52.7%的企业获投信息不明确，29.8%的企业尚未获得投资。14.9%的创业公司倒在了B轮之前，1.11%的创业企业倒在了B（含B+）轮，能走到C、D、E轮的创业企业合计仅0.35%。</span>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                            
							                           <table  class="table table-hover mb-0">
							                                
						                                <tbody>
						                                
						                                <c:forEach var="U" items="${list}" varStatus="status"> 
						                                <tr>
						                                    <td>
							                                    <div style="padding-top:1px;padding-left:10px">
							                                    	<a href="/FinalProject/deathcompany/death_company_info.jsp?id=${U.id}&number=${U.number}&com_name=${U.com_name}&com_addr=${U.com_addr}&cat=${U.cat}&se_cat=${U.se_cat}&com_des=${U.com_des}&born_data=${U.born_data} &death_data=${U.death_data} &live_days=${U.live_days}&financing=${U.financing}&total_money=${U.total_money}&death_reason=${U.death_reason}&invest_name=${U.invest_name}&ceo_name=${U.ceo_name}&ceo_des=${U.ceo_des}&ceo_per_des=${U.ceo_per_des}" >
							                                    	<font color="#c0c0c0" size="6">${status.index+1}        &nbsp </font><font color="black" size="4">     ${U.com_name}</font>
							                                    	</a>
							                                    		<p style="font-weight: 300;font-size: 15px;line-height: 20px;margin:0px;">
							                                    		 
							                                    			<font color="#ff441a" ><strong>${U.total_money}0,000元</strong></font>
							                                    			&nbsp<font size="2.8"><button type="button" class="btn btn-outline-success btn-sm">${U.financing}</button></font>
							                                    			&nbsp<font size="2.8"><button type="button" class="btn btn-outline-primary btn-sm">${U.cat}</button></font>
							                                    			&nbsp<font size="2.8"><button type="button" class="btn btn-outline-info btn-sm">${U.com_addr}</button></font>
							                                    			&nbsp<font size="2.8" color="#d70419">
							                                    			
 																			<c:set value="${ fn:split(U.invest_name, '&') }" var="names" />
																			<c:forEach items="${names}" var="labelsName">
																			     <button type="button" class="btn btn-outline-warning btn-sm">${labelsName}</button>
																			      
																			 </c:forEach>
 																			
 																			
 																			
 																			</font>
							                                    		</p>
							                                    		<p style="font-weight: 300;font-size: 15px;line-height: 20px;margin:0px;">
							                                    			
							                                    			<font size="2.8">${U.com_des}</font>
							                                    			
							                                    		</p>
							                                    </div>
						                                    </td>
						                                    
						                                </tr>
						                               </c:forEach>
						                                </tbody>
						                                
						                            </table>
					                         
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                           
														<table  class="table table-hover mb-0">
							                                
						                                <tbody>
						                                
						                                <c:forEach var="U" items="${company}" varStatus="status"> 
						                                <tr>
						                                    <td>
							                                    <div style="padding-top:1px;padding-left:10px">
							                                    	<a href="#" ><font color="#c0c0c0" size="6">${status.index+1}        &nbsp </font><font color="black" size="4">     ${U.name}</font></a>
							                                    		
							                                    		<p style="font-weight: 300;font-size: 15px;line-height: 20px;  margin:0px;">
							                                    			 <font size="3">代表死亡公司投资案例:</font>
							                                    			 <font size="3" color="#ff441a">
								                                    			<c:set value="${ fn:split(U.date, '&') }" var="names" />
																				<c:forEach items="${names}" var="labelsName">
																				     <a href="company_info_search?name=${labelsName}" style="color:#ff441a">&nbsp ${labelsName}</a>
																				 </c:forEach>
																			 </font>
							                                    		</p>
							                                    		<br/>
							                                    		<p style="padding-top:4px;font-weight: 300;font-size: 15px;line-height: 20px;">
							                                    			 
							                                    			<font size="3" color="black">  死亡公司投资事件 ${U.number} 笔 </font>
							                                    			
							                                    		</p>
							                                    </div>
						                                    </td>
						                                    
						                                </tr>
						                               </c:forEach>
						                                </tbody>
						                                
						                            </table>


                                        </div>
                                        <!--<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                            <p>Eu dolore ea ullamco dolore Lorem id cupidatat excepteur reprehenderit consectetur elit id dolor proident
                                                in cupidatat officia. Voluptate excepteur commodo labore nisi cillum duis aliqua do. Aliqua amet qui
                                                mollit consectetur nulla mollit velit aliqua veniam nisi id do Lorem deserunt amet. Culpa ullamco sit
                                                adipisicing labore officia magna elit nisi in aute tempor commodo eiusmod.</p>
                                        </div> -->
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
        </div>
         
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
	var myChart3 = echarts.init(document.getElementById('e_left'));
	// 显示标题，图例和空的坐标轴
	myChart3.setOption({
		color: ['#3398DB'],
	    tooltip: {
	    	trigger:"axis"   //坐标轴触发（即同一个DOM中有两个图标时，同一类目的参照线）
	    	      ,axisPointer:{   //坐标轴指示器配置项
	    	        type:"line"  //'line'-直线指示器   'shadow'-阴影指示器  'none'-无指示器   'cross'-十字准星指示器。其实是种简写，表示启用两个正交的轴的 axisPointer。
	    	        ,lineStyle:{   //type为'line'时有效
	    	          color:"#398dee"   //指示器的颜色
	    	          ,opacity:0.4      //指示器透明度
	    	        }
	    	      }
	    },
	    toolbox:{  //提示框组件
	        show:true   //是否显示
	        ,feature:{   //各种工具配置项      
	           magicType:{   //图表切换
	             type:["line","bar"]  //'line'（切换为折线图）, 'bar'（切换为柱状图）, 'stack'（切换为堆叠模式）, 'tiled'（切换为平铺模式）
	           }
	           ,restore:{  //还原
	             show:true
	           }
	           ,saveASImage:{
	             type:"png"    //保存的图片格式。支持 'png' 和 'jpeg'
	           }
	        }
	      }
	    ,legend:{   //图例组件
	          data:["相应公司数量","存活时间"]    //与series中name一致
	       ,right:90    //图例组件距右侧距离
	       ,top:5  //图例组件距顶部距离
	    }
	    
		 ,title:{     //图表标题设置
		      text:"融资轮数TOP10"     //表名
		      ,left:"center"   //表明距左侧距离（默认位于左侧）。left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'
		      ,top:5           //表名距顶部的高度
		      ,textStyle:{ //表名样式设置
		        color:"black"   //表名颜色
		      }
		      },
		      
		xAxis: {
			data:[]
	      ,position:"bottom"   //X轴位置  top bottom
	      ,type:"category"  //'category'目轴    'time' 时间轴    'value' 数值轴   'log' 对数轴
	      ,name:"融资情况"   //X轴名称
	      ,nameLocation:"end",   //坐标轴名称显示位置  'start'开始   'end'结束   'middle' 或者 'center'中间 
		},
		yAxis: {
			type:'value',
			axisLine:{
				lineStyle:{
					color:'#d0d0d0'
				}
			},
			splitLine: { //网格线
                show: false
            }
		     
		},
		series: [{  //系列列表
		      name:"相应公司数量"
		          ,type:"bar"  //柱状图
		          ,data:[]
		          ,label:{
		            show:true,
		            position:"top",
		            textStyle:{
		              color:"#41C7AF"
		            }
		          }
		          ,itemStyle: {
		        	  emphasis: {
		            		barBorderRadius: [13, 13, 0, 0]
		                },
		                normal: {
		                	barBorderRadius: [13, 13, 0, 0],
		                    color: new echarts.graphic.LinearGradient(
		                        0, 0, 1, 0,
		                        [
		                            {offset: 0, color: '#54E38E'},
		                            {offset: 1, color: '#41C7AF'}

		                        ]
		                    )
		                }
		             }
		        },
		        
		        {  //系列列表
		          name:"存活时间"
		          ,type:"line"  //柱状图
		          ,barMaxWidth:40
		          ,data:[]
		          ,label:{
		            show:true,
		            position:"top",
		            textStyle:{
		              color:"#ff6868"
		            }
		          },
		          itemStyle:{
		            	emphasis: {
		            		barBorderRadius: [13, 13, 0, 0]
		                },
		                normal: {
		                	barBorderRadius: [13, 13, 0, 0],
		                    color: new echarts.graphic.LinearGradient(
		                        0, 0, 1, 0,
		                        [
		                            {offset: 0, color: '#ff6868'},
		                            {offset: 1, color: '#ff6868'}

		                        ]
		                    )
		                }
		          }
		        }]});
	myChart3.showLoading(); //数据加载完之前先显示一段简单的loading动画
	var names3=[]; //类别数组（实际用来盛放X轴坐标值）
	var nums3=[]; //销量数组（实际用来盛放Y坐标值）
	var nums4=[]; //销量数组（实际用来盛放Y坐标值）
	$.ajax({
		type : "post",
		async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
		url : "/FinalProject/financing_mix_show", //请求发送到TestServlet处
		data : {},
		dataType : "json", //返回数据形式为json
		success : function(result3) {
		//请求成功时执行该函数内容，result即为服务器返回的json对象
		if (result3) {
			for(var i=0;i<result3.length;i++){
				if(result3[i].name=="不明确"){
					i++;
				}
				else{
				nums3.push(result3[i].number); //挨个取出销量并填入销量数组
				names3.push(result3[i].name); //挨个取出类别并填入类别数组
				nums4.push(result3[i].value); //挨个取出销量并填入销量数组
				}
			} 
			myChart3.hideLoading(); //隐藏加载动画
			myChart3.setOption({ //加载数据图表
				xAxis: {
					data: names3
				},
				series: [{
				// 根据名字对应到相应的系列
					name: '相应公司数量',
					data: nums3
				},{
				// 根据名字对应到相应的系列
					name: '平均存活时间（月）',
					data: nums4
				}]
			});
		}
		},
		error : function(errorMsg) {
			//请求失败时执行该函数
			alert("图表请求数据失败!");
			myChart3.hideLoading();
		}
		})
</script>
      
      <script type="text/javascript">

      
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
   </body>
</html>

