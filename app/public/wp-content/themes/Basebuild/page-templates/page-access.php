<?php
/**
* Template Name: Access
*
*/
get_header(); ?>

<div class="page">
<?php get_template_part( 'template-parts/title-section'); ?>
<section class="section border-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 double-column">
                    <?php the_content(); ?>
                </div>
            </div>
        </div>
    </section>
<section class="section border-bottom">
    <div class="container">
        <div class="row">
            <?php if (have_rows('access_options')) : 
                while (have_rows('access_options')) : the_row(); 
                    $access_icon = get_sub_field('access_icon'); 
                    $access_text = get_sub_field('access_text'); ?>
                    <div class="access_options col-md-6 col-sm-12 u-flex" >
                        <div class="img"><img src="<?php echo $access_icon; ?>" alt="access icon"></div>
                        <div class="text"><?php echo $access_text; ?></div>
                    </div>
                <?php endwhile;
            endif; ?>
        </div>
    </div>
</section>

<?php get_template_part( 'template-parts/additional-links', null, array('type' => 'pv_' )); ?>
<?php get_template_part( 'template-parts/divide'); ?>
<?php get_template_part( 'template-parts/mailing-list'); ?>

</div>
<?php get_footer();


