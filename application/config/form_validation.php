<?php
$config = array(
                 'subscribe' => array(
                                    array(
                                            'field' => 'vc_username',
                                            'label' => 'Nombre',
                                            'rules' => 'required'
                                         ),
                                    array(
                                            'field' => 'vc_lastname',
                                            'label' => 'Apellido',
                                            'rules' => 'required'
                                         ),
                                    array(
                                            'field' => 'vc_folio',
                                            'label' => 'Folio',
                                            'rules' => 'required'
                                         )
                                    ),
                 'packages' => array(
                                    array(
                                            'field' => 'vc_package_name',
                                            'label' => 'Nombre',
                                            'rules' => 'required'
                                         ),
                                    array(
                                            'field' => 'vc_description',
                                            'label' => 'Descripcion',
                                            'rules' => 'required'
                                         ),
                                    array(
                                            'field' => 'i_months',
                                            'label' => 'Meses',
                                            'rules' => 'required'
                                         ),
                                    array(
                                            'field' => 'i_price',
                                            'label' => 'Precio',
                                            'rules' => 'required'
                                         )
                                    ),
                  'renew' => array(
                                    array(
                                            'field' => 'vc_folio',
                                            'label' => 'Folio',
                                            'rules' => 'required'
                                        )
                                  )                                                         
               );
?>