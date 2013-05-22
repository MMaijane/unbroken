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
     echo "Paquete : "                  .form_dropdown('id_pack', $packs, 'large').br(); 

     echo base_url();
  ?>
  
    <!-- First, include the JPEGCam JavaScript Library -->
  <script type="text/javascript" src="<?=base_url()?>camera/webcam.js"></script>
  
  <!-- Configure a few settings -->
  <script language="JavaScript">

    webcam.set_api_url( 'camera/capture.php' );
    webcam.set_quality( 90 ); // JPEG quality (1 - 100)
    webcam.set_shutter_sound( true ); // play shutter click sound
  </script>
  
  <!-- Next, write the movie to the page at 320x240 -->
  <script language="JavaScript">
    document.write( webcam.get_html(320, 240) );
  </script>



  <input type=button value="Configure..." onClick="webcam.configure()">
    &nbsp;&nbsp;
    <input type=button value="Take Snapshot" onClick="take_snapshot()">






  <script language="JavaScript">
    webcam.set_hook( 'onComplete', 'my_completion_handler' );
    
    function take_snapshot() {
      // take snapshot and upload to server
      document.getElementById('upload_results').innerHTML = '<h1>Uploading...</h1>';
      webcam.snap();
    }
    
    function my_completion_handler(msg) {
      // extract URL out of PHP output
      if (msg.match(/(http\:\/\/\S+)/)) {
        var image_url = RegExp.$1;
        // show JPEG image in page
        document.getElementById('upload_results').innerHTML = 
          '<h1>Upload Successful!</h1>' + 
          '<h3>JPEG URL: ' + image_url + '</h3>' + 
          '<img src="' + image_url + '">';
        
        // reset camera for another shot
        webcam.reset();
      }
      else alert("PHP Error: " + msg);
    }
  </script>
  
  </td><td width=50>&nbsp;</td><td valign=top>
    <div id="upload_results" style="background-color:#eee;"></div>
  </td></tr></table>







  <?php   
     echo form_submit('new_subscription','Submit!');  
     echo form_close(); 
  ?>

  </div> 


  <div id="footer">
    <?php $this->load->view('templates/footer'); ?>
  </div>
</body>
</html>

