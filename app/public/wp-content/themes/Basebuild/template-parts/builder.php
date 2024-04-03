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
            include 'sections/main-hero';

        elseif( get_row_layout() == 'promo_hero' ): 
            // $foreground_image = get_sub_field('foreground_image');
            // $title = get_sub_field('title');
            // $content = get_sub_field('content');
            // $cta = get_sub_field('cta');
            include 'sections/promo-hero';

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
            include 'sections/cta';
    
        elseif( get_row_layout() == 'fullscreen_carousel' ): 
            // $images = get_sub_field('images');
            include 'sections/fullscreen-carousel';

        elseif( get_row_layout() == 'cards_section' ): 
            // $section_title = get_sub_field('section_title');
            // $section_content = get_sub_field('section_content');
            // $cards = get_sub_field('cards');
            include 'sections/cards';

        elseif( get_row_layout() == 'join_our_community' ): 
            // $title = get_sub_field('title');
            // $content = get_sub_field('content');
            include 'sections/join-our-community';

        elseif( get_row_layout() == 'large_text' ): 
            // $large_text = get_sub_field('large_text');
            include 'sections/large-text';

        elseif( get_row_layout() == 'hero_video' ): 
            // $video = get_sub_field('video');
            include 'sections/hero-video';

        elseif( get_row_layout() == 'marquee' ): 
            // $section_title = get_sub_field('section_title');
            // $images = get_sub_field('images');
            include 'sections/marquee';

        elseif( get_row_layout() == 'apply_for_coaching' ): 
            // $apply_for_coaching = get_sub_field('apply_for_coaching');
            include 'sections/apply-for-coaching.php';

        elseif( get_row_layout() == 'full_hero_image' ): 
            // $image = get_sub_field('image');
            // $large_text = get_sub_field('large_text');
            include 'sections/full-hero-image';

        elseif( get_row_layout() == 'three_column_text' ): 
            // $columns = get_sub_field('columns');
            include 'sections/three-column-text';

        elseif( get_row_layout() == 'title_lips' ): 
            // $title = get_sub_field('title');
            include 'sections/title-lips';

        elseif( get_row_layout() == 'image_offset' ): 
            // $image = get_sub_field('image');
            // $text = get_sub_field('text');
            // $sub_text = get_sub_field('sub_text');
            // $background_colour = get_sub_field('background_colour');
            include 'sections/image-offset';

        elseif( get_row_layout() == 'image_offset_buy' ): 
            // $image = get_sub_field('image');
            // $behind_image_background_colour = get_sub_field('behind_image_background_colour');
            // $content_placement = get_sub_field('content_placement');
            // $text = get_sub_field('text');
            // $background_colour = get_sub_field('background_colour');
            // $sub_text = get_sub_field('sub_text');
            // $price = get_sub_field('price');
            // $buy_now_link = get_sub_field('buy_now_link');
            include 'sections/image-offset-buy';

        elseif( get_row_layout() == 'podcast_hero' ): 
            // $background_colour = get_sub_field('background_colour');
            // $image = get_sub_field('image');
            // $text = get_sub_field('text');
            include 'sections/podcast-hero';

        elseif( get_row_layout() == 'ceris_message' ): 
            // $background_colour = get_sub_field('background_colour');
            // $image_1 = get_sub_field('image_1');
            // $image_2 = get_sub_field('image_2');
            // $text = get_sub_field('text');
            include 'sections/ceris-message';

        elseif( get_row_layout() == 'contact_lips' ): 
            // $background_colour = get_sub_field('background_colour');
            // $form_embed = get_sub_field('form_embed');
            // $text = get_sub_field('text');
            // $add_lips = get_sub_field('add_lips');
            
            include 'sections/contact-lips';


        endif;

    // End loop.
    endwhile;

// No value.
else :
    // Do something...
endif;