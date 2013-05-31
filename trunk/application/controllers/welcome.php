<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

  function Welcome() {
  	parent::__construct();
    $this->load->model('users_bss');
    $this->load->helper('url');
    $this->load->helper('html'); 
    $this->load->library('table');
    $this->load->database();
  } 


  function index($msg='') {

    #cambiar estatus a subscripciones vencidas
    $this->users_bss->set_past_subscriptions();


    # ver el corte (15 - 30)
    $day = date('d');
    if ($day <= 15 && $day <= 7) { $b_slot = 1; $d_day = 30;#30
    } else if ($day <=15 && $day > 7) { $b_slot = 2; $d_day = 15; #15
    } else if ($day <= 30 && $day <= 23) { $b_slot = 2; $d_day = 15; #15
    } else { $b_slot = 1; $d_day = 30; #30
    }

    $m = date('m');

    # get data
    $data = $this->users_bss->general();
    $data['users'] = $this->users_bss->get_users();
    $data['active_users'] = $this->users_bss->get_active_users();
    $data['deactive_users'] = $this->users_bss->get_deactive_users();
    $data['next_debt_users'] = $this->users_bss->get_debt_users($b_slot, $d_day);
    $data['message'] = $this->uri->segment(4);
    $data['msg'] = $msg;


    #mandar a vista
    $this->load->view('subscriptions/index', $data);
  }

}


/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */