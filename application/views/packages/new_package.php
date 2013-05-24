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
    <table id="main_table_pack"  border="0">
      <tr><th class="heading_pack">Nuevo Paquete</th></tr>
      <tr>
        <td class="data_rows_single_user">
          <table id="inner_table" border="0" >
            <?=form_open('packages/add')?>
            <tr><td class="inner_left"><?=$vc_package_name['key'].' : '?></td><td><?=form_input($vc_package_name['name'])?></td></tr>
            <tr><td class="inner_left"><?=$i_months['key'].' : '?></td><td><?=form_input($i_months['name'])?></td></tr>
            <tr><td class="inner_left"><?=$i_price['key'].' : '?></td><td><?=form_input($i_price['name'])?></td></tr>
            <tr><td class="inner_left"><?=$vc_description['key'].' : '?></td><td><?=form_input($vc_description['name'])?></td></tr>
          </table>
        </td>
      </tr>
    </table>
    <?=form_submit('new_package','Agregar!')?>
    <?=form_close()?>

  </div> 
    



  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

    