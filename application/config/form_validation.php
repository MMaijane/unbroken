<?php
$config = array(
                 'subscribe' => array(
                                    array(
                                            'field' => 'vc_username',
                                            'label' => 'Username',
                                            'rules' => 'required'
                                         ),
                                    array(
                                            'field' => 'vc_lastname',
                                            'label' => 'Lastname',
                                            'rules' => 'required'
                                         )
                                    ),
                 'packages' => array(
                                    array(
                                            'field' => 'vc_package_name',
                                            'label' => 'Name',
                                            'rules' => 'required'
                                         ),
                                    array(
                                            'field' => 'vc_description',
                                            'label' => 'Description',
                                            'rules' => 'required'
                                         ),
                                    array(
                                            'field' => 'i_months',
                                            'label' => 'Months',
                                            'rules' => 'required'
                                         ),
                                    array(
                                            'field' => 'i_price',
                                            'label' => 'Price',
                                            'rules' => 'required'
                                         )
                                    )                          
               );
?>