<?php 
	
	exec("systemctl stop nginx");
	exec("systemctl start nginx");
	exec("systemctl restart php7.0-fpm");

 ?>
