
<?php
/*  manage the data, make the table of contents */
 //-- Table Initiation
  $tmpl = array (
    'table_open'          => '<table border="0" cellpadding="0" cellspacing="0" id="main_table">',
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
  
    #########################################################################
    # table of users
    $this->table->set_template($tmpl);    
    $this->table->set_caption("<b>Socios</b>");
    $this->table->set_heading('# Socio', 'Nombre', 'Tel. casa', 'Celular', 'Email', 'Registrado desde');

    //-- Content Rows
    foreach($users as $key => $value) {

      #change the date form - from  yyyy-mm-dd to dd-mm-yyyy
      $f = explode('-', $value['dt_registry']);
      $ff = $f[2].'-'.$f[1].'-'.$f[0];

      $this->table->add_row(
        $value['id_user'],
        anchor("users/view/{$value['id_user']}", $value['vc_username']." ".$value['vc_lastname']),
        $value['vc_phonenumber'],
        $value['vc_msisdn'],
        $value['vc_email'],
        $ff
      );
    } 

    $table_users = $this->table->generate();
    $this->table->clear(); 


    #########################################################################
    # active
    # table of users
    $this->table->set_template($tmpl);    
    $this->table->set_caption("<b>Socios Activos</b>");
    $this->table->set_heading('# Socio', 'Nombre', 'Tel. casa', 'Celular', 'Email', 'Registrado desde');

    //-- Content Rows
    foreach($active_users as $key => $value) {

      #change the date form - from  yyyy-mm-dd to dd-mm-yyyy
      $f = explode('-', $value['dt_birthday']);
      $ff = $f[2].'-'.$f[1].'-'.$f[0];

      $this->table->add_row(
        $value['id_user'],
        anchor("users/view/{$value['id_user']}", $value['vc_username']." ".$value['vc_lastname']),
        $value['vc_phonenumber'],
        $value['vc_msisdn'],
        $value['vc_email'],
        $ff
      );
    } 

    $table_active_users = $this->table->generate();
    $this->table->clear(); 

    #########################################################################
    # deaacivos
    # table of users
    $this->table->set_template($tmpl);    
    $this->table->set_caption("<b>Socios Desactivos</b>");
    $this->table->set_heading('# Socio', 'Nombre', 'Tel. casa', 'Celular', 'Email', 'Registrado desde');

    //-- Content Rows
    foreach($deactive_users as $key => $value) {

      #change the date form - from  yyyy-mm-dd to dd-mm-yyyy
      $f = explode('-', $value['dt_birthday']);
      $ff = $f[2].'-'.$f[1].'-'.$f[0];

      $this->table->add_row(
        $value['id_user'],
        anchor("users/view/{$value['id_user']}", $value['vc_username']." ".$value['vc_lastname']),
        $value['vc_phonenumber'],
        $value['vc_msisdn'],
        $value['vc_email'],
        $ff
      );
    } 

    $table_deactive_users = $this->table->generate();
    $this->table->clear(); 

    #########################################################################
    # debtors
    # table of users
    $this->table->set_template($tmpl);    
    $this->table->set_caption("<b>Socios A Vencer</b>");
    $this->table->set_heading('# Socio', 'Nombre', 'Tel. casa', 'Celular', 'Email', 'Registrado desde');

    //-- Content Rows
    foreach($next_debt_users as $key => $value) {

      #change the date form - from  yyyy-mm-dd to dd-mm-yyyy
      $f = explode('-', $value['dt_birthday']);
      $ff = $f[2].'-'.$f[1].'-'.$f[0];

      $this->table->add_row(
        $value['id_user'],
        anchor("users/view/{$value['id_user']}", $value['vc_username']." ".$value['vc_lastname']),
        $value['vc_phonenumber'],
        $value['vc_msisdn'],
        $value['vc_email'],
        $ff
      );
    } 

    $table_debtor_users = $this->table->generate();
    $this->table->clear(); 

  $c_active_users = count($active_users);
  $c_deactive_users = count($deactive_users);
  $c_users = count($users);
  $c_next_debt_users = count($next_debt_users);


?>

<?php $this->load->view('templates/header'); ?>
<body>
    <!-- notificacion -->
  <p class='error'><?=$msg?> </p> 

  <div id="header">
    <div id="img_left"></div>
    <div id="img_right"></div>
  </div>

  <div id="menu"><?php echo $menu; ?></div>

  <div id="content">
    <?php if (isset($message)) {echo $message;} ?>
     
    <div id="div_left">
      Info. General<br><br>
      <table id = "group_table">
        <tr>
          <td>Total Socios:</td>
          <td ><a href="javascript:void()" OnClick='ShowUsers()'><?=$c_users?></a></td>
        </tr>
        <tr>
          <td>Socios Activos:</td>
          <td><a href="javascript:void()" OnClick='ShowActiveUsers()'><?=$c_active_users?></a></td>
        </tr>           
        <tr>
          <td>Socios Desactivos:</td>
          <td><a href="javascript:void()" OnClick='ShowDeactiveUsers()'><?=$c_deactive_users?></a></td>
        </tr>             
        <tr>
          <td>Socios a vencer:</td>
          <td><a href="javascript:void()" OnClick='ShowDebtUsers()'><?=$c_next_debt_users?></a></td>
        </tr>               
      </table>
    </div>
    <div id="div_right">
      <div id='users' style='display:none;'><?=$table_users?></div>    
      <div id='active_users' style='display:none;'><?=$table_active_users?></div>    
      <div id='deactive_users' style='display:none;'><?=$table_deactive_users?></div>    
      <div id='deptors_users' style='display:none;'><?=$table_debtor_users?></div>    
      <br><br><br>
    </div>

  </div>  


