<html>
<head>
	<meta name='layout' content='admin'/>
	<title>Travian Guild Manager - History</title>

	<r:require modules="graph" />
</head>

<body>



	<h4>ประวัติการอัพข้อมูล ${user.username}</h4>
	<div style="padding:15px;float:right;"> 
		<g:link action="users" class="btn"> ย้อนกลับ</g:link>
	</div>
	<br/>
	<div id="container" style="height:250px;"></div>
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
  <br/>
  <hr/>
                 
                 
                 <table class="table table-bordered table-army">
                                  <tr>
                                  	<th><i class="icon-home"></i></th>
                                          <th width="80px"><img class="unit-${race} u1" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th width="80px"><img class="unit-${race} u2" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th width="80px"><img class="unit-${race} u3" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th width="80px"><img class="unit-${race} u4" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th width="80px"><img class="unit-${race} u5" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th width="80px"><img class="unit-${race} u6" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th width="80px"><img class="unit-${race} u7" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th width="80px"><img class="unit-${race} u8" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th width="80px"><img class="unit-${race} u9" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          
                                  </tr>
                                  <g:each var="town" in="${towns}">
                                  <tr>
                                  	<td>${town.name} (${town.x}|${town.y})
<br/>
                                  		<em style="font-size:10px;color:#ccc;">Updated: <g:formatDate date="${town?.activeSet?.lastUpdated}" format="dd/MM/yyyy HH:mm" /></em></td>
                                          <td>${town.activeSet.slot1}</td>
                                          <td>${town.activeSet.slot2}</td>
                                          <td>${town.activeSet.slot3}</td>
                                          <td>${town.activeSet.slot4}</td>
                                          <td>${town.activeSet.slot5}</td>
                                          <td>${town.activeSet.slot6}</td>
                                          <td>${town.activeSet.slot7}</td>
                                          <td>${town.activeSet.slot8}</td>
                                          <td>${town.activeSet.slot9}</td>
                                  </tr>
                              		</g:each>
                          </table>
                         
         
	
</body>
</html>
