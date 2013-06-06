<?php


/*
 index - ver usuarios
 subscribe - subscripcion
 deptors - ver usuarios con corte ,, corte 15 y 30 de mes
 edit - edit an user
 view - ver un solo usuario 



 cambiar la base de datos para que aceepte d-m-y 


*/


class Users extends CI_Controller{

  function Users() {
  	parent::__construct();
    $this->load->model('users_bss');
    $this->load->helper('url');
    $this->load->helper('html'); 
    $this->load->library('table');
    $this->load->library('form_validation'); 
    $this->load->database();
  } 


  function index($msg='') {

    # get data
    $data = $this->users_bss->general();
    $data['users'] = $this->users_bss->get_users();
    $data['message'] = $this->uri->segment(4);
    $data['msg'] = $msg;


    $this->load->library('pagination');
    $config['base_url'] = base_url().'index.php/users/index/';
    $config['total_rows'] = $this->db->count_all('tb_users');
    $config['per_page'] = '10';
    $config['full_tag_open'] = '<p>';
    $config['full_tag_close'] = '</p>';
    $this->pagination->initialize($config);


    #mandar a vista
    $this->load->view('users/index', $data);
  }


  //done
  function subscribe () {
      
    # librerias
    $this->load->helper('form');  
    $this->load->model('packages_bss');

    # return for the form
    if($this->input->post('new_subscription')) {
      
                 
      if ($this->form_validation->run('subscribe') != FALSE) { 
       
            # correcto
            $date = date("Y-m-d");
            $dt_birthday = $this->input->post('yyyy').'-'.$this->input->post('mm').'-'.$this->input->post('dd');

            # tb_users
            $user_data = array(
              'vc_username'=>htmlentities(strtoupper($this->input->post('vc_username'))),
              'vc_lastname'=>strtoupper($this->input->post('vc_lastname')),
              'dt_birthday'=>$dt_birthday,        
              'vc_worknumber'=>$this->input->post('vc_worknumber'),
              'vc_phonenumber'=>$this->input->post('vc_phonenumber'),
              'vc_msisdn'=>$this->input->post('vc_msisdn'),
              'vc_street'=>strtoupper($this->input->post('vc_street')),
              'vc_city'=>strtoupper($this->input->post('vc_city')),
              'vc_state'=>strtoupper($this->input->post('vc_state')),
              'i_cp'=>$this->input->post('i_cp'),
              'vc_country'=>strtoupper($this->input->post('vc_country')),
              'vc_email'=>$this->input->post('vc_email'),
              'vc_facebook'=>$this->input->post('vc_facebook'),
              'dt_registry'=>$date,
              'vc_picture'=>$this->input->post('vc_picture'),
              'vc_coment'=>$this->input->post('vc_coment')
            );
            
            $this->users_bss->insert_user($user_data);
           
            # obtain the expires date with the package id
            $package_months = $this->packages_bss->get_package_months($this->input->post('id_pack'));
            $user_id = $this->users_bss->get_user_id($this->input->post('vc_username'), $this->input->post('dt_birthday'));


            # ver el corte (15 - 30)
            $day = date('d');
            if ($day <= 15 && $day <= 7) { $b_slot = 1; $d_day = 30; $expires = $package_months['i_months']-1; #30
            } else if ($day <=15 && $day > 7) { $b_slot = 2; $d_day = 15; $expires = $package_months['i_months']; #15
            } else if ($day <= 30 && $day <= 23) { $b_slot = 2; $d_day = 15;  $expires = $package_months['i_months']; #15
            } else { $b_slot = 1; $d_day = 30; $expires = $package_months['i_months']; #30
            }

            $m = date('m');
            $m = $m + $expires;
            $expires_date  = date('Y-'.$m.'-'.$d_day);
            # tb_subscriptions
            $subscription_data = array(
                  'id_user'=>$this->input->post('id_user'),
                  'id_package'=>$this->input->post('id_pack'),
                  'dt_subscription'=>$date,
                  'dt_expires'=>$expires_date,
                  'b_slot'=>$b_slot,
                  'vc_folio' => $this->input->post('vc_folio'),
                  'b_status'=>'1',
            );

            $this->users_bss->insert_subscription($subscription_data);

            $msg = "Se genero una subscripcion exitosa.";
            $this->index($msg);
      } else {
            $msg = "Nombre, Apellido o Folio no fueron completados.";
            $this->index($msg);
      }
    } else { 

              
      #new subscription
      $data = $this->users_bss->general();
      $data['packages'] = $this->packages_bss->get_active_packages();
      $data['packs'] = array();
      foreach ($data['packages'] as $key => $value) {

        $data['packs'][$value['id_packages']] = $value['vc_package_name']."-".$value['vc_description'];              
      }

      # data fileds
      $data['vc_username']    = array('name'=>'vc_username', 'size'=>30, 'key'=>'Nombre');    
      $data['vc_lastname']    = array('name'=>'vc_lastname', 'size'=>30, 'key'=>'Apellidos');
      $data['dt_birthday']    = array('name'=>'dt_birthday', 'size'=>30, 'key'=>'Fecha de nac.');
      $data['vc_worknumber']  = array('name'=>'vc_worknumber', 'size'=>15, 'key'=>'Oficina');
      $data['vc_phonenumber'] = array('name'=>'vc_phonenumber', 'size'=>15, 'key'=>'Particular');
      $data['vc_msisdn']      = array('name'=>'vc_msisdn', 'size'=>15, 'key'=>'Celular');
      $data['vc_street']      = array('name'=>'vc_street', 'size'=>30, 'key'=>'Calle');
      $data['vc_city']        = array('name'=>'vc_city', 'size'=>30, 'key'=>'Ciudad');
      $data['vc_state']       = array('name'=>'vc_state', 'size'=>30, 'key'=>'Estado');
      $data['i_cp']           = array('name'=>'i_cp', 'size'=>7, 'key'=>'CP.');
      $data['vc_country']     = array('name'=>'vc_country', 'size'=>30, 'key'=>'Pais');
      $data['vc_email']       = array('name'=>'vc_email', 'size'=>40, 'key'=>'E-mail');
      $data['vc_facebook']    = array('name'=>'vc_facebook', 'size'=>30, 'key'=>'Facebook');
      $data['vc_picture']     = array('name'=>'vc_picture', 'size'=>40, 'key'=>'Imagen');
      $data['vc_coment']      = array('name'=>'vc_coment', 'cols'=>40, 'rows'=>90, 'key'=>'Comentario');

                

      $this->load->view('users/new_subscription', $data); 
    }
  }


  function renewal_subscription () {

    $this->load->model('packages_bss');
    $user_id = $this->input->post('id_user');

    $date = date('Y-m-d');  

    # verificar que no halla registro activo
    $data['active_pk'] = $this->users_bss->view_active_package($this->input->post('id_user'));
    if (!empty($data['active_pk'])) {
      
          $msg = "Se encuentra una subscription activa.";
          $this->view($this->input->post('id_user'), $msg);
    } else { #no hay subscription activa
           
            $this->load->library('form_validation');
            if ($this->form_validation->run('renew') != FALSE) { 

                  # obtain the expires date with the package id
                  $package_months = $this->packages_bss->get_package_months($this->input->post('id_pack'));
                  $user_id = $this->users_bss->get_user_id($this->input->post('vc_username'), $this->input->post('dt_birthday'));


                  # ver el corte (15 - 30)
                  $day = date('d');
                  if ($day <= 15 && $day <= 7) { $b_slot = 1; $d_day = 30; $expires = $package_months['i_months']-1; #30
                  } else if ($day <=15 && $day > 7) { $b_slot = 2; $d_day = 15; $expires = $package_months['i_months']; #15
                  } else if ($day <= 30 && $day <= 23) { $b_slot = 2; $d_day = 15;  $expires = $package_months['i_months']; #15
                  } else { $b_slot = 1; $d_day = 30; $expires = $package_months['i_months']; #30
                  }

                  $m = date('m');
                  $m = $m + $expires;
                  $expires_date  = date('Y-'.$m.'-'.$d_day);
                # tb_subscriptions
                $subscription_data = array(
                  'id_user'=>$this->input->post('id_user'),
                  'id_package'=>$this->input->post('id_pack'),
                  'dt_subscription'=>$date,
                  'dt_expires'=>$expires_date,
                  'b_slot'=>$b_slot,
                  'vc_folio' => $this->input->post('vc_folio'),
                  'b_status'=>'1',
                );
                
                $this->users_bss->insert_subscription($subscription_data);

                $msg = "Se renovo una subscripcion exitosa.";
                $this->view($this->input->post('id_user'), $msg);
          } else {

                $msg = "Necesitas un numero de folio.";
                $this->view($this->input->post('id_user'), $msg);
          }
    }
  }


  function view ($id_user, $msg='') {

    $data = $this->users_bss->general();

    # get user data
    $data['msg'] = $msg;
    $data['id_user'] = $id_user;
    $data['user'] = $this->users_bss->view_user_by_id($id_user);
    if (empty($data['user'])) {
      $data['error']['user'] = "No Existe el Socio.";
    }




    # get active package
    $data['active_pk'] = $this->users_bss->view_active_package($id_user);
    if (empty($data['active_pk'])) {
      $data['error']['active_pk'] = "No hay subscripciones activas.";
      
      # offer renewal
      $this->load->helper('form');  
      $this->load->model('packages_bss');
      $data['packages'] = $this->packages_bss->get_active_packages();

        $data['packs'] = array();
        foreach ($data['packages'] as $key => $value) {

          $data['packs'][$value['id_packages']] = $value['vc_package_name'];              
        }
    }



    # get historial
    $data['history_pk'] = $this->users_bss->view_user_history_by_id($id_user);
    if (empty($data['history_pk'])) {
      $data['error']['history_pk'] = "No hay historial de subscriptiones.";
    }



    # go to view
    $this->load->view('users/view_user', $data);
  }



  function edit ($id_user) {
    $this->load->helper('form');  
    $data = $this->users_bss->general();

    $data['id_user'] = $id_user;
    $data['user'] = $this->users_bss->view_user_by_id($id_user);
    if (empty($data['user'])) {
      $data['error']['user'] = "No Existe el Socio.";
    }

    
    # si viene de una actualizacion 
    if($this->input->post('edit_user')) {

          $dt_birthday = $this->input->post('yyyy').'-'.$this->input->post('mm').'-'.$this->input->post('dd');

          # tb_users
          $user_data = array(
            'vc_username'=>strtoupper($this->input->post('vc_username')),
            'vc_lastname'=>strtoupper($this->input->post('vc_lastname')),
            'dt_birthday'=>$dt_birthday,
            'vc_worknumber'=>$this->input->post('vc_worknumber'),
            'vc_phonenumber'=>$this->input->post('vc_phonenumber'),
            'vc_msisdn'=>$this->input->post('vc_msisdn'),
            'vc_street'=>strtoupper($this->input->post('vc_street')),
            'vc_city'=>strtoupper($this->input->post('vc_city')),
            'vc_state'=>strtoupper($this->input->post('vc_state')),
            'i_cp'=>$this->input->post('i_cp'),
            'vc_country'=>strtoupper($this->input->post('vc_country')),
            'vc_email'=>$this->input->post('vc_email'),
            'vc_facebook'=>$this->input->post('vc_facebook'),
            'vc_picture'=>$this->input->post('vc_picture'),
            'vc_coment'=>$this->input->post('vc_coment')
          );

          $this->users_bss->update_user($id_user, $user_data);

          $msg = "Se Modifico el usuario con exito.";
          $this->view($id_user ,$msg);

    } else {
          # data fileds
          $data['id_user'] = $id_user;
          $data['vc_username']    = array('name'=>'vc_username', 'size'=>30, 'key'=>'Nombre', 'value'=>$data['user']['vc_username']);    
          $data['vc_lastname']    = array('name'=>'vc_lastname', 'size'=>30, 'key'=>'Apellidos', 'value'=>$data['user']['vc_lastname']);
          $data['dt_birthday']    = array('name'=>'dt_birthday', 'size'=>30, 'key'=>'Fecha de nac.', 'value'=>$data['user']['dt_birthday']);
          $data['vc_worknumber']  = array('name'=>'vc_worknumber', 'size'=>15, 'key'=>'Oficina', 'value'=>$data['user']['vc_worknumber']);
          $data['vc_phonenumber'] = array('name'=>'vc_phonenumber', 'size'=>15, 'key'=>'Particular', 'value'=>$data['user']['vc_phonenumber']);
          $data['vc_msisdn']      = array('name'=>'vc_msisdn', 'size'=>15, 'key'=>'Celular', 'value'=>$data['user']['vc_msisdn']);
          $data['vc_street']      = array('name'=>'vc_street', 'size'=>30, 'key'=>'Calle', 'value'=>$data['user']['vc_street']);
          $data['vc_city']        = array('name'=>'vc_city', 'size'=>30, 'key'=>'Ciudad', 'value'=>$data['user']['vc_city']);
          $data['vc_state']       = array('name'=>'vc_state', 'size'=>30, 'key'=>'Estado', 'value'=>$data['user']['vc_state']);
          $data['i_cp']           = array('name'=>'i_cp', 'size'=>7, 'key'=>'CP.', 'value'=>$data['user']['i_cp']);
          $data['vc_country']     = array('name'=>'vc_country', 'size'=>30, 'key'=>'Pais', 'value'=>$data['user']['vc_country']);
          $data['vc_email']       = array('name'=>'vc_email', 'size'=>40, 'key'=>'E-mail', 'value'=>$data['user']['vc_email']);
          $data['vc_facebook']    = array('name'=>'vc_facebook', 'size'=>30, 'key'=>'Facebook', 'value'=>$data['user']['vc_facebook']);
          $data['vc_picture']     = array('name'=>'vc_picture', 'size'=>40, 'key'=>'Imagen', 'value'=>$data['user']['vc_picture']);
          $data['vc_coment']      = array('name'=>'vc_coment', 'cols'=>40, 'rows'=>60, 'key'=>'Comentario', 'value'=>$data['user']['vc_coment']);


          # go to view
          $this->load->view('users/edit_user', $data);
    }
  }


  function deptors () {

  	$this->load->helper('number_helper');
  	$this->load->model('subscribe_bss', '', TRUE);
    $data['users'] = $this->subscribe_bss->get_users();
    $this->load->view('welcome_message', $data);
  }
}
