<?php
/**
* Template Name: Page Builder
*
*/
if(get_field('page_colour')){
    $page_colour = get_field('page_colour');
}else{
    $page_colour = 'pink';
}

get_header(null, array('page_colour' => $page_colour )); ?>

<div class="page">
    <?php get_template_part( 'template-parts/builder'); ?>
</div>
<?php get_footer();


