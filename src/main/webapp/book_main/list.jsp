<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Book BigData</title>
<link rel="stylesheet" type="text/css" href="table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script type="text/javascript">
 $(function(){
	 var ox=20;
	 var oy=10;
	 $('img').animate({"opacity":1});
		$('img').hover(function(){
			$(this).animate({"opacity":.3});
		},function(){
			$(this).animate({"opacity":1});
		});
	 $('span').hover(function(e){
		 var href=$(this).attr('class');
		 $('<span id="bigimg">'+href+'</span>')
		 .css('top',e.pageY+oy) // e.pageY (마우스 좌표 y)
		 .css('left',e.pageX+ox)
		 .appendTo('body'); // tag 추가
		 
	 },function(){
		 $('#bigimg').remove();// tag 삭제
	 });
	 $('span').mousemove(function(){
		$('#bigimg').css('top',e.pageY+oy)
		 .css('left',e.pageX+ox) 
	 });
	 $('.tc').click(function(){
		 var no=$(this).attr('value');
		 location.href="list.do?no="+no;
	 });
	 $('#pie').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false,
	            type: 'pie'
	        },
	        title: {
	            text: '각 도서별 별점 현황'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        series: [{
	            name: 'Brands',
	            colorByPoint: true,
	            data: [
	              <c:forEach var="vo" items="${list}">
	              {
	                name: '<c:out value="${vo.title}"/>',
	                y: <c:out value="${vo.star}"/>
	               },
	              </c:forEach>
	              ]
	        }]
	    });
	 $('#bar').highcharts({
	        chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45
	            }
	        },
	        title: {
	            text: '각 서적별 별점 현황'
	        },
	        subtitle: {
	            text: '별점 시각화'
	        },
	        plotOptions: {
	            pie: {
	                innerSize: 100,
	                depth: 45
	            }
	        },
	        series: [{
	            name: '별점',
	            data: [
                   <c:forEach var="vo" items="${list}">
	                ['<c:out value="${vo.title}"/>', <c:out value="${vo.star}"/>],
	               </c:forEach> 
	            ]
	        }]
	    });
	 $('#line').highcharts({
	        chart: {
	            type: 'column',
	            options3d: {
	                enabled: true,
	                alpha: 10,
	                beta: 25,
	                depth: 70
	            }
	        },
	        title: {
	            text: '${vo.title}'
	        },
	        subtitle: {
	            text: '서적별 판매 시각화'
	        },
	        plotOptions: {
	            column: {
	                depth: 25
	            }
	        },
	        xAxis: {
	            categories: Highcharts.getOptions().lang.shortMonths
	        },
	        yAxis: {
	            title: {
	                text: null
	            }
	        },
	        series: [{
	            name: 'Sales',
	            data: <c:out value="${data}"/>
	        }]
	    });
 }); 
 </script>
 
</head>
<body>
   <center>
     <h3>베스트셀러 (종합)</h3>
     <table id="table_content" width="1000">
     <tr>
      <td width=600>
	     <table id="table_content" width="400">
	      <c:forEach var="vo" items="${list }" varStatus="">
	        <tr>
	          <td width=30% align=right rowspan=5>
	           <span class="${vo.review }"><img src="${vo.poster }" width=120 height=140></span>
	          </td>
	          <td colspan="2" class="tdcenter">
	            <font color=blue><b>
	            <div class="tc" value="${vo.rank }">${vo.title }</div></b></font>
	          </td>
	        </tr>
	        <tr>
	          <td width=20% align=right>저자</td>
	          <td width=50%>${vo.author }</td>
	        </tr>
	        <tr>
	          <td width=20% align=right>출판사</td>
	          <td width=50%>${vo.publisher }</td>
	        </tr>
	        <tr>
	          <td width=20% align=right>출판일</td>
	          <td width=50%>${vo.regdate }</td>
	        </tr>
	        <tr>
	          <td width=20% align=right>가격</td>
	          <td width=50%>${vo.price }</td>
	        </tr>
	      </c:forEach>
	     </table>
	   </td>
	   <td width=400>
	     <table id="table_content" width="600">
	      <tr>
	       <td class="tdcenter" id="pie" width=600 height=500 valign=top></td>
	      </tr>
	      <tr>
	       <td class="tdcenter" id="bar" width=600 height=500 valign=top></td>
	      </tr>
	      <tr>
	       <td class="tdcenter" id="line" width=600 height=500 valign=top></td>
	      </tr>
	     </table>
	   </td>
	 </tr>
	</table>
   </center>
</body>
</html>







