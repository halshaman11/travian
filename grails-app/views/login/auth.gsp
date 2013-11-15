<html>
<head>
	<meta name='layout' content='auth'/>
	<title>Travian Guild Manager - Login</title>

	
</head>

<body>
<div id='login'>
	<div class='inner'>
		<div class='fheader'>Travian Guild Manager</div>

		<g:if test='${flash.message}'>
			<div class='login_message alert alert-error'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' class="form-horizontal" method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<div class="form-group">
				<label for='username' style="padding-bottom:5px;">Username :</label>

				<input type='text'  class='text_' name='j_username' id='username'/>
			</div>

			<div class="form-group">
				<label for='password'  style="padding:5px 0px;">Password :</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</div>
			<p style="text-align:center;margin-top:25px;">
				<input type='submit' class="btn" id="submit" value='Login'/>
				<g:link action="register" class="btn" >Register</g:link>
			</p>
		</form>
		
		
		

	<div class="special-thanks">Powered by aeronz Version 1.2.1	</div>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
