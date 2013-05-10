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
    $this->load->database();
	} 


	function index() {
    
    # load
    $this->load->model('users_bss');
   

    $data = $this->users_bss->general();
    var_dump($data);
    #obtener los datos a mostrar
    # get data
    #$data['users'] = $this->users_bss->get_users();


    #mandar a vista
    $this->load->view('users/index', $data);
	}




 	function subscribe () {
    
    # librerias
    $this->load->helper('form');  
    $this->load->helper('html');  
    $this->load->model('users_bss');

    # return of the form
    if($this->input->post('mysubmit')) {
      $this->users_bss->insert_entry();
    }

    $data = $this->users_bss->general();

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


		/* validacion si es nueva inscripcion o re inscripcion */
 	}

  function view (){

 		$this->load->helper('number_helper');
	 	$this->load->model('subscribe_bss', '', TRUE);
    $data['users'] = $this->subscribe_bss->get_users();
    $this->load->view('welcome_message', $data);
  }

	function edit ($type = NULL) {
 		
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
