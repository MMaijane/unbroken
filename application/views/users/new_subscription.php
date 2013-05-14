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
     echo form_open('users/subscribe'); 
     echo $vc_username['key']     .' : '.form_input($vc_username['name']).br(); 
     echo $vc_lastname['key']     .' : '.form_input($vc_lastname['name']).br(); 
     echo $dt_birthday['key']     .' : '.form_input($dt_birthday['name']).br(); 
     echo $vc_worknumber['key']   .' : '.form_input($vc_worknumber['name']).br(); 
     echo $vc_phonenumber['key']  .' : '.form_input($vc_phonenumber['name']).br(); 
     echo $vc_msisdn['key']       .' : '.form_input($vc_msisdn['name']).br(); 
     echo $vc_street['key']       .' : '.form_input($vc_street['name']).br(); 
     echo $vc_city['key']         .' : '.form_input($vc_city['name']).br(); 
     echo $vc_state['key']        .' : '.form_input($vc_state['name']).br(); 
     echo $i_cp['key']            .' : '.form_input($i_cp['name']).br(); 
     echo $vc_country['key']      .' : '.form_input($vc_country['name']).br(); 
     echo $vc_email['key']        .' : '.form_input($vc_email['name']).br(); 
     echo $vc_facebook['key']     .' : '.form_input($vc_facebook['name']).br(); 
     echo $vc_picture['key']      .' : '.form_input($vc_picture['name']).br(); 
     echo "Paquete : "                  .form_dropdown('id_pack', $packs, 'large'); 
     echo form_submit('new_subscription','Submit!');  
     echo form_close(); 
  ?>



  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

