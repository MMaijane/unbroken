
<html>
	<head>
 		<style> @import url('<?=base_url()?>css/main.css'); </style>
 		<script type="text/javascript" src="<?=base_url()?>js/birthdate.js"></script>
 		<script type="text/javascript">
	    function ShowHistory() {
	      var div = document.getElementById('HistoryDiv');
	      if (div.style.display !== 'none') {
	          div.style.display = 'none';
	      } else {
	        div.style.display = 'block';
	      }
	    };

	    function ShowUsers() {
				var div = document.getElementById('users');
				document.getElementById('active_users').style.display = 'none';
				document.getElementById('deactive_users').style.display = 'none';
				document.getElementById('deptors_users').style.display = 'none';
	      if (div.style.display !== 'none') {
	          div.style.display = 'none';
	      } else {
	        div.style.display = 'block';
	      }
	    };

	    function ShowActiveUsers() {
				var div = document.getElementById('active_users');
				document.getElementById('users').style.display = 'none';
				document.getElementById('deactive_users').style.display = 'none';
				document.getElementById('deptors_users').style.display = 'none';
	      if (div.style.display !== 'none') {
	          div.style.display = 'none';
	      } else {
	        div.style.display = 'block';
	      }
	    };

	    function ShowDeactiveUsers() {
				var div = document.getElementById('deactive_users');
				document.getElementById('users').style.display = 'none';
				document.getElementById('active_users').style.display = 'none';
				document.getElementById('deptors_users').style.display = 'none';
	      if (div.style.display !== 'none') {
	          div.style.display = 'none';
	      } else {
	        div.style.display = 'block';
	      }
	    };


	    function ShowDebtUsers() {
				var div = document.getElementById('deptors_users');
				document.getElementById('users').style.display = 'none';
				document.getElementById('active_users').style.display = 'none';
				document.getElementById('deactive_users').style.display = 'none';
	      if (div.style.display !== 'none') {
	          div.style.display = 'none';
	      } else {
	        div.style.display = 'block';
	      }
	    };
  	</script>
  	<?php header("Content-Type: text/html;charset=utf-8");?>
  	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	</head>
