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

	<div class="alert alert-success">
  			บันทึกข้อมูลเรียบร้อยแล้ว สามารถดูข้อมูลการกรอกย้อนหลังได้ <g:link action="history" >ที่นี่</g:link>
		</div>

	<g:form action="doUpdateSummary">
	<em style="text-align:right;font-size:11px;color:#AAA;">Last Updated: ${armySummary?.lastUpdated ?:"-"}</em>
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
			  		<td><input type="text" name="slot1" class="input-mini-mod" value="${armySummary?.slot1 ?:0}" /></td>
			  		<td><input type="text" name="slot2" class="input-mini-mod" value="${armySummary?.slot2 ?:0}" /></td>
			  		<td><input type="text" name="slot3" class="input-mini-mod" value="${armySummary?.slot3 ?:0}" /></td>
			  		<td><input type="text" name="slot4" class="input-mini-mod" value="${armySummary?.slot4 ?:0}" /></td>
			  		<td><input type="text" name="slot5" class="input-mini-mod" value="${armySummary?.slot5 ?:0}" /></td>
			  		<td><input type="text" name="slot6" class="input-mini-mod" value="${armySummary?.slot6 ?:0}" /></td>
			  		<td><input type="text" name="slot7" class="input-mini-mod" value="${armySummary?.slot7 ?:0}" /></td>
			  		<td><input type="text" name="slot8" class="input-mini-mod" value="${armySummary?.slot8 ?:0}" /></td>
			  		<td><input type="text" name="slot9	" class="input-mini-mod" value="${armySummary?.slot9 ?:0}" /></td>
			  	</tr>
			  </table>
			  
			  <em style="font-size:12px;color:#333;">ช่องไหนที่ไม่มีทหาร ห้ามปล่อยว่าง ให้กรอกเป็น 0 </em>
			 
			  
			
	<div style="text-align:right;">
				  <button type="submit" class="btn btn-primary btn-small"><i class="icon-white icon-ok-sign"></i> บันทึก</button>
			  </div>
	</g:form>

</body>
</html>
