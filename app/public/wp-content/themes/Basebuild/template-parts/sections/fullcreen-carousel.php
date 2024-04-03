<?php 

$images = get_sub_field('images');

echo '<li><img src="' . $image['url'] . '" alt="' . $image['alt'] . '" /></li>';