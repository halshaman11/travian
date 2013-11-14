<html>
<head>
	<meta name='layout' content='admin'/>
	<title>Travian Guild Manager - Admin</title>
	<r:require modules="graph" />
	
</head>

<body>
	<h4>Guild : ${guild.name}</h4>

	มีผู้สมัครทั้งหมด ${all} ไอดี


	<div style="text-align:center;">
		<g:link action="doSummary" class="btn btn-small btn-primary">Generate Statistic</g:link>
		<br/>
		<em style="font-size:11px;">กดเพื่อนำข้อมูลทั้งหมดของกิลเก็บไว้ในรูปแบบภาพรวมเพื่อเเสดงข้อมูลสถิติ(กดได้วันละครั้ง)</em>
	</div>
	<hr/>
	<div id="container"></div>
	<%
		def atk = guildSum.collect{it.atkAmount}
		def defend = guildSum.collect{it.defAmount}
		def cat = guildSum.collect{it.catAmount}
		def dates = guildSum.collect{it.date}
		def _dates = []
		dates.each{
			_dates << "'${g.formatDate(date:it,format:"dd/MM")}'"
		}
	%>
	
	<script>
		$(function () {
        $('#container').highcharts({
            chart: {
                type: 'area'
            },
            title: {
                text: 'Army by type'
            },
            
            xAxis: {
                categories: ${_dates},
                tickmarkPlacement: 'on',
                title: {
                    enabled: true
                }
            },
            yAxis: {
               
                labels: {
                    formatter: function() {
                        return this.value;
                    }
                }
            },
            tooltip: {
                shared: true,
                valueSuffix: ' '
            },
            plotOptions: {
                area: {
                    stacking: 'normal',
                    lineColor: '#666666',
                    lineWidth: 1,
                    marker: {
                        lineWidth: 1,
                        lineColor: '#666666'
                    }
                }
            },
            series: [{
                name: 'Atk',
                data: ${atk}
            }, {
                name: 'Def',
                data: ${defend}
            }, {
                name: 'Cat+Ram',
                data: ${cat}
            }]
        });
    });
    

	</script>
</body>
</html>
