<html>
<head>
	<meta name='layout' content='user'/>
	<title>Travian Guild Manager - Add Town</title>

	
</head>

<body>

	<h4>เพิ่มข้อมูลหมู่บ้าน และกองกำลัง</h4>

	<g:form action="doAdd" class="form-horizontal" >
		<div class="control-group">
		    <label class="control-label" for="name">ชื่อเมือง</label>
		    <div class="controls">
		      <input type="text" name="name" id="name" >
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="position">พิกัด</label>
		    <div class="controls">
		      <input type="text" class="input-mini" name="x" id="x" > <input type="text" class="input-mini" name="y" id="y" >
		    </div>
		  </div>

		  <div class="control-group">
		    <label class="control-label" for="position">ทหาร</label>
		    <div class="controls">
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
			  		<td><input type="text" name="slot1" class="input-mini-mod" value="0" /></td>
			  		<td><input type="text" name="slot2" class="input-mini-mod" value="0" /></td>
			  		<td><input type="text" name="slot3" class="input-mini-mod" value="0" /></td>
			  		<td><input type="text" name="slot4" class="input-mini-mod" value="0" /></td>
			  		<td><input type="text" name="slot5" class="input-mini-mod" value="0" /></td>
			  		<td><input type="text" name="slot6" class="input-mini-mod" value="0" /></td>
			  		<td><input type="text" name="slot7" class="input-mini-mod" value="0" /></td>
			  		<td><input type="text" name="slot8" class="input-mini-mod" value="0" /></td>
			  		<td><input type="text" name="slot9	" class="input-mini-mod" value="0" /></td>
			  	</tr>
			  </table>
			</div>
		  </div>
		 

		  <div class="control-group">
    		<div class="controls">
      			<button type="submit" class="btn"><i class="icon-ok"></i> บันทึก</button>
    		</div>
  		</div>

	</g:form>
 	
 	
</body>
</html>
