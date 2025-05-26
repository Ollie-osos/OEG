<?php 

$end_date = (get_field('end_date') != '') ? DateTime::createFromFormat('Ymd', get_field('end_date'))->format('d M Y') : ''; 
$start_date = (get_field('start_date') != '') ? DateTime::createFromFormat('Ymd', get_field('start_date'))->format('d M Y') : ''; 

$display_date = $start_date.' - '.$end_date;