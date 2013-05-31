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
      <tr><td><?=anchor("users/subscribe", "nvo. cliente")?></td></tr>
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
                                      <SELECT id ="date" name = "dd"><option value="<?=$dd?>"><?=$dd?></option></SELECT>
                                      <SELECT id ="month" name = "mm"><option value="<?=$mm?>"><?=$mm?></option></SELECT>
                                      <SELECT id ="year" name = "yyyy"><option value="<?=$yyyy?>"><?=$yyyy?></option></SELECT></td></tr>
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
                <td class="inner_photo"><div id="header"></div></td>
              </tr>
              <!-- poner la foto aqui -->
            </table>
          </td>
        </tr>
      </table> 
      <!-- <script type="text/javascript">date_populate("date", "month", "year");</script> -->
      <?php
      echo form_submit('edit_user','Actualizar!');
      echo form_close();
    } ?> <br>
  </div> 


    