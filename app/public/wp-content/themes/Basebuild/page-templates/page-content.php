<?php
/**
* Template Name: Content page 
*
*/

$layout = get_field('layout');
$gallery = get_field('image_gallery');
$additional_links = get_field('additional_links');

get_header(); ?>

<div class="page">
    <?php get_template_part( 'template-parts/title-section'); ?>
    <section>
        <div class="container">
            <div class="row">
                <?php if ($layout == 'hero') { ?>
                    <div class="col-sm-12 pb-3">
                        <?php if (get_field('hero_video')) { ?>
                            <div class="videoWrapper">
                                <?php echo get_field('hero_video') ; ?>
                                <br>
                                
                            </div>
                        <?php }else{ ?>
                            <div class="hero_image">
                                <img src="<?php echo get_the_post_thumbnail_url();?>" alt="Hero image">
                            </div>
                        <?php } ?>
                    </div>
                    <div class="col-sm-12 double-column"><?php the_content(); ?></div>
                <?php }else{ ?>
                    <div class="col-sm-12 col-md-6">
                        <?php if ($gallery) { ?>
                            <?php foreach ($gallery as $image) : ?>
                                <img src="<?php echo esc_url($image['sizes']['large']); ?>" alt="<?php echo esc_attr($image['alt']); ?>" />
                                <br>
                            <?php endforeach; ?>
                        <?php }else{ ?>
                            <div class="image">
                                <img src="<?php echo get_the_post_thumbnail_url();?>" alt="Hero image">
                            </div>
                        <?php } ?>
                    </div>
                    <div class="col-sm-12 col-md-6"><?php the_content(); ?></div>
                <?php } ?>
                
            </div>
        </div>
    </section>
    <?php get_template_part( 'template-parts/divide'); ?>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => $additional_links, 'gallery' => false  )); ?>
    <?php get_template_part( 'template-parts/mailing-list'); ?>
</div>
<?php get_footer();


