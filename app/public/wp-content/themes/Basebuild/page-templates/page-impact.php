<?php
/**
* Template Name: IMPACT
*
*/

$link_type = get_field('link_type');

get_header(); ?>

<div class="page">
    <?php get_template_part( 'template-parts/title-section', null, array('archive' => 'none')); ?>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 pb-3">
                    <div class="hero_image">
                        <img src="https://openeye.org.uk/wp-content/uploads/2025/05/big-IMPACT-REPORT-GRAPHICBLUE.jpg" alt="Hero image">
                    </div>
                </div>
                <div class="col-sm-12 double-column"><?php the_content(); ?> </div>
            </div>
        </div>
    </section>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => $link_type, 'gallery' => false  )); ?>
    <?php get_template_part( 'template-parts/mailing-list'); ?>
</div>
<?php get_footer();
