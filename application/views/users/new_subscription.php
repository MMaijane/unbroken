
<?php
  for ($i=1; $i <=31; $i++) {$day[$i] = $i; }
  for ($i=1; $i <=12; $i++) {$month[$i] = $i; }
  for ($i=date('Y'); $i>='1950'; $i--) {$year[$i] = $i; }

  $dt = array ('name' => 'vc_folio',
               'id' => 'vc_folio',
               'size' => '5');
 ?>

<?php $this->load->view('templates/header'); ?>
	<body>
  	<!-- error -->
		<?php echo validation_errors('<p class="error">', '</p>'); ?>
		<p class='error'><?php echo isset($msg)? $msg : ''  ?> </p>   
	
  <div id="header">
    <div id="img_left"></div>
    <div id="img_right"></div>
  </div>

		
		<div id="menu">
		  <?php echo $menu; ?>
		</div>

		<div id="content"><br>
		  <table id="main_table_single_user"  border="1">
		    <tr><th class="heading">Nuevo Socio</th><th class="heading">Direccion</th><th class="heading">Fotografia</th></tr>
		    <tr>
		      <td class="data_rows_single_user">
		        <table id="inner_table" border="0">
		          <?=form_open('users/subscribe')?>
		          <tr><td class="inner_left"><?=$vc_username['key'].' : '?></td><td><?=form_input($vc_username['name'])?>*</td></tr>
		          <tr><td class="inner_left"><?=$vc_lastname['key'].' : '?></td><td><?=form_input($vc_lastname['name'])?>*</td></tr>
		          <tr><td class="inner_left"><?=$dt_birthday['key'].' : '?></td><td>                                      
		          												<?=form_dropdown('dd', $day)?>
                                      <?=form_dropdown('mm', $month)?>
                                      <?=form_dropdown('yyyy', $year)?></td></tr>
		          <tr><td class="inner_left">Tel. <?=$vc_worknumber['key'].' : '?></td><td><?=form_input($vc_worknumber['name'])?></td></tr>
		          <tr><td class="inner_left">Tel. <?=$vc_phonenumber['key'].' : '?></td><td><?=form_input($vc_phonenumber['name'])?></td></tr>
		          <tr><td class="inner_left"><?=$vc_msisdn['key'].' : '?></td><td><?=form_input($vc_msisdn['name'])?></td></tr>
		        </table>
		      </td>
		      <td class="data_rows_single_user">
		        <table id="inner_table" border="0" >
		          <tr><td class="inner_left"><?=$vc_street['key'].' : '?></td><td><?=form_input($vc_street['name'])?></td></tr>
		          <tr><td class="inner_left"><?=$vc_city['key'].' : '?></td><td><?=form_input($vc_city['name'])?></td></tr>
		          <tr><td class="inner_left"><?=$vc_state['key'].' : '?></td><td><?=form_input($vc_state['name'])?></td></tr>
		          <tr><td class="inner_left"><?=$i_cp['key'].' : '?></td><td><?=form_input($i_cp['name'])?></td></tr>
		          <tr><td class="inner_left"><?=$vc_country['key'].' : '?></td><td><?=form_input($vc_country['name'])?></td></tr>
		          <tr><td class="inner_left"><?=$vc_email['key'].' : '?></td><td><?=form_input($vc_email['name'])?></td></tr>
		          <tr><td class="inner_left"><?=$vc_facebook['key'].' : '?></td><td><?=form_input($vc_facebook['name'])?></td></tr>
		        </table>
		      </td>
		      <td class="data_rows_single_user">
		        <table id="inner_table" >
		          <tr>
		            <td class="inner_photo">
		              <div id="">

		                <script type="text/javascript" src="<?=base_url()?>/js/webcam.js"></script>
		                <script language="JavaScript">
		                  var base_url = "<?=base_url()?>";
		                          webcam.set_swf_url( base_url + 'js/webcam.swf' );
		                          webcam.set_api_url( base_url + 'js/test.php' );
		                          webcam.set_quality( 90 ); // JPEG quality (1 - 100)
		                          webcam.set_shutter_sound( true ); // play shutter click sound
		                </script>
		                <script language="JavaScript">
		                        document.write( webcam.get_html(320, 200) );
		                </script><br/>
		                        <input type=button value="Configure..." onClick="webcam.configure()">
		                        &nbsp;&nbsp;&nbsp;
		                        <input type=button value="Take Snapshot" onClick="webcam.snap()">

		                <script language="JavaScript">
		                        webcam.set_hook( 'onComplete', 'my_callback_function' );
		                        function my_callback_function(response) {
		                                alert("Success! PHP returned: " + response);
		                        }
		                </script>
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table><br>

		  <script type="text/javascript">date_populate("date", "month", "year");</script>

		  <table id="tb_package_new_user"  border="1">
		    <tr><th class="heading">Paquete</th><th class="heading">Comentario</th></tr>
		    <tr>
		      <td>
		        <table id="inner_table" border='0'>
		          <tr><td class="inner_left">Paquete: </td><td><?=form_dropdown('id_pack', $packs, 'large')?></td></tr>
		          <tr><td class="inner_left"># folio : </td><td><?=form_input($dt)?> *</td></tr>
		        </table>
		      </td>
		    	<td>
		    		<?=form_textarea($vc_facebook['name'])?>
		    	</td>
		    </tr>
		  </table><br>
		    
		  <?=form_submit('new_subscription','Registrar!')?>
		  <?=form_close()?>

		</div> 





