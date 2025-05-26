<?php

$section_title = get_sub_field('section_title');

?>

<section class="cards">
    <div class="container">
        <div class="row">
            <?php if ($section_title) { ?>
                <div class="col-sm-12 pb-2">
                    <h2><?php echo $section_title;?> </h2>
                </div>
            <?php } ?>
            
            <?php 
            while (have_rows('cards')) : the_row();

                $card_title = get_sub_field('card_title');
                $card_image = get_sub_field('card_image');
                $primary_link = get_sub_field('primary_link'); ?>

                <div class="post col-sm-12 col-md-6">
                    <a href="<?php echo $primary_link ?>">
                        <div class="background-image" style="background-image: url('<?php echo $card_image['sizes']['medium'] ?>')"> </div>
                        <div class="text pt-2"> 
                            <h3 class="black-text"><?php echo $card_title ?></h3>
                        </div>
                    </a>
                </div>
            <?php
            endwhile;
            wp_reset_postdata(); // Restore global post data
            ?>
        </div>
    </div>
</section>

