<?php
/**
* Template Name: Homepage
*
*/

get_header(); ?>

<div class="page">
    <?php get_template_part( 'template-parts/featured-event'); ?>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h2><?php echo get_field('tagline'); ?></h2>
                </div>
            </div>
        </div>
    </section>
    <?php get_template_part( 'template-parts/carousel', null, array('type' => 'event_' )); ?>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'en_' )); ?>
    <?php get_template_part( 'template-parts/carousel', null, array('type' => 'news_' )); ?>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'ed_' )); ?>

</div>
<?php get_footer();


