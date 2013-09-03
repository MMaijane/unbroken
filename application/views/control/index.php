
<?php $this->load->view('templates/header'); 

$valid = isset($valid)? $valid : 0;
$valid_subs = isset($valid_subs)? $valid_subs : 0;
$saludo = "Bienvenido";


?>
<body>


<script type="text/javascript">
window.setTimeout("HideDiv()", 7000); //Hide Div after 2 seconds

function HideDiv()
{
    document.getElementById('saludo').style.display ='none';
}
</script>




    <!-- notificacion -->
  <p class='error'><?php echo isset($msg)? $msg : ''  ?> </p>   

  <div id="header">
    <div id="img_left"></div>
    <div id="img_right"></div>
  </div>


  <div id="menu">

  </div>


  <div id="content_2">
    <div>
        <?php echo form_open('control/validate_input'); ?>
        <hr>
        <table border="0" align='center' >
          <tr><td>No. Id : <?=form_input('id_acceso', '', 'size=5')?></td>
              <td><?php echo form_submit('validate_id','Entrar!');  ?> </td></tr>
        </table><hr><?php 
        echo form_close();  ?>


        <?php 
        if ($valid == 1){ 
          $saludo = "<br>".$saludo.'<br> '.$user['vc_username'].' '.$user['vc_lastname']."<br>";
          if ($valid_subs == 1){ 
            $date = $user_subs['dt_expires'];
            $subs = "Tu número de suscripción es <b> ".$user_subs['vc_folio']."</b> y termina el <b>".$date."</b>";
          } else {
            $subs = "No tienes uns subscripción activa, se venció el <b> ".$user_old_subs['dt_expires']."</b>";
          } 
        } else { 
          $saludo = "No existe el usuario.";
          $o = 0;
          $subs = "";
        } ?>





<div id='saludo'>
<?php if ($valid_subs == 1) { ?>
      <div  class='data_control'>
<?php } else { ?>        
      <div  class='data_control_error'>
<?php } ?>
        <table id ="main_table_3"  >
          <tr>
            <td class="inner_photo_2"><? 
              if (!isset($o)){
                if ($user['vc_picture'] != '') {?>
                  <img src="<?=base_url()?>img/users_pics/<?=$user['vc_picture']?>" class='usr_pic'></img>
                <?php } else { ?>
                  No hay fotografia
                <?php } 
              } ?>
            </td>
              <td><?php echo $saludo.$subs;?></td>
          </tr>
        </table>
      </div>
</div>
    </div>
  </div>  
