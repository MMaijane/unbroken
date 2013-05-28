<?php


/*
	index - ver paetes
	edit - editar paquete
	create - crear paquete


*/


class Packages extends CI_Controller{

	function Packages() {
		parent::__construct();

    $this->load->helper('url');
    $this->load->helper('html'); 
    $this->load->library('table'); 
		$this->load->database();
		$this->load->model('users_bss');
		$this->load->model('packages_bss');
	}




  /* index
   *
   * Show all the created packages 
   * sorted by b_status
   *
  */
	function index($msg='') {

    $data = $this->users_bss->general();
		$data['packages'] = $this->packages_bss->get_packages();
    $data['msg'] = $msg;
    $data['change'] = $this->uri->segment(4);

    $this->load->view('packages/index', $data);
}




  /* create
   *
   * show the form to create a new package
   *
  */
	function add () {

    # librerias
    $this->load->helper('form');          
    $data = $this->users_bss->general();

		# return of the form
    if($this->input->post('new_package')) {

      $this->load->library('form_validation');
      if ($this->form_validation->run('packages') != FALSE) {    

          $insert = array(
            'vc_package_name'=>$this->input->post('vc_package_name'),
            'vc_description'=>$this->input->post('vc_description'),
            'i_months'=>$this->input->post('i_months'),
            'i_price'=>$this->input->post('i_price'),
            'dt_created'=>date('Y-m-d'),
          );

          $this->packages_bss->insert_package($insert);

          $msg = "Se genero un paquete nuevo.";
          $this->index($msg);
      }    
    } 

    
    # data fileds
    $data['vc_package_name']  = array('name'=>'vc_package_name', 'size'=>30, 'key'=>'Nombre');    
    $data['i_months']         = array('name'=>'i_months', 'size'=>5, 'key'=>'Meses');
    $data['i_price']          = array('name'=>'i_price', 'size'=>5, 'key'=>'Costo');
    $data['vc_description']   = array('name'=>'vc_description', 'size'=>80, 'key'=>'Descripcion');
         
    $this->load->view('packages/new_package', $data);  
	}







  /* change_status
   *
   * change the status of a packages
   * can turn on/off each one
   *
  */
	function change_status ($id, $status) {

		$this->packages_bss->change_status($id, $status);
    $msg = "Se cambio el status de un paquete.";
    $this->index($msg);
	}


/* 
    # get the action
    $action =  $this->uri->segment(4);

    if ($action == 'change_status') {
      $data['pack'] = $this->packages_bss->view_package($id);
      $status = $data['pack']['b_status'] == 1 ? 0 : 1 ;

      # change status
      $this->change_status($id, $status);
    }

*/


}
?>


