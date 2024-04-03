<?php 

$section_title = get_sub_field('section_title');
$section_content = get_sub_field('section_content'); ?>

<section class="cards">
    <?php if($section_title){ echo '<h3>' .$section_title.'</h3>'; } ?>
    <?php if($section_title){ echo '<p>' .$section_title.'</p>'; } ?>



<?php
// check if the nested repeater field has rows of data
if( have_rows('cards') ):
    $count = 0;
    echo '<div class="row">';

    // loop through the rows of data
   while ( have_rows('cards') ) : the_row();

        $above_card_title = get_sub_field('above_card_title');
        $card_title = get_sub_field('card_title');
        $card_content = get_sub_field('card_content');
        $card_image = get_sub_field('card_image');
        $primary_link = get_sub_field('primary_link');
        $modal = get_sub_field('modal');
        $modal_video = get_sub_field('modal_video'); ?>

        <div class="col-sm-12 col-md-4">
            <?php if ($above_card_title) { echo '<h4> '. $above_card_title .' </h4>'; } ?>
            <div class="card">
                <div class="card__container">
                    <?php if ($card_image) { echo '<div class="card__image"> '. $card_image .' </div>'; } ?>
                    <div class="content">
                        <a href="<?php echo $primary_link['url']; ?>">
                            <?php if ($card_title) { echo '<div class="card__header"> '. $card_title .' </div>'; } ?>
                            <?php if ($card_content) { echo '<p> '. $card_content .' </p>'; } ?>
                        </a>
                        <?php if ($modal) { echo '<a href="#card-modal-'.$count.'">Open Modal</a>'; } ?>
                    </div>
                </div> 
                    
            </div>
        </div>
        <?php if ($modal) { ?>
            <div class="modal" id="card-modal-<?php echo $count; ?>">
                <div class="modal-header u-flex u-justify-space-between">
                    <a href="#anchor-to-background" aria-label="Close">
                        <span class="icon">
                            <i class="fa-wrapper fa fa-times"></i>
                        </span>
                    </a>
                </div>
                <?php if ($modal_video) { echo $modal_video; } ?>
            </div>

        <?php }
    $count ++;
    endwhile;

   echo '</div></section>';

endif;
