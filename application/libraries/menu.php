<?php

class Menu{
 	function show_menu(){
  		$obj =& get_instance();
  		$obj->load->helper('url');
  		$menu  = "<ul id='nav'>";
      $menu .= "<li>";
      $menu .= anchor("welcome","Subscripciones");
      $menu .= "</li>";
  		$menu .= "<li>";
  		$menu .= anchor("users","Socios");
  		$menu .= "</li>";
  		$menu .= "<li>";		
  		$menu .= anchor("packages/","Promociones");		
  		$menu .= "</li>";		
      $menu .= "<li>";    
      $menu .= anchor("control/","Control Entrada");   
      $menu .= "</li>";         
  		$menu .= "</ul>";
		
  		return $menu;
 	}
}
?>