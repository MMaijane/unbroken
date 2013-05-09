<?php

class Menu{
 	function show_menu(){
  		$obj =& get_instance();
  		$obj->load->helper('url');
  		$menu  = "<ul>";
  		$menu .= "<li>";
  		$menu .= anchor("users","Clientes");
  		$menu .= "</li>";
  		$menu .= "<li>";		
  		$menu .= anchor("/","Promociones");		
  		$menu .= "</li>";		
  		$menu .= "</ul>";
		
  		return $menu;
 	}
}
?>