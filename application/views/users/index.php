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

    if (isset($message)) { echo $message.br(); } 
    echo anchor("users/subscribe", "nvo. cliente").br();

    foreach ($users as $key => $value) { 
      echo anchor("users/view/{$value['id_user']}", $value['vc_username']); 
    }  
  ?>

  </div>  


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>