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


  # paquetes activos
  if (!isset($error['active_pk'])) {
    
    #change the date form - from  yyyy-mm-dd to dd-mm-yyyy
    $a = explode('-', $active_pk['dt_subscription']); $act2 = $a[2].'-'.$a[1].'-'.$a[0]; # subscripcion
    $e = explode('-', $active_pk['dt_expires']);      $exp2 = $e[2].'-'.$e[1].'-'.$e[0]; # expiracion

    # table of active package
    $this->table->set_template($tmpl);    
    $this->table->set_caption("Subscripcion Activa");
    $this->table->set_heading('Subscripcion', 'Descripcion', 'F. Subscripcion', 'F. Expiracion');
    $this->table->add_row(
        $active_pk['vc_package_name'],
        $active_pk['vc_description'],
        $act2,
        $exp2
      );
    $active_package = $this->table->generate();
    $this->table->clear(); 
  }


  # historial de paquetes
  if (!isset($error['history_pk'])) {
    # table of active package
    $this->table->set_template($tmpl);    
    $this->table->set_caption("Historial de Subscripciones");
    $this->table->set_heading('Subscripcion', 'Descripcion', 'F. Subscripcion', 'F. Expiracion');

    foreach ($history_pk as $key => $val) {
      #change the date form - from  yyyy-mm-dd to dd-mm-yyyy
      $a = explode('-', $active_pk['dt_subscription']); $act2 = $a[2].'-'.$a[1].'-'.$a[0]; # subscripcion
      $e = explode('-', $active_pk['dt_expires']);      $exp2 = $e[2].'-'.$e[1].'-'.$e[0]; # expiracion

      $this->table->add_row(
          $val['vc_package_name'],
          $val['vc_description'],
          $act2,
          $exp2   
        );
    }

    $history_package = $this->table->generate();
    $this->table->clear(); 
  }


  # cambio de orden fecha de nacimiento y fecha de registro
  $r = explode('-', $user['dt_registry']); $d_reg = $r[2].'-'.$r[1].'-'.$r[0]; # fecha de registro
  $b = explode('-', $user['dt_registry']); $d_bir = $b[2].'-'.$b[1].'-'.$b[0]; # fecha de registro





  ####falta foto




?>



<html>
<head>
  <style> @import url('<?=base_url()?>css/main.css'); </style>
  <script type="text/javascript">
    function ShowHistory() {
      var div = document.getElementById('HistoryDiv');
      if (div.style.display !== 'none') {
          div.style.display = 'none';
      } else {
        div.style.display = 'block';
      }
    };
  </script>
</head>
<body>
  <!-- notificacion -->
  <p class='error'><?=$msg?> </p> 


  <div id="header">
    <?php $this->load->view('templates/header'); ?>
  </div>


  <div id="menu">
    <?php echo $menu; ?>
  </div>


  <div id="content">
  <?php   
  
    # si no exite el usuario
    if (isset($error['user'])) { ?>
      <p class='error'><?=$error['user'].br()?> </p> <?php #error
    } else { ?>

      <table id="main_table_single_user"  border="1">
        <tr><th class="heading">Datos Principales</th><th class="heading">Direccion</th></tr>
        <tr>
          <td class="data_rows_single_user">
            <table id="inner_table" border="0" >
              <tr><td class="inner_left"># Socio :</td>        <td><?=$user['id_user']?></td></tr>
              <tr><td class="inner_left">Nombre :</td>         <td><?=$user['vc_username']." ".$user['vc_lastname']?></td></tr>
              <tr><td class="inner_left">Fecha de nac. :</td>  <td><?=$d_bir?></td></tr>
              <tr><td class="inner_left">Tel. Oficina :</td>   <td><?=$user['vc_worknumber']?></td></tr>
              <tr><td class="inner_left">Tel. Particular :</td><td><?=$user['vc_phonenumber']?></td></tr>
              <tr><td class="inner_left">Celular :</td>        <td><?=$user['vc_msisdn']?></td></tr>
              <tr><td class="inner_left">Fecha Registro :</td> <td><?=$d_reg?></td></tr>
            </table>
          </td>
          <td class="data_rows_single_user">
            <table id="inner_table" border="0" >
              <tr><td class="inner_left">Calle :</td><td><?=$user['vc_street']?></td></tr>
              <tr><td class="inner_left">Ciudad :</td><td><?=$user['vc_city']?></td></tr>
              <tr><td class="inner_left">Estado :</td><td><?=$user['vc_state']?></td></tr>
              <tr><td class="inner_left">CP. :</td><td><?=$user['i_cp']?></td></tr>
              <tr><td class="inner_left">Pais :</td><td><?=$user['vc_country']?></td></tr>
              <tr><td class="inner_left">Email :</td><td><?=$user['vc_email']?></td></tr>
              <tr><td class="inner_left">Facebook :</td><td><?=$user['vc_facebook']?></td></tr>
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
      <?=anchor("users/edit/{$user['id_user']}", "Editar", 'class = "anchor"')?>
      <br><?php


      # si no tiene paquete activo
      if (isset($error['active_pk'])) { ?>
        <p class='error'><?=$error['active_pk'].br()?> </p> <?php #error
            
        # ofer new package
        $attributes = array('class' => 'offer_package' );
        $hidden = array('id_user' => $id_user);
        echo form_open('users/renewal_subscription', $attributes, $hidden); 
        echo "Renovar? : ".form_dropdown('id_pack', $packs); 
        echo form_submit('renewal_subscription','Renovar!');  
        echo form_close();  
      } else {
        echo $active_package.br();
      }
    } ?>


    <!-- ver historial -->
    <button OnClick='ShowHistory()'>Ver Historial</button>
    <div id='HistoryDiv' style='display:none;'> <?php          
        if (isset($error['history_pk'])) { ?>
          <p class='error'><?=$error['history_pk'].br()?> </p> <?php #error
        } else {
          echo $history_package.br();
        } ?>
    </div>
  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

    