<?php
/**
* Template Name: SEP
*
*/

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
    <section class="mailing-list no-space">
        <div class="container bg-blue">
            <div class="row white-text">
                <div class="col-sm-12 col-md-10">
                    <h2>Explore our socially engaged photography projects</h2>
                    <p>Bringing different voices, photographers and communities together</p>
                </div>
                <div class="col-sm-12 col-md-2 mailing-list-btn">
                    <a href="/sep_projects" class="btn btn-white">Explore</a>
                </div>
            </div>
        </div>
    </section>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'ab_', 'gallery' => false )); ?>
</div>
<?php get_footer();


