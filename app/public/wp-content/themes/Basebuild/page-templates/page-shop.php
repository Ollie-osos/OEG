<?php
/**
* Template Name: Shop
*
*/
if(get_field('page_colour')){
    $page_colour = get_field('page_colour');
}else{
    $page_colour = 'pink';
}

get_header(null, array('page_colour' => $page_colour )); ?>

<div class="page">
    <?php get_template_part( 'template-parts/title-section', null, array('archive' => 'none')); ?>
    <?php get_template_part( 'template-parts/builder'); ?>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'pv_', 'gallery' => false  )); ?>
</div>
<?php get_footer();


