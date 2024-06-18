<?php
$args = array(
    'posts_per_page' => 4,
);
$the_query = new WP_Query($args);

if ( $the_query->have_posts() ) : ?>
    <section class="events">
        <div class="container border-bottom">
            <div class="row" id="posts-list"> <!-- Post data will be displayed here --> 
                <?php while ( $the_query->have_posts() ) : $the_query->the_post(); ?>
                    <div class="post col-sm-12 col-md-6">
                        <a href="<?php the_permalink(); ?>">
                            <div class="background-image" style="background-image: url('<?php echo get_the_post_thumbnail_url(); ?>')"> </div>
                            <div class="text pt-2"> 
                                <h3 class="black-text"><?php the_title(); ?></h3>
                                <?php echo '<h3 class="black-text">'. get_field('subtitle').'</h3>'; ?>
                            </div>
                        </a>
                    </div>
                <?php endwhile; ?>
                <button id="load-more">Load More</button>
                <script>
                    var current_page = 1;
                </script>
            </div>
        </div>
    </section>
<?php endif; wp_reset_postdata(); // End have_posts() check. ?>