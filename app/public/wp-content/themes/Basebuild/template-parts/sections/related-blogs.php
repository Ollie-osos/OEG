<?php if( have_rows('related_blogs') ): ?>
    <section class="cards section-small bg-blue">
        <h2 class="u-text-center">Related Blogs</h2>
        
        <div class="container">
            <div class="row">

                <?php while ( have_rows('related_blogs') ) : the_row();

                    $post_object = get_sub_field('blog_post'); ?>
                    <?php if( $post_object ): ?>
                        <?php // override $post
                        $post = $post_object;
                        setup_postdata( $post ); 
                        $card_title = get_the_title();
                        $card_subtitle = get_field('card_subtitle');
                        $card_image = get_the_post_thumbnail_url();
                        $primary_link = get_the_permalink();
                        ?>

                        <div class="col-sm-12 col-md-4">
                            <div class="card h-100 u-flex u-flex-column">
                                <div class="card__container">
                                    <a href="<?php echo $primary_link; ?>">
                                        <?php if ($card_image) { echo '<div class="card__image" style="background-image: url('. $card_image .')"/> </div>'; } ?>
                                    </a>
                                </div>
                                
                                <div class="card__mobile-title">
                                    <div class="content">
                                        <?php if ($primary_link) { ?> <a href="<?php echo $primary_link; ?>">
                                            <?php if ($card_title) { echo '<div class="card__header"> '. $card_title .' </div>'; } ?>
                                            <?php if ($card_subtitle) { echo '<p> '. $card_subtitle .' </p>'; } ?>
                                        </a> <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php wp_reset_postdata(); // IMPORTANT - reset the $post object so the rest of the page works correctly ?>
                    <?php endif; ?>
                <?php endwhile; ?>
            </div>
        </div>
    
    </section>
<?php endif; ?>
