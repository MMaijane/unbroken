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

    <?php echo form_open('users/subscribe'); ?>
    <?php echo $vc_username['key']     .' : '.form_input($vc_username['name']).br(); ?>
    <?php echo $vc_lastname['key']     .' : '.form_input($vc_lastname['name']).br(); ?>
    <?php echo $dt_birthday['key']     .' : '.form_input($dt_birthday['name']).br(); ?>
    <?php echo $vc_phonenumber['key']  .' : '.form_input($vc_phonenumber['name']).br(); ?>
    <?php echo $vc_msisdn['key']       .' : '.form_input($vc_msisdn['name']).br(); ?>
    <?php echo $vc_picture['key']      .' : '.form_input($vc_picture['name']).br(); ?>
    <?php echo form_submit('mysubmit','Submit!');  ?>
    <?php echo form_close(); ?>

  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

    