<html>
<head>
	<meta name='layout' content='admin'/>
	<title>Travian Guild Manager - Users</title>

	
</head>

<body>
	
	<g:each var="_race" in="${tm.common.Race.list()}">
	<h4>${_race.name}</h4>
	

	<% def _users = users.findAll{ it.info.race.id == _race.id} 
		def race  = _race.name[0].toLowerCase()
		def u1 = 0
		def u2 = 0
		def u3 = 0
		def u4 = 0
		def u5 = 0
		def u6 = 0
		def u7 = 0
		def u8 = 0
		def u9 = 0
	%>
	
	<table class="table table-bordered">
	<tr>
		<th>User</th>
	<th class="center" width="55px"><img class="unit-${race} u1" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th class="center" width="55px"><img class="unit-${race} u2" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th class="center" width="55px"><img class="unit-${race} u3" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th class="center" width="55px"><img class="unit-${race} u4" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th class="center" width="55px"><img class="unit-${race} u5" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th class="center" width="55px"><img class="unit-${race} u6" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th class="center" width="55px"><img class="unit-${race} u7" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th class="center" width="55px"><img class="unit-${race} u8" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th class="center" width="55px"><img class="unit-${race} u9" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
			  		<th class="center" width="150px;">Last Updated</th>
		</tr>
		<g:each var="user" in="${_users}">
			<tr>
			<td><g:link action="user" id="${user.id}">${user.username}</g:link></td>
			<td class="right">${user.info.armySummary.u1}</td>
                        <td class="right">${user.info.armySummary.u2}</td>
                        <td class="right">${user.info.armySummary.u3}</td>
                        <td class="right">${user.info.armySummary.u4}</td>
                        <td class="right">${user.info.armySummary.u5}</td>
                        <td class="right">${user.info.armySummary.u6}</td>
                        <td class="right">${user.info.armySummary.u7}</td>
                        <td class="right">${user.info.armySummary.u8}</td>
                        <td class="right">${user.info.armySummary.u9}</td>
			
			<td  class="center"><g:formatDate date="${user.info.lastUpdated}" format="dd/MM/yyyy HH:mm"/></td>
			</tr>
			<%
				u1+=user.info.armySummary?.u1 ?:0
				u2+=user.info.armySummary?.u2 ?:0
				u3+=user.info.armySummary?.u3 ?:0
				u4+=user.info.armySummary?.u4 ?:0
				u5+=user.info.armySummary?.u5 ?:0
				u6+=user.info.armySummary?.u6 ?:0
				u7+=user.info.armySummary?.u7 ?:0
				u8+=user.info.armySummary?.u8 ?:0
				u9+=user.info.armySummary?.u9 ?:0
			%>
		</g:each>
		<tr>
			<td>รวม</td>
			<td class="right">${u1}</td>
			<td class="right">${u2}</td>
			<td class="right">${u3}</td>
			<td class="right">${u4}</td>
			<td class="right">${u5}</td>
			<td class="right">${u6}</td>
			<td class="right">${u7}</td>
			<td class="right">${u8}</td>
			<td class="right">${u9}</td>
			<td></td>
		</tr>
	</table>

	</g:each>
	

</body>
</html>
