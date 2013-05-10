<?php

class Users_bss extends CI_Model {



  function Users() {
    // Call the Model constructor
    parent::Users();
    $this->load->helper('url');
  }
    



  function get_users() {

    $query = $this->db->get('tb_users', 10);
    return $query->result();
  }




  function insert_entry() {

    $this->load->database();

    $data = array(
      'vc_username'=>$this->input->post('vc_username'),
      'vc_lastname'=>$this->input->post('vc_lastname'),
      'dt_birthday'=>$this->input->post('dt_birthday'),
      'vc_phonenumber'=>$this->input->post('vc_phonenumber'),
      'vc_msisdn'=>$this->input->post('vc_msisdn'),
      'vc_picture'=>$this->input->post('vc_picture'),
    );

    $this->db->insert('tb_users', $data);
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