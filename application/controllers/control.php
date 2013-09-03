<?php


/*
 index - ver usuarios
 subscribe - subscripcion
 deptors - ver usuarios con corte ,, corte 15 y 30 de mes
 edit - edit an user
 view - ver un solo usuario 



  cambio de variables,,   

    vc_facebook = horario
    vc_state = Colonia
    vc_cp = G. Medicos
    vc_pais = Emergencia

    done ** validar # folio
    done ** historial sin boton 
    done ** que se actualiza las subs para el prox año




 cambiar la base de datos para que aceepte d-m-y 


*/


class Control extends CI_Controller{

  function Control() {
  	parent::__construct();
    $this->load->model('control_bss');
    $this->load->model('users_bss');
    $this->load->helper('url');
    $this->load->helper('html'); 
    $this->load->library('table');
    $this->load->library('form_validation'); 
    $this->load->database();
  } 


  function index($msg='') {
    #mandar a vista
    $data = $this->users_bss->general();
    $this->load->view('control/index', $data);
  }


  function validate_input($id=''){
    
    $data['user'] = $this->users_bss->view_user_by_id($this->input->post('id_acceso'));
    $data['user_subs'] = $this->users_bss->view_active_package($this->input->post('id_acceso'));
    $data['valid'] = isset($data['user']["id_user"]) ? 1: 0 ;
    $data['valid_subs'] = isset($data['user_subs']["id_subscription"]) ? 1: 0 ;

    if ($data['valid_subs'] == 0){
      $data['user_old_subs'] = $this->users_bss->view_last_old_subs($this->input->post('id_acceso'));
    }


    $this->load->view('control/index', $data);
  }





}
