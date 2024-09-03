<?php
// get_template_part( 'hero-full-colour', null, array('colour' => 'bg-dark-green'));

// Check value exists.
if( have_rows('page_builder') ):
    // Loop through rows.
    while ( have_rows('page_builder') ) : the_row();

        if( get_row_layout() == 'main_hero' ):
            // $foreground_image = get_sub_field('foreground_image');
            // $background_image = get_sub_field('background_image');
            // $background_video = get_sub_field('background_video');
            // $foreground_text = get_sub_field('foreground_text');
            include 'sections/main-hero.php';

        elseif( get_row_layout() == 'promo_hero' ): 
            // $foreground_image = get_sub_field('foreground_image');
            // $title = get_sub_field('title');
            // $content = get_sub_field('content');
            // $cta = get_sub_field('cta');
            include 'sections/promo-hero.php';

        elseif( get_row_layout() == 'call_to_action' ): 
            // $image_text = get_sub_field('image_text');
            // $foreground_image = get_sub_field('foreground_image');
            // $foreground_text = get_sub_field('foreground_text');
            // $colour_backdrop = get_sub_field('colour_backdrop');
            // $behind_image_background_colour = get_sub_field('behind_image_background_colour');
            // $offset_title_text = get_sub_field('offset_title_text');
            // $content_text = get_sub_field('content_text');
            // $content_placement = get_sub_field('content_placement');
            // $cta_button = get_sub_field('cta_button');
            // $background_colour = get_sub_field('background_colour');
            include 'sections/cta.php';
    
        elseif( get_row_layout() == 'fullscreen_carousel' ): 
            // $images = get_sub_field('images');
            include 'sections/fullscreen-carousel.php';

        elseif( get_row_layout() == 'cards_section' ): 
            // $section_title = get_sub_field('section_title');
            // $section_content = get_sub_field('section_content');
            // $cards = get_sub_field('cards');
            include 'sections/cards.php';

        elseif( get_row_layout() == 'large_text' ): 
            // $large_text = get_sub_field('large_text');
            include 'sections/large-text.php';

        elseif( get_row_layout() == 'hero_video' ): 
            // $video = get_sub_field('video');
            include 'sections/hero-video.php';

        elseif( get_row_layout() == 'full_hero_image' ): 
            // $image = get_sub_field('image');
            // $large_text = get_sub_field('large_text');
            include 'sections/full-hero-image.php';

        elseif( get_row_layout() == 'three_column_text' ): 
            // $columns = get_sub_field('columns');
            include 'sections/three-column-text.php';

        endif;

    // End loop.
    endwhile;

// No value.
else :
    // Do something...
endif;