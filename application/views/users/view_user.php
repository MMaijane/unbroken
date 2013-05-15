<style type="text/css">

#content {
  float:left; 
  width:100%; 
  height: 80%;
  background-color: blue;
  font: bold 18px Verdana; 
  line-height:normal; 
} 

#menu ul {
  font: bold 23px Verdana; 

}


}
</style>


<html>
<head></head>
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
          
        

        } else {
          echo "Datos principales".br();
          echo $user['vc_username'].br();
          echo $user['vc_lastname'].br();
          echo $user['dt_birthday'].br();
          echo $user['vc_worknumber'].br();
          echo $user['vc_phonenumber'].br();
          echo $user['vc_msisdn'].br();

          echo "Direccion".br();
          echo $user['vc_street'].br();
          echo $user['vc_city'].br();
          echo $user['vc_state'].br();
          echo $user['i_cp'].br();
          echo $user['vc_country'].br();
          
          echo "Web".br();
          echo $user['vc_email'].br();
          echo $user['vc_facebook'].br(); 

          echo "Registro".br();
          echo $user['dt_registry'].br();
          echo $user['vc_picture'].br(); 
          
          echo "Paquete".br();
          echo $user['vc_package_name'].br();
          echo $user['vc_description'].br(); 
          echo $user['dt_subscription'].br();
          echo $user['dt_expires'].br(); 
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

    