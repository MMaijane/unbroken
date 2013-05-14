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
      
    echo $pack['id_packages'].br();
    echo $pack['vc_package_name'].br();
    echo $pack['vc_description'].br();
    echo $pack['i_months'].br();
    echo $pack['i_price'].br();
    echo $pack['dt_created'].br();
    echo $pack['b_status'].br(); 

    $status = $pack['b_status'] == 1 ? 'Desactivar' : 'Activar';
    echo anchor("packages/view/{$pack['id_packages']}/change_status", $status); 
  ?>
  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

    