<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

$active_group	= 'default';
$query_builder	= TRUE;

$db['default']	= array(
	'dsn'		=> '',
    'hostname'	=> '120.76.200.232',
    'username'	=> 'feibukeji',
    'password'	=> 'bgyrtksithv,1*&($AC',
    'port'		=> '16822',
	'database'	=> 'hnplants',
	'dbdriver'	=> 'mysqli',
	'dbprefix'	=> 'fn_',
	'pconnect'	=> FALSE,
	'db_debug'	=> true,
	'cache_on'	=> FALSE,
	'cachedir'	=> 'cache/sql/',
	'char_set'	=> 'utf8',
	'dbcollat'	=> 'utf8_general_ci',
	'swap_pre'	=> '',
	'autoinit'	=> FALSE,
	'encrypt'	=> FALSE,
	'compress'	=> FALSE,
	'stricton'	=> FALSE,
	'failover'	=> array(),
);
