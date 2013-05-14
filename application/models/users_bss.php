<?php


/****
view_user_by_id
SELECT * FROM 'tb_subscriptions'
JOIN 'tb_packages' ON ('tb_packages.id_package = tb_subscriptions.id_package') WHERE tb_subscriptions.id_user = 12


SELECT * FROM `tb_users` 
JOIN tb_subscriptions ON ('tb_subscriptions.id_user = tb_users.id_user')
JOIN tb_packages ON ('tb_packages.id_package = tb_subscriptions.id_package')


*****/



class Users_bss extends CI_Model {



  function Users() {
    // Call the Model constructor
    parent::Users();
    $this->load->helper('url');
  }
    


  // funvtion for index
  function get_users() {

    $query = $this->db->get('tb_users');
    return $query->result_array();
  }



  //done
  function insert_user($user_data) {

    $this->load->database();
    $this->db->insert('tb_users', $user_data);
  }



  //done
  function insert_subscription($subscription_data) {

    $this->load->database();
    $this->db->insert('tb_subscriptions', $subscription_data);    
  }


  //done
  function get_user_id($vc_username, $dt_birthday) {

    $this->db->select('id_user');
    $this->db->from('tb_users');
    $this->db->where('vc_username', $vc_username );
    $this->db->where('dt_birthday', $dt_birthday );
    $query = $this->db->get();

    return $query->row_array();    
  }




  function view_user_by_id($id) {
    

    $this->db->select('*');
    $this->db->from('tb_users');
    $this->db->join('tb_subscriptions subs', 'subs.id_user = usr.id_user');
    $this->db->join('tb_packages pack', 'subs.id_package = pack.id_package');
    $this->db->where('usr.id_user', $id );
    $this->db->where('subs.b_status', '1' );

    $query = $this->db->get('tb_users');
    return $query->result_array();

  }

  //done
  function general () {

    $this->load->library('menu');

    # menu
    $menu = new Menu;
    $data['menu'] = $menu->show_menu();

    return $data;
  }


}



?>