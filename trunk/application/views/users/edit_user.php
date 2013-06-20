<?php
/*  manage the data, make the table of contents */
 //-- Table Initiation
  $tmpl = array (
    'table_open'          => '<table border="1" cellpadding="0" cellspacing="0" id="main_table">',
    'heading_row_start'   => '<tr class="heading">',
    'heading_row_end'     => '</tr>',
    'heading_cell_start'  => '<th>',
    'heading_cell_end'    => '</th>',
    'row_start'           => '<tr>',
    'row_end'             => '</tr>',
    'cell_start'          => '<td class="data_rows">',
    'cell_end'            => '</td>',
    'row_alt_start'       => '<tr class="alt">',
    'row_alt_end'         => '</tr>',
    'cell_alt_start'      => '<td class="data_rows_2">',
    'cell_alt_end'        => '</td>',
    'table_close'         => '</table>'
  );

  ####falta foto

$f = explode('-', $user['dt_birthday']);
$dd = $f[2];
$mm = $f[1];
$yyyy = $f[0];

  for ($i=1; $i <=31; $i++) { $day[$i] = $i; }
  $dd_selec[$dd] = $dd; 

  for ($i=1; $i <=12; $i++) { $month[$i] = $i; }
  $mm_selec[$mm] = $mm;

  for ($i=date('Y'); $i>='1950'; $i--) { $year[$i] = $i; }
  $yy_selec[$yyyy] = $yyyy;

?>

<?php $this->load->view('templates/header'); ?>
<body>

  <div id="header">
    <div id="img_left"></div>
    <div id="img_right"></div>
  </div>



  <div id="menu">
    <?php echo $menu; ?>
  </div>


  <div id="content">
    <table name="tb_new_user" id="tb_new_user"> 
      <tr><td><?=anchor("users/subscribe", "Nvo. Socio")?></td></tr>
    </table>
  <?php   
  
    # si no exite el usuario
    if (isset($error['user'])) { ?>
      <p class='error'><?=$error['user'].br()?> </p> <?php #error
    } else { ?>
      <table id="main_table_single_user"  border="1">
        <tr><th class="heading">Datos Principales</th><th class="heading">Direccion</th><th class="heading">Fotografia</th></tr>
        <tr>
          <td class="data_rows_single_user">
            <table id="inner_table" border="0" >
              <?=form_open('users/edit/'.$id_user)?>
              <tr><td class="inner_left"><?=$vc_username['key'].' : '?></td><td><?=form_input($vc_username['name'], $vc_username['value'])?></td></tr>
              <tr><td class="inner_left"><?=$vc_lastname['key'].' : '?></td><td><?=form_input($vc_lastname['name'], $vc_lastname['value'])?></td></tr>
              <tr><td class="inner_left"><?=$dt_birthday['key'].' : '?></td><td>
                                      <?=form_dropdown('dd', $day, $dd_selec)?>
                                      <?=form_dropdown('mm', $month, $mm_selec)?>
                                      <?=form_dropdown('yyyy', $year, $yy_selec)?></td></tr>
              <tr><td class="inner_left">Tel. <?=$vc_worknumber['key'].' : '?></td><td><?=form_input($vc_worknumber['name'], $vc_worknumber['value'])?></td></tr>
              <tr><td class="inner_left">Tel. <?=$vc_phonenumber['key'].' : '?></td><td><?=form_input($vc_phonenumber['name'], $vc_phonenumber['value'])?></td></tr>
              <tr><td class="inner_left"><?=$vc_msisdn['key'].' : '?></td><td><?=form_input($vc_msisdn['name'], $vc_msisdn['value'])?></td></tr>
            </table>
          </td>
          <td class="data_rows_single_user">
            <table id="inner_table" border="0" >
              <tr><td class="inner_left"><?=$vc_street['key'].' : '?></td><td><?=form_input($vc_street['name'], $vc_street['value'])?></td></tr>
              <tr><td class="inner_left"><?=$vc_city['key'].' : '?></td><td><?=form_input($vc_city['name'], $vc_city['value'])?></td></tr>
              <tr><td class="inner_left"><?=$vc_state['key'].' : '?></td><td><?=form_input($vc_state['name'], $vc_state['value'])?></td></tr>
              <tr><td class="inner_left"><?=$i_cp['key'].' : '?></td><td><?=form_input($i_cp['name'], $i_cp['value'])?></td></tr>
              <tr><td class="inner_left"><?=$vc_country['key'].' : '?></td><td><?=form_input($vc_country['name'], $vc_country['value'])?></td></tr>
              <tr><td class="inner_left"><?=$vc_email['key'].' : '?></td><td><?=form_input($vc_email['name'], $vc_email['value'])?></td></tr>
              <tr><td class="inner_left"><?=$vc_facebook['key'].' : '?></td><td><?=form_input($vc_facebook['name'], $vc_facebook['value'])?></td></tr>
            </table>
          </td>
          <td class="data_rows_single_user">
            <table id="inner_table" >
              <tr>
                <td class="inner_photo"><div id ='22'></div>
                  <div id="ww">
                    <script type="text/javascript" src="<?=base_url()?>js/webcam.js"></script>
                    <script language="JavaScript">
                              var base_url = "<?=base_url()?>";
                              webcam.set_swf_url( base_url + 'js/webcam.swf' );
                              webcam.set_api_url( base_url + 'js/test.php' );
                              webcam.set_quality( 90 ); // JPEG quality (1 - 100)
                              webcam.set_shutter_sound( false ); // play shutter click sound
                    </script>
                    <script language="JavaScript">
                            document.write( webcam.get_html(320, 200) );
                    </script><br/>
                            <input type=button value="Configurar" onClick="webcam.configure()">
                            &nbsp;&nbsp;&nbsp;
                            <input type=button value="Tomar Foto" onClick="webcam.snap()">
                            &nbsp;&nbsp;&nbsp;
                            <input type=button value="Reset" onClick="webcam.reset()">
                    <script language="JavaScript">
                            webcam.set_hook( 'onComplete', 'my_callback_function' );
                            function my_callback_function(response) {
                                    alert("Success! PHP returned: " + response);
                            }

                    </script>
                  </div>
                </div></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table>
              <tr>
                <td>Comentario:</td>
              </tr>
              <tr>
                <td><?=form_textarea($vc_coment['name'], $vc_coment['value'])?></td>
              </tr>
            </table>
          </td>
        </tr>
      </table> 
      
      <?php
      echo form_submit('edit_user','Actualizar!');
      echo form_close();
    } ?> <br>
  </div> 


    