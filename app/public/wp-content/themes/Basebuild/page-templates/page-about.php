<?php
/**
* Template Name: About
*
*/

$double_column = get_field('double_column');

get_header(); ?>

<div class="page">
    <?php get_template_part( 'template-parts/title-section', null, array('archive' => 'none')); ?>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 double-column"><?php the_content(); ?> </div>
            </div>
        </div>
    </section>
    <?php get_template_part( 'template-parts/mailing-list'); ?>
</div>
<?php get_footer();


