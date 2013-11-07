<html>
<head>
	<meta name='layout' content='user'/>
	<title>Travian Guild Manager - Update Army & Town</title>

	
</head>

<body>
	<h4>ข้อมูลหมู่บ้าน และกองกำลัง</h4>


	<div style="text-align:right;">
 		<g:link action="addTown" class="btn" style="margin:10px;" >เพิ่มเมือง</g:link>
 	</div>
 	
 	<g:each var="town" in="${towns}">
 		<h5> <i class="icon-home"></i> ${town.name} (${town.x}|${town.y})</h5>
 		<g:form action="doUpdateTown" id="${town.id}">
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
			  		<td><input type="text" name="slot1" class="input-mini-mod" value="${town.activeSet.slot1}" /></td>
			  		<td><input type="text" name="slot2" class="input-mini-mod" value="${town.activeSet.slot2}" /></td>
			  		<td><input type="text" name="slot3" class="input-mini-mod" value="${town.activeSet.slot3}" /></td>
			  		<td><input type="text" name="slot4" class="input-mini-mod" value="${town.activeSet.slot4}" /></td>
			  		<td><input type="text" name="slot5" class="input-mini-mod" value="${town.activeSet.slot5}" /></td>
			  		<td><input type="text" name="slot6" class="input-mini-mod" value="${town.activeSet.slot6}" /></td>
			  		<td><input type="text" name="slot7" class="input-mini-mod" value="${town.activeSet.slot7}" /></td>
			  		<td><input type="text" name="slot8" class="input-mini-mod" value="${town.activeSet.slot8}" /></td>
			  		<td><input type="text" name="slot9	" class="input-mini-mod" value="${town.activeSet.slot9}" /></td>
			  	</tr>
			  </table>
			  <div style="text-align:right;">
				  <button type="submit" class="btn btn-small">บันทึก</button>
			  </div>
			</g:form>
			  <em style="font-size:10px;color:#ccc;">Last Updated: ${town.activeSet.lastUpdated}</em>
 	</g:each>

</body>
</html>
