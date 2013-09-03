<?php

class Control_bss extends CI_Model {



  function Control() {
    // Call the Model constructor
    parent::Packages();
    $this->load->helper('url');
    $this->load->database();
  }
}