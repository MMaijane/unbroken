<?php

class Packages_bss extends CI_Model {



  function Packages() {
    // Call the Model constructor
    parent::Packages();
    $this->load->helper('url');
    $this->load->database();
  }
    



  function get_packages() {
    $query = $this->db->query("select * from tb_packages pk  ".
                              "order by pk.b_status desc ");
    return $query->result_array();
  }



  function get_active_packages() {

    $query = $this->db->get_where('tb_packages', array('b_status' => '1'));

    return $query->result_array();
  }




  function insert_package($data) {

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