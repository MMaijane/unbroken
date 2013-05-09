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
    $this->load->view('subscribe/index', $data);
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
    $data['vc_phonenumber'] = array('name'=>'vc_phonenumber', 'size'=>30, 'key'=>'Telefono');
    $data['vc_msisdn']      = array('name'=>'vc_msisdn', 'size'=>30, 'key'=>'Celular');
    $data['vc_picture']     = array('name'=>'vc_picture', 'size'=>30, 'key'=>'Imagen');
    

    $this->load->view('subscribe/new_subscription', $data); 


		/* validacion si es nueva inscripcion o re inscripcion */
 	}

  function view (){
    parent::__construct();	

 		$this->load->helper('number_helper');
	 	$this->load->model('subscribe_bss', '', TRUE);
    $data['users'] = $this->subscribe_bss->get_users();
    $this->load->view('welcome_message', $data);
  }

	function edit ($type = NULL) {
 		parent::__construct();
 		
 		$this->load->helper('number_helper');
	 	$this->load->model('subscribe_bss', '', TRUE);
    $data['users'] = $this->subscribe_bss->get_users();
    $this->load->view('welcome_message', $data);
  }

  function deptors () {
  	parent::__construct();


 		$this->load->helper('number_helper');
	 	$this->load->model('subscribe_bss', '', TRUE);
    $data['users'] = $this->subscribe_bss->get_users();
    $this->load->view('welcome_message', $data);
  }




}
