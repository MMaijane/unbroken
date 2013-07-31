
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

	    function showPics(){

        var div1 = document.getElementById('u_pics_content');
        var div2 = document.getElementById('a_pics_content');
        var div3 = document.getElementById('d_pics_content');
        var div4 = document.getElementById('s_pics_content');

        var div5 = document.getElementById('u_data_content');
        var div6 = document.getElementById('a_data_content');
        var div7 = document.getElementById('d_data_content');
        var div8 = document.getElementById('s_data_content');

        div5.style.display = 'none';
        div6.style.display = 'none';
        div7.style.display = 'none';
        div8.style.display = 'none';

        div1.style.display = 'block';
        div2.style.display = 'block';
        div3.style.display = 'block';
        div4.style.display = 'block';
      }      


      function showData(){

            var div1 = document.getElementById('u_pics_content');
            var div2 = document.getElementById('a_pics_content');
            var div3 = document.getElementById('d_pics_content');
            var div4 = document.getElementById('s_pics_content');

            var div5 = document.getElementById('u_data_content');
            var div6 = document.getElementById('a_data_content');
            var div7 = document.getElementById('d_data_content');
            var div8 = document.getElementById('s_data_content');

            div1.style.display = 'none';
            div2.style.display = 'none';
            div3.style.display = 'none';
            div4.style.display = 'none';

            div5.style.display = 'block';
            div6.style.display = 'block';
            div7.style.display = 'block';
            div8.style.display = 'block';
      }  
  	</script>
  	<?php header("Content-Type: text/html;charset=utf-8");?>
  	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	</head>
