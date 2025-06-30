<?php
// get_template_part( 'hero-full-colour', null, array('colour' => 'bg-dark-green'));

// Check value exists.
if( have_rows('page_builder') ):
    // Loop through rows.
    while ( have_rows('page_builder') ) : the_row();

        if( get_row_layout() == 'main_hero' ):
            include 'sections/main-hero.php';
    
        elseif( get_row_layout() == 'fullscreen_carousel' ): 
            include 'sections/gallery-builder.php';

        elseif( get_row_layout() == 'cards_section' ): 
            include 'sections/cards.php';

        elseif( get_row_layout() == 'text' ): 
            include 'sections/text.php';

        elseif( get_row_layout() == 'hero_video' ): 
            include 'sections/hero-video.php';

        endif;

    // End loop.
    endwhile;

// No value.
else :
    // Do something...
endif;