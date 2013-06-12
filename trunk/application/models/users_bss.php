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


  function get_debt_users($slot, $day) {

    $day = date('d');
    if ($day <= 15 && $day <= 7) { $b_slot = 1; $d_day = 30;#30
    } else if ($day <=15 && $day > 7) { $b_slot = 2; $d_day = 15; #15
    } else if ($day <= 30 && $day <= 23) { $b_slot = 2; $d_day = 15; #15
    } else { $b_slot = 1; $d_day = 30; #30
    }
            
    $m = date('m');
    $expires_date  = date('Y-'.$m.'-'.$d_day);


    $query = $this->db->query("select * from tb_subscriptions subs ".
                              "join tb_users usr on (usr.id_user = subs.id_user) ".
                              "join tb_packages pack on (pack.id_packages = subs.id_package) ".
                              "where subs.b_slot= {$slot} and subs.b_status=1 and subs.dt_expires <= '{$expires_date}' ".
                              "order by dt_subscription desc");

    return $query->result_array();
  }


  function get_deactive_users() {

    $query = $this->db->query("select * from tb_users usr ".
                              "where usr.id_user NOT IN (select id_user from tb_subscriptions subs where b_status=1 ) ".
                              "order by usr.id_user asc");

    return $query->result_array();
  }


  function get_active_users() {

    $query = $this->db->query("select * from tb_subscriptions subs ".
                              "join tb_users usr on (usr.id_user = subs.id_user) ".
                              "join tb_packages pack on (pack.id_packages = subs.id_package) ".
                              "where subs.b_status=1 ".
                              "order by dt_expires desc");

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



  function update_user($id_user, $subscription_data) {

    $this->db->where('id_user', $id_user);
    $this->db->update('tb_users', $subscription_data);
  }



  //done
  function get_user_id($vc_username, $dt_birthday) {


    $query = $this->db->query("select id_user from tb_users usr ".                        
                              "order by id_user desc");

    return $query->row_array();    
  }




  function view_user_by_id($id) {

    $query = $this->db->query("select * from tb_users usr  ".
                              "where usr.id_user= {$id} ");
    return $query->row_array();
  }


  function view_active_package($id) {

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


  function set_past_subscriptions() {

    $date = date("Y-m-d");
    $query = $this->db->query("update tb_subscriptions subs ".
                              "set subs.b_status=0 ".
                              "where subs.b_status=1 and subs.dt_expires <= '{$date}' ");
  }


  function update_pic_name($user_id, $pic_name){
   $query = $this->db->query("update tb_users usr ".
                              "set usr.vc_picture='{$pic_name}' ".
                              "where usr.id_user={$user_id} "); 
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