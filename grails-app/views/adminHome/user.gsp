<html>
<head>
	<meta name='layout' content='user'/>
	<title>Travian Guild Manager - Update Army & Town</title>

	
</head>

<body>
	<h4>ข้อมูลหมู่บ้าน และกองกำลัง ${user.username}</h4>


	<div style="text-align:right;">
 		<g:link action="users" class="btn" style="margin:10px;" >ย้อนกลับ</g:link>
 	</div>
 	
 	<g:each var="town" in="${towns}">
 		<h5> <i class="icon-home"></i> ${town.name} (${town.x}|${town.y})</h5>
 		
 		<table class="table table-bordered table-army">
			  	<tr>
			  		<th width="55px"><img class="unit-${race} u1" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="55px"><img class="unit-${race} u2" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="55px"><img class="unit-${race} u3" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="55px"><img class="unit-${race} u4" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="55px"><img class="unit-${race} u5" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="55px"><img class="unit-${race} u6" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="55px"><img class="unit-${race} u7" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="55px"><img class="unit-${race} u8" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th width="55px"><img class="unit-${race} u9" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  	</tr>
			  	<tr>
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
			  </table>
			 
			  <em style="font-size:10px;color:#ccc;">Last Updated: ${town.activeSet.lastUpdated}</em>
 	</g:each>

</body>
</html>
