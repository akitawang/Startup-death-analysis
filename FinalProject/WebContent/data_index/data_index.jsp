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
<div class="canvas" style="opacity: .2">
	<iframe frameborder="0" src="js/index.html" style="width: 100%; height: 100%"></iframe>
	</div>
<div class="loading">
  <div class="loadbox"> <img src="picture/loading.gif"> 页面加载中... </div>
</div>
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

//全国省份列表
var dataMap = [{ name: '北京',number:0 }, { name: '天津',number:0 }, { name: '上海',number:0 }, { name: '重庆',number:0 }, { name: '河北',number:0 }, { name: '河南',number:0 }, { name: '云南' }, { name: '辽宁' ,number:0}, { name: '黑龙江',number:0}, { name: '湖南',number:0 }, { name: '安徽' ,number:0}, { name: '山东',number:0 },
{ name: '新疆',number:0 }, { name: '江苏',number:0 }, { name: '浙江',number:0 }, { name: '江西',number:0 }, { name: '湖北',number:0 }, { name: '广西',number:0 }, { name: '甘肃' ,number:0}, { name: '山西',number:0 }, { name: '内蒙古',number:0 }, { name: '陕西' ,number:0}, { name: '吉林',number:0 }, { name: '福建' ,number:0}, { name: '贵州',number:0 },
{ name: '广东',number:0 }, { name: '青海',number:0 }, { name: '西藏',number:0 }, { name: '四川',number:0 }, { name: '宁夏',number:0 }, { name: '海南' ,number:0}, { name: '台湾',number:0 }, { name: '香港' ,number:0}, { name: '澳门' ,number:0}, { name: '南海诸岛' ,number:0}]
// 需要在页面上直接标记出来的城市
var specialMap = ['浙江', '云南', '陕西'];
// 对dataMap进行处理，使其可以直接在页面上展示
for (var i = 0; i < specialMap.length; i++) {
    for (var j = 0; j < dataMap.length; j++) {
        if (specialMap[i] == dataMap[j].name) {
            dataMap[j].selected = true;
            break;
        }

    }
}
// 绘制图表，准备数据
var option = {
    tooltip: {
        formatter: function (params) {
            var info = '<p style="font-size:16px">' + params.name + '</p><p style="font-size:12px">死亡公司数量：'+params.value+'</p>'
            return info;
        },
        backgroundColor: "#009ACD",//提示标签背景颜色
        textStyle: { color: "#000000" } //提示标签字体颜色
    },
    series: [
        {
            name: '中国',
            type: 'map',
            mapType: 'china',
            selectedMode: 'multiple',
            label: {
                normal: {
                    show: true,//显示省份标签
                    // textStyle:{color:"#c71585"}//省份标签字体颜色
                },
                emphasis: {
                    show: true,//对应的鼠标悬浮效果
                    // textStyle:{color:"#800080"}
                }
            },
            itemStyle: {
                normal: {
                    borderWidth: .5,//区域边框宽度
                    // borderColor: '#009fe8',//区域边框颜色
                    areaColor:"#1C86EE",//区域颜色
                },
                emphasis: {
                    borderWidth: .5,
                    borderColor: '#4b0082',
                    areaColor: "#1874CD",
                }
            },
            data: []
        }
    ]
};
//初始化echarts实例
var myChartt = echarts.init(document.getElementById('container'));
//使用制定的配置项和数据显示图表
myChartt.setOption(option);

myChartt.showLoading(); //数据加载完之前先显示一段简单的loading动画
$.ajax({
	type : "post",
	async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
	url : "../MapShow_servlet", //请求发送到TestServlet处
	data : {},
	dataType : "json", //返回数据形式为json
	success : function(result) {
	//请求成功时执行该函数内容，result即为服务器返回的json对象
	if (result) {
		myChartt.hideLoading(); //隐藏加载动画
		myChartt.setOption({ //加载数据图表
			series: [{
			// 根据名字对应到相应的系列
				data: result
			}]
		});
	}
	},
	error : function(errorMsg) {
		//请求失败时执行该函数
		alert("地图请求数据失败!");
		myChartt.hideLoading();
	}
	})
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
	        bottom: '3%',
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
		           rotate:-15  //-15度角倾斜显示
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
	        bottom: '3%',
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
		           rotate:-15  //-15度角倾斜显示
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


