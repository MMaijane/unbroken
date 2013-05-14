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


    echo anchor("users/view/{$user['id_user']}/change_status", "Ver historial"); 
  ?>
  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

    