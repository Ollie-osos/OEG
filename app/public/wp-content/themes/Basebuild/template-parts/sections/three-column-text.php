<?php 

$columns = get_sub_field('columns');

// check if the nested repeater field has rows of data
if( have_rows('columns') ):

    echo '<ul>';

    // loop through the rows of data
   while ( have_rows('cards') ) : the_row();

       $title = get_sub_field('title');
       $text = get_sub_field('text');
       
   endwhile;

   echo '</ul>';

endif;
