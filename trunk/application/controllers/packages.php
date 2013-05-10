<?php


/*
	index - ver paetes
	edit - editar paquete
	create - crear paquete


*/


class Packages extends CI_Controller{

	function Packages() {
		parent::__construct();
		$this->load->database();
	}


	function index() {

		$this->load->model('packages_bss');
		$this->load->model('users_bss');
   

    $data = $this->users_bss->general();
		$data = $this->packages_bss->get_packages();


    $this->load->view('packages/index', $data);
	}


	function create () {

    # librerias
    $this->load->helper('form');  
    $this->load->helper('html');  
    $this->load->model('packages_bss');
    $this->load->model('users_bss');

		# return of the form
    if($this->input->post('create_package')) {
      $this->packages_bss->insert_package();
    }

    $data = $this->users_bss->general();

    # data fileds
    $data['vc_package_name']  = array('name'=>'vc_package_name', 'size'=>30, 'key'=>'Nombre');    
    $data['i_months']    			= array('name'=>'i_months', 'size'=>5, 'key'=>'Meses');
    $data['i_price']  				= array('name'=>'i_price', 'size'=>5, 'key'=>'Costo');
    $data['vc_description']   = array('name'=>'vc_description', 'size'=>80, 'key'=>'Descripcion');
   
    $this->load->view('packages/new_package', $data); 
	}



	function edit ($id) {


echo $id;

	}


}
?>