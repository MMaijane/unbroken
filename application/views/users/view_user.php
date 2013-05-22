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

  # tabla de datos principales  
/*  $this->table->set_template($tmpl);    
  $this->table->set_caption("Datos Principales");
  //-- Header Row
  $this->table->set_heading('# Socio', 'Nombre', 'F. nacimiento', 'Tel. Casa', 'Celular', 'Tel. Trabajo', 'Registro');
  $this->table->add_row(
    $user['id_user'],
    $user['vc_username']." ".$user['vc_lastname'],
    $user['dt_birthday'],
    $user['vc_phonenumber'],
    $user['vc_msisdn'],
    $user['vc_worknumber'],
    $user['dt_registry']
  );
  $main_data = $this->table->generate();
  $this->table->clear(); 


  # table of adress
  $this->table->set_template($tmpl);    
  $this->table->set_caption("Direccion");
  $this->table->set_heading('Calle', 'Ciudad', 'Estado', 'CP.', 'Pais', 'Email', 'Facebook');
  $this->table->add_row(
      $user['vc_street'],
      $user['vc_city'],
      $user['vc_state'],
      $user['i_cp'],
      $user['vc_country'],
      $user['vc_email'],
      $user['vc_facebook']
    );
  $adress = $this->table->generate();
  $this->table->clear(); 
*/


  # table of active package
  $this->table->set_template($tmpl);    
  $this->table->set_caption("Paquete Activo");
  $this->table->set_heading('Paquete', 'Descripcion', 'F. Subscripcion', 'F. Expiracion');
  $this->table->add_row(
      $user['vc_package_name'],
      $user['vc_description'],
      $user['dt_subscription'],
      $user['dt_expires']      
    );
  $active_package = $this->table->generate();
  $this->table->clear(); 




  ####falta foto

?>



<html>
<head>
 <style> @import url('<?=base_url()?>css/main.css'); </style>
</head>
<body>
  <div id="header">
    <?php $this->load->view('templates/header'); ?>
  </div>

  <div id="menu">
    <?php echo $menu; ?>
  </div>

  <div id="content">
  <?php   

    switch ($action) {
      case 'active':  # si hay registros activos, function view
        if (isset($error)) { 
        
          echo $error.br();
          $hidden = array('id_user' => $id_user);
          echo form_open('users/renewal_subscription', '', $hidden); 
            echo "Renovar? : ".form_dropdown('id_pack', $packs); 
            echo form_submit('renewal_subscription','Renovar!');  
          echo form_close();  
          
        } else { ?>


          <table id="main_table_single_user"  border="1">
            <tr><th class="heading">Datos Principales</th><th class="heading">Direccion</th></tr>
            <tr>
              <td class="data_rows_single_user">
                <table id="inner_table" border="1" >
                  <tr><td class="inner_left"># Socio :</td>        <td><?=$user['id_user']?></td></tr>
                  <tr><td class="inner_left">Nombre :</td>         <td><?=$user['vc_username']." ".$user['vc_lastname']?></td></tr>
                  <tr><td class="inner_left">F. nacimiento :</td>  <td><?=$user['dt_birthday']?></td></tr>
                  <tr><td class="inner_left">Tel. Casa :</td>      <td><?=$user['vc_phonenumber']?></td></tr>
                  <tr><td class="inner_left">Celular :</td>        <td><?=$user['vc_msisdn']?></td></tr>
                  <tr><td class="inner_left">Tel. Trabajo :</td>   <td><?=$user['vc_worknumber']?></td></tr>
                  <tr><td class="inner_left">Fecha Registro :</td> <td><?=$user['dt_registry']?></td></tr>
                </table>
              </td>
              <td class="data_rows_single_user">
                <table id="inner_table" border="1" >
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
          </table><br>

<?php

         # echo $main_data.br();
         # echo $adress.br();
          echo $active_package.br();
        }
        echo anchor("users/view_history/{$id_user}", "Ver historial");  
      break;
      case 'history': # si se quiere ver el historial function view_history
        if (isset($error)) { echo $error.br(); } 
        else {
          foreach ($user as $key => $value) {
            echo "Datos principales".br();
            echo $value['vc_username'].br();
            echo $value['vc_lastname'].br();
            echo $value['dt_birthday'].br();
            echo $value['vc_worknumber'].br();
            echo $value['vc_phonenumber'].br();
            echo $value['vc_msisdn'].br();

            echo "Direccion".br();
            echo $value['vc_street'].br();
            echo $value['vc_city'].br();
            echo $value['vc_state'].br();
            echo $value['i_cp'].br();
            echo $value['vc_country'].br();
            
            echo "Web".br();
            echo $value['vc_email'].br();
            echo $value['vc_facebook'].br(); 

            echo "Registro".br();
            echo $value['dt_registry'].br();
            echo $value['vc_picture'].br(); 
            
            echo "Paquete".br();
            echo $value['vc_package_name'].br();
            echo $value['vc_description'].br(); 
            echo $value['dt_subscription'].br();
            echo $value['dt_expires'].br(); 
          }
        }
      break;
      
      default:
        # code...
        break;
    }

  ?>
  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

    