<?php

$section_title = get_sub_field('section_title');
$section_content = get_sub_field('section_content');
$background_colour = get_sub_field('background_colour');
$cols = count(get_sub_field('cards')) === 2 ? 'col-md-6' : 'col-md-4';
$section_content_bottom = get_field('section_content_bottom');
$card_style = get_sub_field('card_style');

if ($card_style == 'hover') {
    $card_class = 'card--slide-up';
    $row_class = '';
} elseif ($card_style == 'staggered') {
    $card_class = '';
    $row_class = 'staggered';
} else {
    $card_class = '';
    $row_class = '';
}
// echo $cols = count(get_sub_field('cards'));

$sal = 'data-sal="fade" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"';
?>

<section class="cards section-small bg-<?php echo $background_colour; ?>">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <?php if ($section_title) {
                    echo '<h2 class="u-text-center">' . $section_title . '</h2>';
                } ?>
                <?php if ($section_content) {
                    echo '<p>' . $section_content . '</p>';
                } ?>
            </div>
        </div>
    </div>

    <?php
    // check if the nested repeater field has rows of data
    if (have_rows('cards')) :
        $count = 0;

        echo '<div class="container"><div class="row ' . $row_class . '">';

        while (have_rows('cards')) : the_row();
            $above_card_title = get_sub_field('above_card_title');
            if ($above_card_title) { ?>
                <div class="col-sm-12 <?php echo $cols; ?>" <?php echo $sal; ?>>
                    <?php echo '<div class="title-above"><h2 data-sal="slide-up" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"> ' . $above_card_title . ' </h2></div>'; ?>
                </div>
            <?php }
        endwhile;

        // loop through the rows of data
        while (have_rows('cards')) : the_row();


            $card_title = get_sub_field('card_title');
            $card_subtitle = get_sub_field('card_subtitle');
            $card_content = get_sub_field('card_content');
            $card_image = get_sub_field('card_image');
            $primary_link = get_sub_field('primary_link');
            $modal = get_sub_field('modal');
            $modal_video = get_sub_field('modal_video'); ?>

            <div class="card-spacer col-sm-12 <?php echo $cols; ?>" <?php echo $sal; ?>>
                <?php // if ($above_card_title) { echo '<div class="title-above"><h2 data-sal="slide-up" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"> '. $above_card_title .' </h2></div>'; } 
                ?>
                <div class="card <?php echo $card_class; ?> h-100 u-flex u-flex-column" <?php echo $sal; ?>>
                    <div class="card__container">
                        <?php if (get_sub_field('primary_link')) { ?>
                            <a href="<?php echo $primary_link['url']; ?>" target="<?php echo $primary_link['target']; ?>" aria-label="Card image">
                                <?php if ($card_image) {
                                    echo '<div class="card__image" style="background-image: url(' . $card_image['sizes']['medium'] . ')"/> </div>';
                                } ?>
                            </a>
                        <?php } else { ?>

                            <?php if ($card_image) {
                                echo '<div class="card__image" style="background-image: url(' . $card_image['sizes']['medium'] . ')"/> </div>';
                            } ?>

                        <?php } ?>
                    </div>
                    <?php if ($modal) {
                        echo '<a href="#card-modal-' . $count . '" class="play blue" aria-label="Open Modal"><div> &nbsp;</div></a>';
                        get_template_part('template-parts/sections/modal', null, array('id' => 'card-modal-' . $count, 'video' => $modal_video));
                    } else { ?>
                        <div class="card__mobile-title">
                            <div class="content">
                                <?php if (get_sub_field('primary_link')) { ?>
                                    <a href="<?php echo $primary_link['url']; ?>" target="<?php echo $primary_link['target']; ?>">
                                        <?php if ($card_title) {
                                            echo '<div class="card__header"> ' . $card_title . ' </div>';
                                        } ?>
                                        <?php if ($card_subtitle) {
                                            echo '<p> ' . $card_subtitle . ' </p>';
                                        } ?>
                                    </a>
                                <?php } else { ?>
                                    <?php if ($card_title) {
                                        echo '<div class="card__header"> ' . $card_title . ' </div>';
                                    } ?>
                                    <?php if ($card_subtitle) {
                                        echo '<p> ' . $card_subtitle . ' </p>';
                                    } ?>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="card__body content">
                            <?php if (get_sub_field('primary_link')) { ?>
                                <a href="<?php echo $primary_link['url']; ?>" target="<?php echo $primary_link['target']; ?>">
                                    <?php if ($card_content) {
                                        echo '<p> ' . $card_content . ' </p>';
                                    } ?>
                                </a>
                            <?php } else { ?>
                                <!-- <a> -->
                                    <?php if ($card_content) {
                                        echo '<p> ' . $card_content . ' </p>';
                                    } ?>
                                <!-- </a> -->
                            <?php } ?>
                        </div>

                    <?php } ?>
                </div>
                <?php if (have_rows('secondary_links')) :
                    while (have_rows('secondary_links')) : the_row();
                        if (get_sub_field('secondary_link')) {
                            $secondary_link = get_sub_field('secondary_link'); ?>
                            <div class="secondary-link"><a href="<?php echo $secondary_link['url']; ?>" <?php echo $secondary_link['target']; ?>><?php echo $secondary_link['title']; ?> </a></div>
                    <?php }
                    endwhile; ?>
                <?php endif; ?>
            </div>
            <?php
            if ($modal) {
                get_template_part('../template-parts/blocks/modal', null, array('id' => 'card-modal-' . $count, 'video' => $modal_video));
            }
            $count++;
        endwhile;

        echo '</div>';

        if ($section_content_bottom) { ?>
            <div class="row u-justify-center">
                <div class="col-sm-12 col-md-8 u-text-center large">
                    <div><?php echo $section_content_bottom; ?></div>
                </div>
            </div>
        <?php } ?>
        </div>
</section>

<?php endif;
