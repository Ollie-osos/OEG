<?php 

if ($args['type']) {
	$type = $args['type'];
} 
$carousel = get_field($type.'carousel');

?>

<section class="carousel">
    <div class="container">
        <div class="row">

            <?php if (have_rows($type.'carousel')) : ?>
                
                <?php // loop through the rows of data
                while (have_rows($type.'carousel')) : the_row();
                    $post = get_sub_field('post_carousel');
                    if ($post) :
                        setup_postdata($post); 
                        $labels = array_column(get_field('event_type'), 'label');
                        $implodeLabels = implode(', ', $labels); 
                        $end_date = DateTime::createFromFormat('Ymd', get_field('end_date'))->format('d M Y'); ?>
                        <div class="col-sm-6 col-md-6 card-spacer ">
                            <div class="card h-100 u-flex u-flex-column">
                                <div class="card__container">
                                    <div class="card__image" style="background-image: url('<?php echo get_the_post_thumbnail_url(); ?>')"> </div>
                                </div>
                                <div class="card__mobile-title">
                                    <div class="content">
                                        <a href="<?php the_permalink(); ?>">
                                            <h3><?php the_title(); ?></h3>
                                            <h3><?php echo $end_date; ?></h3>
                                            <h3><?php echo $implodeLabels; ?></h3>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php wp_reset_postdata(); ?>
                    <?php endif; ?>
                <?php endwhile; ?>


            <?php endif; ?>
        </div>
    </div>
</section>