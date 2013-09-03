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
    $this->table->set_heading('Subscripcion', 'Descripcion', 'F. Subscripcion', 'F. Expiracion', 'Folio');
    $this->table->add_row(
        $active_pk['vc_package_name'],
        $active_pk['vc_description'],
        $act2,
        $exp2,
        $active_pk['vc_folio']
      );
    $active_package = $this->table->generate();
    $this->table->clear(); 
  }


  # historial de paquetes
  if (!isset($error['history_pk'])) {
    # table of active package
    $this->table->set_template($tmpl);    
    $this->table->set_caption("Historial de Subscripciones");
    $this->table->set_heading('Subscripcion', 'Descripcion', 'F. Subscripcion', 'F. Expiracion', 'Folio');

    foreach ($history_pk as $key => $val) {
      #change the date form - from  yyyy-mm-dd to dd-mm-yyyy
      $a = explode('-', $val['dt_subscription']); $act2 = $a[2].'-'.$a[1].'-'.$a[0]; # subscripcion
      $e = explode('-', $val['dt_expires']);      $exp2 = $e[2].'-'.$e[1].'-'.$e[0]; # expiracion

      $this->table->add_row(
          $val['vc_package_name'],
          $val['vc_description'],
          $act2,
          $exp2,
          $val['vc_folio']  
        );
    }

    $history_package = $this->table->generate();
    $this->table->clear(); 
  }


  # cambio de orden fecha de nacimiento y fecha de registro
  $r = explode('-', $user['dt_registry']); $d_reg = $r[2].'-'.$r[1].'-'.$r[0]; # fecha de registro
  $b = explode('-', $user['dt_birthday']); $d_bir = $b[2].'-'.$b[1].'-'.$b[0]; # fecha de registro
  $dt = array ('name' => 'vc_folio',
               'id' => 'vc_folio',
               'size' => '5');

  for ($i=1; $i <=31; $i++) {$day[$i] = $i; }
  for ($i=1; $i <=12; $i++) {$month[$i] = $i; }
  for ($i=date('Y'); $i>='1950'; $i--) {$year[$i] = $i; }
?>

<?php $this->load->view('templates/header'); ?>
<body>
  <!-- notificacion -->
  <p class='error'><?=$msg?> </p> 


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
              <tr><td class="inner_left">Colonia :</td><td><?=$user['vc_state']?></td></tr>
              <tr><td class="inner_left">G. Medicos :</td><td><?=$user['vc_cp']?></td></tr>
              <tr><td class="inner_left">Emergencia :</td><td><?=$user['vc_country']?></td></tr>
              <tr><td class="inner_left">Email :</td><td><?=$user['vc_email']?></td></tr>
              <tr><td class="inner_left">Horario :</td><td><?=$user['vc_facebook']?></td></tr>          
            </table>
          </td>
          <td class="data_rows_single_user">
            <table id="inner_table" >
              <tr>
                <td class="inner_photo">
                  <?php 
                    if ($user['vc_picture'] != '') {?>
                      <img src="<?=base_url()?>img/users_pics/<?=$user['vc_picture']?>" class='usr_pic'></img>
                    <?php } else { ?>
                      No hay fotografia
                    <?php } ?>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table><p class="comment">Comentario : <?=$user['vc_coment']?></p>
      <?=anchor("users/edit/{$user['id_user']}", "Editar", 'class = "anchor"')?>
      <br><?php


      # si no tiene paquete activo
      if (isset($error['active_pk'])) { ?>
        <p class='error'><?=$error['active_pk'].br()?> </p> <?php #error
            
        # ofer new package
        $attributes = array('class' => 'offer_package' );
        $hidden = array('id_user' => $id_user);
        echo form_open('users/renewal_subscription', $attributes, $hidden); 
        echo "Renovar? <br>"; ?>
        <table border="0" align='center' >
          <tr><td>Promocion : </td><td><?=form_dropdown('id_pack', $packs)?></td></tr>
          <tr><td>Desde : </td><td>                                      
                  <?=form_dropdown('dd', $day,  set_value('dd', date('d')))?>-
                  <?=form_dropdown('mm', $month, set_value('mm', date('m')))?>-
                  <?=form_dropdown('yyyy', $year, set_value('yyyy', date('Y')))?></td></tr>
          <tr><td>No. folio : </td><td><?=form_input($dt)?></td></tr>
        </table><?php 

        echo form_submit('renewal_subscription','Renovar!');  
        echo form_close();  
      } else {
        echo $active_package.br();
      }
    } ?>

    <br><br>
    <!-- ver historial -->
    <div id='HistoryDiv' > <hr><?php          
        if (isset($error['history_pk'])) { ?>
          <p class='error'><?=$error['history_pk'].br()?> </p> <?php #error
        } else {
          echo $history_package.br();
        } ?>
    </div>
  </div> 



    