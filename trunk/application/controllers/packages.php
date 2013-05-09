<?php


/*
	index - ver paetes
	edit - editar paquete
	create - crear paquete


*/


class Packages extends CI_Controller{

	public function index() {
		parent::__construct();

    $data['title'] = "My Real Title";
		$data['heading'] = "My Real Heading";

    $this->load->view('packages', $data);
	}

	function edit () {
		parent::__construct();

    $data['title'] = "My Real Title";
		$data['heading'] = "My Real Heading";

    $this->load->view('packages', $data);
	}

	function create () {
		parent::__construct();

    $data['title'] = "My Real Title";
		$data['heading'] = "My Real Heading";

    $this->load->view('packages', $data);
	}


}
?>