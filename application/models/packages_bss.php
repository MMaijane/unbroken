<?php

class Packages_bss extends CI_Model {



  function Packages() {
    // Call the Model constructor
    parent::Packages();
    $this->load->helper('url');
    $this->load->database();
  }
    



  function get_packages() {

    $query = $this->db->get('tb_packages', 10);
    return $query->result();
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




  function update_entry() {
        
    $this->title   = $_POST['title'];
    $this->content = $_POST['content'];
    $this->date    = time();

    $this->db->update('entries', $this, array('id' => $_POST['id']));
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