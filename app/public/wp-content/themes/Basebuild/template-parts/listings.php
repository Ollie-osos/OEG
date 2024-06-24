<?php if ( have_posts() ) : ?>
    <section class="events">
        <div class="container border-bottom">
            <div class="row" id="posts-list"> <!-- Post data will be displayed here --> 
                <?php while ( have_posts() ) : the_post(); ?>
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
            </div>
        </div>
    </section>
<?php endif; // End have_posts() check. ?>