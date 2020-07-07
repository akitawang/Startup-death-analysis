<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
<META    HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META    HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META    HTTP-EQUIV="Expires" CONTENT="0">
<meta charset="utf-8">
<title>数据大屏</title>
<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet" href="css/comon0.css">
</head>
	<script>
	$(window).load(function(){  
             $(".loading").fadeOut()
            })  
			
/****/
$(document).ready(function(){
	var whei=$(window).width()
	$("html").css({fontSize:whei/20})
	$(window).resize(function(){
		var whei=$(window).width()
	 $("html").css({fontSize:whei/20})
});
	});
	</script>
	<script type="text/javascript" src="js/echarts.min.js"></script> 
	<script language="JavaScript" src="js/js.js"></script> 
<body>
 
<div class="head">
	
  <h1>创业公司情况数据展示大屏</h1>
  <div class="weather">
	  <a href="../index"><img src="images/manage.png"><span>   返回主页</span></a> 
	  <span id="showTime"></span>
  </div>
	
	<script>
	var t = null;
    t = setTimeout(time,1000);//開始运行
    function time()
    {
       clearTimeout(t);//清除定时器
       dt = new Date();
		var y=dt.getFullYear();
		var mt=dt.getMonth()+1;
		var day=dt.getDate();
       var h=dt.getHours();//获取时
       var m=dt.getMinutes();//获取分
       var s=dt.getSeconds();//获取秒
       document.getElementById("showTime").innerHTML = y+"年"+mt+"月"+day+"日-"+h+"时"+m+"分"+s+"秒";
       t = setTimeout(time,1000); //设定定时器，循环运行     
    } 

</script>
	
	
</div>

<div style="width:27%;height:40%;top: 70px;bottom: 0px;
    position: absolute;">
    <div class="boxall">
    	<div id="main" style="width:330px;height:240px;"></div>
    </div>
    
</div>



<div style="width:27%;height:45%;bottom: 0px; margin-top:45%;
    position: absolute;">
    <div class="boxall">
    	<div id="main1" style="width:330px;height:270px;"></div>
    </div>
    </div>

<div style="width:43%;height:90%;top: 60px;bottom: 0px; margin-left:29%;
    position: absolute;">

    
      <div class="bar">
        <div class="barbox">
          <ul class="clearfix">
            <li class="pulll_left counter"  id="show_number_left">暂无数据</li>
            <li class="pulll_left counter" id="show_number_right">暂无数据</li>
          </ul>
        </div>
        <div class="barbox2">
          <ul class="clearfix">
            <li class="pulll_left">死亡公司数量 </li>
            <li class="pulll_left">正在运营数量</li>
          </ul>
        </div>
      </div>
      <div class="map">
        <div class="map1"><img src="picture/lbx.png"></div>
        <div class="map2"><img src="picture/jt.png"></div>
        <div class="map3"><img src="picture/map.png"></div>
        <div id="container" style="height:500px;width:600px;z-index:10;position:absolute;"></div>
        
      </div>
    
  </div>
  
   <div style="width:26%;height:40%;top: 70px;bottom: 0px; margin-left:74%;
    position: absolute;">
    <div class="boxall">
    	<div id="main_left_1" style="width:330px;height:240px;"></div>
    </div>
    </div>
    
    <div style="width:26%;height:45%;bottom: 0px; margin-top:45%; margin-left:74%;
    position: absolute;">
    <div class="boxall">
		<div id="main_left_2" style="width:330px;height:270px;"></div>
	</div>
	</div>  


<script type="text/javascript" src="js/china.js"></script> 
<script type="text/javascript" src="js/area_echarts.js"></script> 

<script>
 
var chartData; //声明全局变量利用ajax赋值，方便给option赋值
        //利用ajax方法获取数据
        $.ajax({
            url:"../MapShow_servlet",
            type:"post",
            async:false,   //ajax请求是同步还是异步，默认是异步，如果设置为同步,该方法必须是得到响应值做完响应的处理才会往下面执行
            success:function(data){
                var jsonO = eval("("+data+")");
                chartData=jsonO;
            }
        });

        // 基于准备好的dom，初始化echarts图表 
        var myChartt = echarts.init(document.getElementById('container'));//jquery方法好像会出错，不知道什么原因
        var option = {
            
            tooltip : {
                trigger : 'item'
            },
            grid: {
    	        left: '3%',
    	        right: '4%',
    	        bottom: '3%',
    	        containLabel: true
    	    },
            dataRange : {
                min : 0,
                max : 100,
                x : 'left',
                y : 'bottom',
                text : [ '高', '低' ], // 文本，默认为数值文本
                calculable : true,
                inRange: {
                    // inRange (object)定义 在选中范围中 的视觉元素。（用户可以和 visualMap 组件交互，用鼠标或触摸选择范围）1、symbol: 图元的图形类别。2、symbolSize: 图元的大小。3、color: 图元的颜色。4、colorAlpha: 图元的颜色的透明度。5、opacity: 图元以及其附属物（如文字标签）的透明度。6、
                    color: ['#00bfff', '#003399']
                }
            },
            toolbox : {
                show : true,
                orient : 'vertical',
                x : 'right',
                y : 'center',
                feature : {
                    mark : {
                        show : true
                    },
                    dataView : {
                        show : true,
                        readOnly : false
                    },
                    restore : {
                        show : true
                    },
                    saveAsImage : {
                        show : true
                    }
                }
            },
            roamController : {
                show : true,
                x : 'right',
                mapTypeControl : {
                    'china' : true
                }
            },
            series : [ {
                name : '地区:倒闭公司数量',
                type : 'map',
                mapType : 'china',
                roam : false,
                itemStyle : {
                    normal : {
                        label : {
                            show : true
                        }
                    },
                    emphasis : {
                        label : {
                            show : true
                        }
                    }
                },
                data : chartData  //这里给data赋值就好了
            } ]
        };

        // 为echarts对象加载数据   
        myChartt.setOption(option);
 
	
</script>

<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
	// 显示标题，图例和空的坐标轴
	myChart.setOption({
		color: ['#3398DB'],
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
		title: {
			text: '公司所属领域',
			textStyle: {
		        fontWeight: 'normal',              //标题颜色
		        color: '#d0d0d0'
		    },
		},
		xAxis: {
			type:'category',
			data: [],
			axisLine:{
				lineStyle:{
					color:'#d0d0d0'
				}
			},
			axisLabel: {  
		           interval:0,//横轴信息全部显示    
		           rotate:20  //-15度角倾斜显示
			 },
			axisTick: {
                alignWithLabel: true
            },

            axisTick:{ show:false }//不显示y轴刻度 
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
		series: [{
			name: '数量',
			type: 'bar',
			data: [],
			barWidth: '60%',
            itemStyle: {
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
		}]
	});
	myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画
	var names=[]; //类别数组（实际用来盛放X轴坐标值）
	var nums=[]; //销量数组（实际用来盛放Y坐标值）
	$.ajax({
		type : "post",
		async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
		url : "../TypecompanyShow_servlet", //请求发送到TestServlet处
		data : {},
		dataType : "json", //返回数据形式为json
		success : function(result) {
		//请求成功时执行该函数内容，result即为服务器返回的json对象
		if (result) {
			for(var i=0;i<result.length;i++){
				names.push(result[i].name); //挨个取出类别并填入类别数组
			}
			for(var i=0;i<result.length;i++){
				nums.push(result[i].number); //挨个取出销量并填入销量数组
			}
			myChart.hideLoading(); //隐藏加载动画
			myChart.setOption({ //加载数据图表
				xAxis: {
					data: names
				},
				series: [{
				// 根据名字对应到相应的系列
					name: '数量',
					data: nums
				}]
			});
		}
		},
		error : function(errorMsg) {
			//请求失败时执行该函数
			alert("图表请求数据失败!");
			myChart.hideLoading();
		}
		})
</script>



<script type="text/javascript">
	var myChart1 = echarts.init(document.getElementById('main1'));
	// 显示标题，图例和空的坐标轴
	myChart1.setOption({
		color: ['#3398DB'],
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
		title: {
			text: '公司所属子领域',
			textStyle: {
		        fontWeight: 'normal',              //标题颜色
		        color: '#d0d0d0'
		    },
		},
		xAxis: {
			type:'category',
			data: [],
			axisLine:{
				lineStyle:{
					color:'#d0d0d0'
				}
			},
			 axisLabel: {  
		           interval:0,//横轴信息全部显示    
		           rotate:20  //-15度角倾斜显示
			 },
			axisTick: {
                alignWithLabel: true
            },

            axisTick:{ show:false }//不显示y轴刻度 
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
		series: [{
			name: '数量',
			type: 'bar',
			data: [],
			barWidth: '60%',
            itemStyle: {
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
		}]
	});
	myChart1.showLoading(); //数据加载完之前先显示一段简单的loading动画
	var names1=[]; //类别数组（实际用来盛放X轴坐标值）
	var nums1=[]; //销量数组（实际用来盛放Y坐标值）
	$.ajax({
		type : "post",
		async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
		url : "../Subtype_servlet", //请求发送到TestServlet处
		data : {},
		dataType : "json", //返回数据形式为json
		success : function(result1) {
		//请求成功时执行该函数内容，result即为服务器返回的json对象
		if (result1) {
			for(var i=0;i<result1.length;i++){
				names1.push(result1[i].name); //挨个取出类别并填入类别数组
			}
			for(var i=0;i<result1.length;i++){
				nums1.push(result1[i].number); //挨个取出销量并填入销量数组
			}
			myChart1.hideLoading(); //隐藏加载动画
			myChart1.setOption({ //加载数据图表
				xAxis: {
					data: names1
				},
				series: [{
				// 根据名字对应到相应的系列
					name: '数量',
					data: nums1
				}]
			});
		}
		},
		error : function(errorMsg) {
			//请求失败时执行该函数
			alert("图表请求数据失败!");
			myChart1.hideLoading();
		}
		})
</script>


<script type="text/javascript">
	var myChart2 = echarts.init(document.getElementById('main_left_1'));
	// 显示标题，图例和空的坐标轴
	myChart2.setOption({
		color: ['#3398DB'],
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '1%',
	        containLabel: true
	    },
		title: {
			text: '当前融资情况',
			textStyle: {
		        fontWeight: 'normal',              //标题颜色
		        color: '#d0d0d0'
		    },
		},
		xAxis: {
			type:'category',
			data: [],
			axisLine:{
				lineStyle:{
					color:'#d0d0d0'
				}
			},
			 axisLabel: {  
		           interval:0,//横轴信息全部显示    
		           rotate:20  //-15度角倾斜显示
			 },
			axisTick: {
                alignWithLabel: true
            },

            axisTick:{ show:false }//不显示y轴刻度 
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
		series: [{
			name: '数量',
			type: 'bar',
			data: [],
			barWidth: '60%',
            itemStyle: {
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
		}]
	});
	myChart2.showLoading(); //数据加载完之前先显示一段简单的loading动画
	var names2=[]; //类别数组（实际用来盛放X轴坐标值）
	var nums2=[]; //销量数组（实际用来盛放Y坐标值）
	$.ajax({
		type : "post",
		async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
		url : "../FinancingShow_servlet", //请求发送到TestServlet处
		data : {},
		dataType : "json", //返回数据形式为json
		success : function(result2) {
		//请求成功时执行该函数内容，result即为服务器返回的json对象
		if (result2) {
			for(var i=0;i<result2.length;i++){
				names2.push(result2[i].name); //挨个取出类别并填入类别数组
				
			}
			for(var i=0;i<result2.length;i++){
					nums2.push(result2[i].number); //挨个取出销量并填入销量数组
				
			}
			myChart2.hideLoading(); //隐藏加载动画
			myChart2.setOption({ //加载数据图表
				xAxis: {
					data: names2
				},
				series: [{
				// 根据名字对应到相应的系列
					name: '数量',
					data: nums2
				}]
			});
		}
		},
		error : function(errorMsg) {
			//请求失败时执行该函数
			alert("图表请求数据失败!");
			myChart2.hideLoading();
		}
		})
</script>


<script type="text/javascript">
	var myChart3 = echarts.init(document.getElementById('main_left_2'));
	// 显示标题，图例和空的坐标轴
	myChart3.setOption({
		color: ['#3398DB'],
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '1%',
	        containLabel: true
	    },
		title: {
			text: '投资公司情况',
			top:5,           //表名距顶部的高度
			textStyle: {
		        fontWeight: 'normal',              //标题颜色
		        color: '#d0d0d0'
		    },
		},
		xAxis: {
			type:'category',
			data: [],
			axisLine:{
				lineStyle:{
					color:'#d0d0d0'
				}
			},
			axisLabel: {  
		           interval:0,//横轴信息全部显示    
		           rotate:20  //-15度角倾斜显示
			 },
			axisTick: {
                alignWithLabel: true
            },

            axisTick:{ show:false }//不显示y轴刻度 
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
		series: [{
			name: '数量',
			type: 'bar',
			data: [],
			barWidth: '60%',
            itemStyle: {
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
		}]
	});
	myChart3.showLoading(); //数据加载完之前先显示一段简单的loading动画
	var names3=[]; //类别数组（实际用来盛放X轴坐标值）
	var nums3=[]; //销量数组（实际用来盛放Y坐标值）
	$.ajax({
		type : "post",
		async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
		url : "../InvestcompanyShow_servlet", //请求发送到TestServlet处
		data : {},
		dataType : "json", //返回数据形式为json
		success : function(result3) {
		//请求成功时执行该函数内容，result即为服务器返回的json对象
		if (result3) {
			for(var i=0;i<result3.length;i++){
				names3.push(result3[i].name); //挨个取出类别并填入类别数组
			}
			for(var i=0;i<result3.length;i++){
				nums3.push(result3[i].number); //挨个取出销量并填入销量数组
			}
			myChart3.hideLoading(); //隐藏加载动画
			myChart3.setOption({ //加载数据图表
				xAxis: {
					data: names3
				},
				series: [{
				// 根据名字对应到相应的系列
					name: '数量',
					data: nums3
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


<script>

$.ajax({
	type : "post",
	async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
	url : "../Dataindex_middle_servlet", //请求发送到TestServlet处
	data : {},
	dataType : "json", //返回数据形式为json
	success : function(number) {
	//请求成功时执行该函数内容，result即为服务器返回的json对象
	if (number) {
		document.getElementById("show_number_left").innerHTML = number[0].number1;
		document.getElementById("show_number_right").innerHTML = number[0].number2;
	}
	},
	error : function(errorMsg) {
		//请求失败时执行该函数
		alert("公司数量栏位请求数据失败!");
	}
	})

</script>

</body>
</html>


