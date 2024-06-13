<?php
/**
 * The template for displaying pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages and that
 * other "pages" on your WordPress site will use a different template.
 *
*/

get_header(); ?>

<div class="page">
<?php get_template_part( 'template-parts/title-section'); ?>
</div>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <?php the_content(); ?>
                </div>
            </div>
        </div>
    </section>
    <?php get_template_part( 'template-parts/mailing-list'); ?>
</div>
<?php get_footer();


