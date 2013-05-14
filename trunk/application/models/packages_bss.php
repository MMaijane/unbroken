<?php

class Packages_bss extends CI_Model {



  function Packages() {
    // Call the Model constructor
    parent::Packages();
    $this->load->helper('url');
    $this->load->database();
  }
    



  function get_packages() {

    $query = $this->db->get('tb_packages');

    return $query->result_array();
  }




  function insert_package() {

    $data = array(
      'vc_package_name'=>$this->input->post('vc_package_name'),
      'vc_description'=>$this->input->post('vc_description'),
      'i_months'=>$this->input->post('i_months'),
      'i_price'=>$this->input->post('i_price'),
      'dt_created'=>date('y-m-d'),
    );

    $this->db->insert('tb_packages', $data);
  }




  function view_package ($id) {
  
    $query = $this->db->get_where('tb_packages', array('id_packages' => $id));
    return $query->row_array();
  }




  function change_status ($id, $status) {

    $data = array ('b_status' => $status);
    $this->db->where('id_packages', $id);
    $this->db->update('tb_packages', $data);
  }



  function get_package_months($id) {

    $this->db->select('i_months');
    $this->db->from('tb_packages');
    $this->db->where('id_packages', $id );
    $query = $this->db->get();
    return $query->row_array();

  }

  function general () {

    $this->load->library('menu');

    # menu
    $menu = new Menu;
    $data['menu'] = $menu->show_menu();

    return $data;
  }


}
?>