<html>
<head>
	<meta name='layout' content='admin'/>
	<title>Travian Guild Manager - Admin</title>

	
</head>

<body>
<h4>Approve Pending Users</h4>
<p>ผู้ใช้ที่สมัคร กดปุ่มปลดล๊อคผู้ใช้งานเพื่อให้เข้าสู่ระบบได้</p>
<br/>
<table class="table table-bordered">
	<tr>
		<th width="15px">#</th>
		<th>Username</th>
		<th>Race</th>
		<th>Guild</th>
		<th width="45px">Gold ?</th>
		<th>Play time</th>
		<th width="120px">Last Updated</th>
		<th width="95px"></th>
	</tr>
	<g:each var="user" in="${users}" status="i">
		<tr>
			<td>${i+1}</td>
			<td>${user.username}</td>
			<td>${user.info.race.name}</td>
			<td>${user.info.guild.name}</td>
			<td style="text-align:center;"><i class="${user.info.isUseGold ? "icon-ok":"icon-close"}"></i></td>
			<td>${user.info.playTime}</td>
			<td><g:formatDate date="${user.info.lastUpdated}" format="dd/MM/yyyy HH:mm"/></td>
			<td><g:link action="unlock" id="${user.id}" >unlock</g:link> | <g:link action="delete" id="${user.id}" >delete</g:link></td>
		</tr>
	</g:each>
</table>


</body>
</html>
