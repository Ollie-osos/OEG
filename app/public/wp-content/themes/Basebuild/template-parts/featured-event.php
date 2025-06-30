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
                $locationLabel = (get_field('event_location')['label'] != '') ? get_field('event_location')['label'] : '';
                $end_date = DateTime::createFromFormat('Ymd', get_field('end_date'))->format('d M Y'); ?>
                <div class="col-sm-12 col-md-6 u-flex-column u-flex u-justify-space-between">
                    <a href="<?php the_permalink(); ?>"><h1 class="black-text"><?php the_title(); ?></h1></a>
                        <div class="align-baseline">
                            <h3><a class="red-text" href="<?php the_permalink(); ?>"><?php echo $end_date; ?></a></h3>
                            <h3><a class="green-text" href="<?php the_permalink(); ?>"><?php echo $locationLabel; ?></a></h3>
                            <h3><a class="blue-text" href="<?php the_permalink(); ?>"><?php echo $implodeLabels; ?></a></h3>
                        </div>
                    
                </div>
                <div class="col-sm-12 col-md-6">
                    <a href="<?php the_permalink(); ?>"><img src="<?php echo get_the_post_thumbnail_url(); ?>" alt="featured event image"></a>
                </div>
                <?php wp_reset_postdata(); ?>
            <?php endif; ?>
        </div>
    </div>
</section>