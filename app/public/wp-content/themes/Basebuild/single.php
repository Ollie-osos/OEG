<?php 
// $additional_links = get_field('additional_links');

get_header(); ?>

<div class="page">
    <?php get_template_part( 'template-parts/title-section', null, array('archive' => 'none')); ?>
    <?php get_template_part('template-parts/content-page'); ?>
    <?php get_template_part( 'template-parts/divide'); ?>
    <?php // get_template_part( 'template-parts/additional-links', null, array('type' => $additional_links, 'gallery' => false  )); ?>
    <?php get_template_part( 'template-parts/mailing-list'); ?>
</div>
<?php get_footer();