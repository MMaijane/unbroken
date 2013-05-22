
<html>
<head>
 <style> @import url('<?=base_url()?>css/main.css'); </style>
</head>
<body>
  <div id="header">
    <?php $this->load->view('templates/header'); ?>
  </div>

  <div id="menu">
    <?php echo $menu; ?>
  </div>

  <div id="content">
  <?php 
echo base_url().'css/main.css';
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