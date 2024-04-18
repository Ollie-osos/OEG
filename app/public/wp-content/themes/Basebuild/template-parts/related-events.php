

<section class="additional-links">
    <h2><?php echo get_field('related_events_title');?></h2>

    <?php if (have_rows('related_events')) : ?>
        <div class="container">
            <div class="row">
                <?php // loop through the rows of data
                while (have_rows('related_events')) : the_row();

                    $post = get_field('related_event');
                    
                    if( $post ): 
                        setup_postdata($post);?>
                        <div class="col-sm-12 col-md-6 card-spacer ">
                            <div class="card h-100 u-flex u-flex-column">
                                <div class="card__container">
                                    <div class="card__image" style="background-image: url('<?php get_the_post_thumbnail_url();?>')"> </div>
                                </div>
                                <div class="card__mobile-title">
                                    <div class="content">
                                        <a href="<?php the_permalink(); ?>">
                                            <h3><?php the_title(); ?></h3>
                                            <h3><?php echo get_field('end_date');?></h3>
                                            <?php if( get_field('event_type') ): ?>
                                                <h3><?php echo implode( ', ', get_field('event_type') ); ?></h3>
                                            <?php endif; ?> ?>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php wp_reset_postdata(); ?>
                    <?php endif; ?>
              <?php  endwhile; ?>
            </div>
        </div>

    <?php endif; ?>
</section>