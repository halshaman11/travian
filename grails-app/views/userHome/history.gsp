<html>
<head>
	<meta name='layout' content='user'/>
	<title>Travian Guild Manager - History</title>

	
</head>

<body>
	<h4>ประวัติการอัพข้อมูล</h4>
	<br/>
	<table class="table table-bordered table-army">
			  	<tr>
			  		<th width="150px;">Last Updated</th>
			  		<th width="80px;"><img class="unit-${race} u1" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="80px;"><img class="unit-${race} u2" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="80px;"><img class="unit-${race} u3" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="80px;"><img class="unit-${race} u4" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="80px;"><img class="unit-${race} u5" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="80px;"><img class="unit-${race} u6" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="80px;"><img class="unit-${race} u7" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="80px;"><img class="unit-${race} u8" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="80px;"><img class="unit-${race} u9" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th>รวม</th>
			  	</tr>
			  	<g:each var="armySummary" in="${armySummarys}">
			  	<% def sum = 0 
			  		sum += armySummary?.slot1 ?:0
			  		sum += armySummary?.slot2 ?:0
			  		sum += armySummary?.slot3 ?:0
			  		sum += armySummary?.slot4 ?:0
			  		sum += armySummary?.slot5 ?:0
			  		sum += armySummary?.slot6 ?:0
			  		sum += armySummary?.slot7 ?:0
			  		sum += armySummary?.slot8 ?:0
			  		sum += armySummary?.slot9 ?:0
			  	%>
			  	<tr>
			  		<td><g:formatDate date="${armySummary.lastUpdated}" format="dd/MM/yyyy HH:mm:ss" /></td>
			  		<td><g:formatNumber number="${armySummary?.slot1 ?:0}" format="##,###" /></td>
			  		<td><g:formatNumber number="${armySummary?.slot2 ?:0}" format="##,###" /></td>
			  		<td><g:formatNumber number="${armySummary?.slot3 ?:0}" format="##,###" /></td>
			  		<td><g:formatNumber number="${armySummary?.slot4 ?:0}" format="##,###" /></td>
			  		<td><g:formatNumber number="${armySummary?.slot5 ?:0}" format="##,###" /></td>
			  		<td><g:formatNumber number="${armySummary?.slot6 ?:0}" format="##,###" /></td>
			  		<td><g:formatNumber number="${armySummary?.slot7 ?:0}" format="##,###" /></td>
			  		<td><g:formatNumber number="${armySummary?.slot8 ?:0}" format="##,###" /></td>
			  		<td><g:formatNumber number="${armySummary?.slot9 ?:0}" format="##,###" /></td>
			  		<td class="right"><g:formatNumber number="${sum}" format="##,###" /></td>
			  	</tr>
			  </g:each>
			  </table>
	
</body>
</html>
