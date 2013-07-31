
<?php $this->load->view('templates/header'); ?>
<body>
    <!-- notificacion -->
  <p class='error'><?php echo isset($msg)? $msg : ''  ?> </p>   

  <div id="header">
    <div id="img_left"></div>
    <div id="img_right"></div>
  </div>


  <div id="menu">
    <?php echo $menu; ?>
  </div>


  <div id="content"><br><br><br>
    <div>
        <?php echo form_open('control/validate_input'); ?>
        <table border="0" align='center' >
          <tr><td>No. Id : <?=form_input('id_acceso', '', 'size=5')?></td></tr>
          <tr><td><?php echo form_submit('validate_id','Entrar!');  ?> </td></tr>
        </table><?php 
        
        echo form_close();  ?>
    </div>
  </div>  
