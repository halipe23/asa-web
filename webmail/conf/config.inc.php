<?php
$config['imap_host'] = 'tls://email:143';
$config['smtp_server'] = 'localhost';
$config['smtp_port'] = 25; 
$config['smtp_auth_type'] = 'PLAIN'; 
$config['smtp_user'] = '%u'; 
$config['smtp_pass'] = '%p';
$config['mail_domain'] = 'miami.asa.br';
$config['imap_conn_options'] = [
  'ssl' => [
    'verify_peer' => false,
    'verify_peer_name' => false,
    'allow_self_signed' => true
  ]
];
$config['smtp_conn_options'] = [
  'ssl' => [
    'verify_peer' => false,
    'verify_peer_name' => false,
    'allow_self_signed' => true
  ]
];