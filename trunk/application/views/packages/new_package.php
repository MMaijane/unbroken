
<?php $this->load->view('templates/header'); ?>
<body>

  <?php echo validation_errors('<p class="error">', '</p>'); ?>   
  
  <div id="header">
    <div id="img_left"></div>
    <div id="img_right"></div>
  </div>


  <div id="menu">
    <?php echo $menu; ?>
  </div>

  <div id="content"><br>
    <table id="main_table_pack"  border="1">
      <tr><th class="heading_pack">Nuevo Paquete</th></tr>
      <tr>
        <td class="data_rows_single_user">
          <table id="inner_table" border="0" >
            <?=form_open('packages/add')?>
            <tr><td class="inner_left"><?=$vc_package_name['key'].' : '?></td><td><?=form_input($vc_package_name['name'])?>*</td></tr>
            <tr><td class="inner_left"><?=$i_months['key'].' : '?></td><td><?=form_input($i_months['name'])?>*</td></tr>
            <tr><td class="inner_left"><?=$i_price['key'].' : '?></td><td><?=form_input($i_price['name'])?>*</td></tr>
            <tr><td class="inner_left"><?=$vc_description['key'].' : '?></td><td><?=form_input($vc_description['name'])?>*</td></tr>
          </table>
        </td>
      </tr>
    </table>
    <?=form_submit('new_package','Agregar!')?>
    <?=form_close()?>

  </div> 
    



    