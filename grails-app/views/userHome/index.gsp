<html>
<head>
	<meta name='layout' content='user'/>
	<title>Travian Guild Manager - Home</title>

	
</head>

<body>
	<h4>ข้อมูลส่วนตัว</h4>

	<dl class="dl-horizontal">
	  <dt>Travian ID</dt>
	  <dd>${user.username}</dd>
	  <dt>Race </dt>
	  <dd>${user?.info?.race?.name}</dd>
	  <dt>Guild</dt>
	  <dd>${user?.info?.guild?.name}</dd>
	  
	</dl>


	<h5>ภาพรวม</h5>
	<g:if test="${flash.success}">
	<div class="alert alert-success">
  			บันทึกข้อมูลเรียบร้อยแล้ว สามารถดูข้อมูลการกรอกย้อนหลังได้ <g:link action="history" >ที่นี่</g:link>
		</div>
	</g:if>
	
	<table class="table table-bordered table-army">
                                  <tr>
                                          <th><img class="unit-${race} u1" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th><img class="unit-${race} u2" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th><img class="unit-${race} u3" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th><img class="unit-${race} u4" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th><img class="unit-${race} u5" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th><img class="unit-${race} u6" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th><img class="unit-${race} u7" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th><img class="unit-${race} u8" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                          <th><img class="unit-${race} u9" src="${resource(dir: 'images/icon', file: 'x.gif')}" /></th>
                                  </tr>
                                  <tr>
                                          <td>${armySummary.u1}</td>
                                          <td>${armySummary.u2}</td>
                                          <td>${armySummary.u3}</td>
                                          <td>${armySummary.u4}</td>
                                          <td>${armySummary.u5}</td>
                                          <td>${armySummary.u6}</td>
                                          <td>${armySummary.u7}</td>
                                          <td>${armySummary.u8}</td>
                                          <td>${armySummary.u9}</td>
                                  </tr>
                          </table>
	
	
</body>
</html>
