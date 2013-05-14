<?php


/*
 index - ver usuarios
 subscribe - subscripcion
 deptors - ver usuarios con corte ,, corte 15 y 30 de mes
 edit - edit an user
 view - ver un solo usuario 


*/


class Users extends CI_Controller{

  function Users() {
  	parent::__construct();
    $this->load->model('users_bss');
    $this->load->helper('url');
    $this->load->helper('html'); 
    $this->load->database();
  } 


  function index() {

    # get data
    $data = $this->users_bss->general();
    $data['users'] = $this->users_bss->get_users();





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


      $date = date("Y-m-d");

      # tb_users
      $user_data = array(
        'vc_username'=>$this->input->post('vc_username'),
        'vc_lastname'=>$this->input->post('vc_lastname'),
        'dt_birthday'=>$this->input->post('dt_birthday'),
        'vc_worknumber'=>$this->input->post('vc_worknumber'),
        'vc_phonenumber'=>$this->input->post('vc_phonenumber'),
        'vc_msisdn'=>$this->input->post('vc_msisdn'),
        'vc_street'=>$this->input->post('vc_street'),
        'vc_city'=>$this->input->post('vc_city'),
        'vc_state'=>$this->input->post('vc_state'),
        'i_cp'=>$this->input->post('i_cp'),
        'vc_country'=>$this->input->post('vc_country'),
        'vc_email'=>$this->input->post('vc_email'),
        'vc_facebook'=>$this->input->post('vc_facebook'),
        'dt_registry'=>$date,
        'vc_picture'=>$this->input->post('vc_picture'),
      );
      $this->users_bss->insert_user($user_data);



      # obtain the expires date with the package id
      $package_months = $this->packages_bss->get_package_months($this->input->post('id_pack'));
      $user_id = $this->users_bss->get_user_id($this->input->post('vc_username'), $this->input->post('dt_birthday'));
      $expires = "+{$package_months['i_months']} month";
      $expires_date = date('Y-m-d', strtotime("{$expires}", strtotime($date)));


      # ver el corte (15 - 30)
      $day = date('d');
      if ($day <= 15 && $day <= 7) {
        $b_slot = 1; #30
      } else if ($day <=15 && $day > 7) {
        $b_slot = 2; #15
      } else if ($day <= 30 && $day <= 23) {
        $b_slot = 2; #15
      } else {
        $b_slot = 1; #30
      }

      # tb_subscriptions
      $subscription_data = array(
        'id_user'=>$user_id['id_user'],
        'id_package'=>$this->input->post('id_pack'),
        'dt_subscription'=>$date,
        'dt_expires'=>$expires_date,
        'b_slot'=>$b_slot,
        'b_status'=>'1',
      );
    
      $this->users_bss->insert_subscription($subscription_data);

      redirect('/users/index', 'index', 301);

        /* redirecto to index whit popup */
    } else {

      #new subscription
      $data = $this->users_bss->general();
      $data['packages'] = $this->packages_bss->get_packages();

      foreach ($data['packages'] as $key => $value) {
        $data['packs'][] = array ($value['id_packages'] => $value['vc_package_name']);
      }


      # data fileds
      $data['vc_username']    = array('name'=>'vc_username', 'size'=>30, 'key'=>'Nombre');    
      $data['vc_lastname']    = array('name'=>'vc_lastname', 'size'=>30, 'key'=>'Apellidos');
      $data['dt_birthday']    = array('name'=>'dt_birthday', 'size'=>30, 'key'=>'Fecha de nacimiento');
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
        

      $this->load->view('users/new_subscription', $data); 
    }
  		/* validacion si es nueva inscripcion o re inscripcion */
  }




  function view ($id) {


    # get the action
    $action =  $this->uri->segment(4);

    if ($action == 'change_status') {
      $data['pack'] = $this->packages_bss->view_package($id);
      $status = $data['pack']['b_status'] == 1 ? 0 : 1 ;

      # change status
      $this->change_status($id, $status);
    }



    $this->load->helper('form'); 
    $data = $this->users_bss->general();
    $data['pack'] = $this->users_bss->view_user_by_id($id);

    var_dump($data['pack']);
    $this->load->view('packages/view_package', $data);



    $this->load->helper('number_helper');
    $this->load->model('subscribe_bss', '', TRUE);
    $data['users'] = $this->subscribe_bss->get_users();
    $this->load->view('welcome_message', $data);
  }


  function deptors () {

  	$this->load->helper('number_helper');
  	$this->load->model('subscribe_bss', '', TRUE);
    $data['users'] = $this->subscribe_bss->get_users();
    $this->load->view('welcome_message', $data);
  }



}
