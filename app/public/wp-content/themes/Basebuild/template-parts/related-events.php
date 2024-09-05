<?php if (have_rows('related_events')) : ?>
    <!-- <section class="border-bottom show-mobile no-space">
        <div class="container">&nbsp;</div>
    </section> -->
    <section class="related-events events">
        <div class="container">
            <div class="row">
                <div class="col-sm-12"><h2><?php echo get_field('related_events_title'); ?></h2></div>
                    
                <?php // loop through the rows of data
                while (have_rows('related_events')) : the_row();
                    $post = get_sub_field('related_event');
                    if ($post) :
                        setup_postdata($post); 
                        $labels = array_column(get_field('event_type'), 'label');
                        $implodeLabels = implode(', ', $labels); 
                        $end_date = DateTime::createFromFormat('Ymd', get_field('end_date'))->format('d M Y'); ?>
                        <div class="col-sm-6 col-md-6">
                            <div>
                                <a href="<?php the_permalink(); ?>">
                                    <div class="background-image" style="background-image: url('<?php echo get_the_post_thumbnail_url(); ?>')"> </div>
                                    <div class="text pt-2">
                                        
                                            <h3 class="black-text"><?php the_title(); ?></h3>
                                            <?php echo '<h3 class="red-text">'.$end_date.'</h3><h3 class="blue-text">'.$implodeLabels.'</h3>'; ?>
                                        
                                    </div>
                                </a>
                            </div>
                        </div>
                        <?php wp_reset_postdata(); ?>
                    <?php endif; ?>
                <?php endwhile; ?> 
            </div>
        </div>
    </section>
<?php endif; ?>