<html>
<head>
	<meta name='layout' content='auth'/>
	<title>Travian Guild Manager - Register</title>

</head>

<body >
	<div class="container">
		<h3>Register - Fill your information</h3>
		<p>หลังจากสมัครแล้ว ท่านจะเข้าสู่ระบบได้ก็ต่อเมื่อ Admin ทำการอนุมัติก่อน เพื่อป้องกันการกรอกมั่ว (หลังจากอนุมัติแล้วจะ igm ไปแจ้งครับ)</p>
	</div>

	<div class="container content">
		<g:form class="form-horizontal" name="register" action="doRegister">
		  <div class="control-group">
		    <label class="control-label" for="travianID">Travian ID</label>
		    <div class="controls">
		      <input type="text" name="travianID" id="travianID" placeholder="Travian ID">
		      <span class="help-inline">ID เกมส์ Travian ของท่านซึ่งจะใช้เป็น username ในการล้อกอินเข้าระบบนี้</span>
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="password">Password</label>
		    <div class="controls">
		      <input type="password" name="password" id="password" placeholder="Password">
		      <span class="help-inline">รหัสผ่านไม่จำเป็นต้องเป็นรหัสผ่านเข้าเกมส์</span>
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="race">เผ่าของท่าน</label>
		    <div class="controls">
		      <g:select from="${tm.common.Race.list()}" optionValue="name" optionKey="id" name="race" />
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="guild">อยู่กิล</label>
		    <div class="controls">
		      <g:select from="${tm.game.Guild.list()}" optionValue="name" optionKey="id" name="guild" />
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="heroLevel">ฮีโร่เลเวล</label>
		    <div class="controls">
		      <input type="number" name="heroLevel" min="0" max="100" />
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="isUseGold">เติมทอง ?</label>
		    <div class="controls">
		      <input type="checkbox" name="isUseGold" value="true"/>
		    </div>
		  </div>

		  <div class="control-group">
		    <label class="control-label" for="playType">สายการเล่น</label>
		    <div class="controls">
		      <input type="text" name="playType" >
		      <span class="help-inline">เช่นสายเรน เป็นต้น</span>
		    </div>
		  </div>

		  <div class="control-group">
		    <label class="control-label" for="playTime">เวลาการเล่น</label>
		    <div class="controls">
		      <g:textArea type="text" class="span4" name="playTime" id="playTime" />
		      
		    </div>
		  </div>
		  <div class="control-group">
    		<div class="controls">
      			<button type="submit" class="btn"><i class="icon-ok"></i> สมัคร</button>
    		</div>
  		</div>
		</g:form>
	</div>

</body>
</html>
