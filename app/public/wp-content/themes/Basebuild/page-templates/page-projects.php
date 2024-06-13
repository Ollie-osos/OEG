<?php
/**
* Template Name: Projects
*
*/

get_header(); ?>

<div class="page">
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h1><?php the_title(); ?></h1>
                    <?php the_content(); ?> 
                </div>
                <div class="col-sm-12 col-md-6">
                    <?php
                    if( have_rows('links') ): ?>
                        <?php while( have_rows('links') ) : the_row();
                            $link = get_sub_field('link'); ?>
                            <a class="btn btn-full" href="<?php echo $link['url']; ?>"><?php echo $link['title']; ?></a>
                        <?php endwhile; ?>
                    <?php else :
                        // Do something...
                    endif; ?>
                </div>
            </div>
        </div>
    </section>
</div>
<?php get_template_part( 'template-parts/gallery'); ?>
<?php get_template_part( 'template-parts/mailing-list'); ?>
<?php get_footer();


