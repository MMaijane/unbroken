
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
  $this->table->set_caption("Listado de paquetes");

  //-- Header Row
  $this->table->set_heading('Nombre', 'Descripcion', 'Meses', 'Precio', 'Creado', 'Status');

  //-- Content Rows
  foreach($packages as $key => $value) {

    #change the date form - from  yyyy-mm-dd to dd-mm-yyyy
    $f = explode('-', $value['dt_created']);
    $ff = $f[2].'-'.$f[1].'-'.$f[0];

    $vc_status = $value['b_status'] == 1? 'activo' : 'deactivo';
    $status = $value['b_status'] == 1? 0:1;

    $this->table->add_row(
      $value['vc_package_name'],
      $value['vc_description'],
      $value['i_months'],
      $value['i_price'],
      $ff,
      $vc_status,
      anchor("packages/change_status/{$value['id_packages']}/{$status}", 'Cambiar')
    );
  } 
?>

<?php $this->load->view('templates/header'); ?>
<body>
    <!-- notificacion -->
  <p class='error'><?php echo isset($msg)? $msg : ''  ?> </p>   

  <div id="header">
  </div>

  <div id="menu">
    <?php echo $menu; ?>
  </div>


  <div id="content">
    <?php if (isset($message)) {echo $message.br();} ?>
      
    <table name="tb_new_user" id="tb_new_user"> 
      <tr><td><?=anchor("packages/add", "nvo. paquete")?></td></tr>
    </table>
      
    <?php
      //-- Display Table
      $table = $this->table->generate();
      echo $table;
    ?>
  </div>  


<?php $this->load->view('templates/footer'); ?>
