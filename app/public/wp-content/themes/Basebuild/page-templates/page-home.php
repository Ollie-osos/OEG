<?php
/**
* Template Name: Homepage
*
*/

get_header(); ?>

<div class="page">
<?php // get_template_part( 'template-parts/content', get_post_type() ); ?>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <?php the_content(); ?>
                </div>
            </div>
        </div>
    </section>
</div>
<?php get_footer();


