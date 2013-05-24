
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
  
  $this->table->set_template($tmpl);    
  $this->table->set_caption("Listado de Socios");

  //-- Header Row
  $this->table->set_heading('# Socio', 'Nombre', 'Tel. casa', 'Celular', 'Email', 'Facebook', 'Registrado desde');

  //-- Content Rows
  foreach($users as $key => $value) {

    #change the date form - from  yyyy-mm-dd to dd-mm-yyyy
    $f = explode('-', $value['dt_birthday']);
    $ff = $f[2].'-'.$f[1].'-'.$f[0];


    $this->table->add_row(
      $value['id_user'],
      anchor("users/view/{$value['id_user']}", $value['vc_username']." ".$value['vc_lastname']),
      $value['vc_phonenumber'],
      $value['vc_msisdn'],
      $value['vc_email'],
      $value['vc_facebook'],
      $ff
    );
  } 
?>

<html>
<head>
 <style> @import url('<?=base_url()?>css/main.css'); </style>
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
    <?php if (isset($message)) {echo $message;} ?>
      
    <table name="tb_new_user" id="tb_new_user"> 
      <tr><td><?=anchor("users/subscribe", "nvo. cliente")?></td></tr>
    </table>
      
    <?php
      //-- Display Table
      $table = $this->table->generate();
      echo $table;
    ?>
  </div>  


<!--  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>

-->
</body>
</html>