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
    echo anchor("packages/add", "crear").br();

    foreach ($packages as $key => $value) { 
      echo anchor("packages/view/{$value['id_packages']}", $value['vc_package_name']); 
    }  
  ?>



  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

    