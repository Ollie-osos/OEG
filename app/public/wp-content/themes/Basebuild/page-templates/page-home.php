<?php
/**
* Template Name: Homepage
*
*/

get_header(); ?>

<div class="page">
    <?php get_template_part( 'template-parts/featured-event'); ?>
    <section class="section border-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <p class="large"><?php echo get_field('tagline'); ?></p>
                </div>
            </div>
        </div>
    </section>
    <?php get_template_part( 'template-parts/carousel', null, array('type' => 'event_' )); ?>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'en_' )); ?>
    <?php get_template_part( 'template-parts/carousel', null, array('type' => 'news_' )); ?>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'ed_' )); ?>
    <?php get_template_part( 'template-parts/mailing-list'); ?>

</div>
<?php get_footer();


