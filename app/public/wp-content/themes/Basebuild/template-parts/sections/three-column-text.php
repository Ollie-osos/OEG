<?php

$columns = get_sub_field('columns');
$section_title = get_sub_field('section_title');

// check if the nested repeater field has rows of data
if (have_rows('columns')) : ?>

    <section class="three-columns bg-blue section-small">
        <div class="container">
            <div class="row" data-sal="slide-up" data-sal-delay="600" data-sal-easing="ease-out-quart" data-sal-duration="600">
                <div class="col-sm-12">
                    <?php if( $section_title ): 
                        echo '<h2>'.$section_title.'</h2>';
                    endif; ?>
                </div>

                <?php while (have_rows('columns')) : the_row();
                    $top_title = get_sub_field('top_title');
                    $bottom_title = get_sub_field('bottom_title');
                    $add_quote = get_sub_field('add_quote');
                    $text = get_sub_field('text'); ?>
                    <div class="col-sm-12 col-md-4">
                        <?php if( $add_quote ): ?>
                            <div class="quote-mark small"><img src="<?php echo get_template_directory_uri() ?>/dist/img/quote-pink.svg" alt="quote mark"></div>
                        <?php endif; ?>
                        <?php if( $top_title ): ?>
                            <h2><span class="white-text"><?php echo $top_title; ?></span>
                        <?php endif; ?>
                        <?php if( $bottom_title ): ?>
                            <br><span class="pink-text"><?php echo $bottom_title; ?></span></h2>
                        <?php endif; ?>
                        <?php if( $text ): ?>
                            <p><?php echo $text; ?></p>
                        <?php endif; ?>
                        
                    </div>
                <?php endwhile; ?>

            </div>
        </div>
    </section>


<?php endif;
