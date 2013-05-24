<html>
<head>
   <style> @import url('<?=base_url()?>css/main.css'); </style>
   <script type="text/javascript" src="<?=base_url()?>js/birthdate.js"></script>
</head>
<body>
  <div id="header">
    <?php $this->load->view('templates/header'); ?>
  </div>

  <div id="menu">
    <?php echo $menu; ?>
  </div>

  <div id="content"><br>
    <table id="main_table_single_user"  border="1">
      <tr><th class="heading">Nuevo Socio</th><th class="heading">Direccion</th></tr>
      <tr>
        <td class="data_rows_single_user">
          <table id="inner_table" border="0" >
            <?=form_open('users/subscribe')?>
            <tr><td class="inner_left"><?=$vc_username['key'].' : '?></td><td><?=form_input($vc_username['name'])?></td></tr>
            <tr><td class="inner_left"><?=$vc_lastname['key'].' : '?></td><td><?=form_input($vc_lastname['name'])?></td></tr>
            <tr><td class="inner_left"><?=$dt_birthday['key'].' : '?></td><td><SELECT id ="date" name = "dd" ></SELECT>
                                                                      <SELECT id ="month" name = "mm" ></SELECT>
                                                                      <SELECT id ="year" name = "yyyy" ></SELECT></td></tr>
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
              <td class="inner_photo"><div id="header"></div></td>
            </tr>
              <!-- poner la foto aqui -->
          </table>
        </td>
      </tr>
    </table><br>

    <script type="text/javascript">date_populate("date", "month", "year");</script>

    <table id="tb_package_new_user"  border="1">
      <tr><th class="heading">Paquete</th></tr>
      <tr>
        <td>
          <table id="inner_table" border='0'>
            <tr><td class="inner_left">Paquete : </td><td><?=form_dropdown('id_pack', $packs, 'large')?></td></tr>
          </table>
        </td>
      </tr>
    </table><br>
    
    <?=form_submit('new_subscription','Registrar!')?>
    <?=form_close()?>

  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

