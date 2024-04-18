<?php 
$post = get_field('featured_event');
?>

<section class="featured-event">
    <div class="container">
        <div class="row">
            <?php if ($post) :
                setup_postdata($post); 
                $labels = array_column(get_field('event_type'), 'label');
                $implodeLabels = implode(', ', $labels); 
                $end_date = DateTime::createFromFormat('Ymd', get_field('end_date'))->format('d M Y'); ?>
                <div class="col-sm-12 col-md-6">
                    <h1><?php the_title(); ?></h1>
                    <h3><?php echo $end_date; ?></h3>
                    <h3><?php echo $implodeLabels; ?></h3>
                </div>
                <div class="col-sm-12 col-md-6">
                    <img src="<?php echo get_the_post_thumbnail_url(); ?>" alt="featured event image">
                </div>
                <?php wp_reset_postdata(); ?>
            <?php endif; ?>
        </div>
    </div>
</section>