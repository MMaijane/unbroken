
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

    <?php echo form_open('packages/create'); ?>
    <?php echo $vc_package_name['key']  .' : '.form_input($vc_package_name['name']).br(); ?>
    <?php echo $i_months['key']         .' : '.form_input($i_months['name']).br(); ?>
    <?php echo $i_price['key']          .' : '.form_input($i_price['name']).br(); ?>
    <?php echo $vc_description['key']   .' : '.form_input($vc_description['name']).br(); ?>
    <?php echo form_submit('create_package','Submit!');  ?>
    <?php echo form_close(); ?>


  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

    