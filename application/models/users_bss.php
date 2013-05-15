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
    
    $query = $this->db->query("select * from tb_subscriptions subs ".
                              "join tb_users usr on (usr.id_user = subs.id_user) ".
                              "join tb_packages pack on (pack.id_packages = subs.id_package) ".
                              "where usr.id_user= {$id} and subs.b_status=1");
    return $query->row_array();
  }



  function view_user_history_by_id ($id) {

    $query = $this->db->query("select * from tb_subscriptions subs ".
                              "join tb_users usr on (usr.id_user = subs.id_user) ".
                              "join tb_packages pack on (pack.id_packages = subs.id_package) ".
                              "where usr.id_user= {$id} and subs.b_status=0 ".
                              "order by dt_subscription desc");

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