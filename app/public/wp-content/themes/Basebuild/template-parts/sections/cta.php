<?php

// if (get_sub_field('colour_backdrop')) {
//     $shadow = "shadow__".get_sub_field('behind_image_background_colour'); 
// }else{
//     $shadow = "";
// }
// if (get_sub_field('offset_title_text')) {
//     $offset_text = "offset-text";
// }else{
//     $offset_text = "";
// }
// if (get_sub_field('content_placement') == 'left') {
//     $row = 'u-flex-row-reverse';
// }else{
//     $row = "";
// }

// $image_text = get_sub_field('image_text');
$foreground_image = get_sub_field('foreground_image');
// $foreground_text = get_sub_field('foreground_text');
$content_text = get_sub_field('content_text');
$link = get_sub_field('cta_button');
$background_colour = get_sub_field('background_colour');
$add_modal = get_sub_field('add_modal');
$modal_video = get_sub_field('modal_video');

$shadow = (get_sub_field('colour_backdrop')) ? "shadow__" . get_sub_field('behind_image_background_colour') : '';
$offset_text = (get_sub_field('offset_title_text')) ? "offset-text" : '';
$row = (get_sub_field('content_placement') == 'left') ? "u-flex-row-reverse" : '';
?>


<section class="section-normal cta bg-<?php echo $background_colour; ?>">
    <div class="container">
        <div class="row <?php echo $row; ?>">
            <div class="col-sm-12 col-md-6">
                <div class="image">
                <?php if ($foreground_image) : ?><img class="shadow <?php echo $shadow; ?>" src="<?php echo $foreground_image['sizes']['medium']; ?>" alt="<?php echo $foreground_image['alt']; ?>"> <?php endif; ?>
                    <?php if ($add_modal) : ?>
                        <a href="#cta-modal" class="play" aria-label="Open Modal">
                            <div>&nbsp;</div>
                        </a>
                        <?php get_template_part('template-parts/sections/modal', null, array('id' => 'cta-modal', 'video' => $modal_video)); // include 'modal.php'; 
                        ?>
                    <?php endif; ?>
                </div>
            </div>

            <div class="col-sm-12 col-md-6 text <?php echo $offset_text; ?>"  data-sal="slide-left" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600">
                <?php echo $content_text;
                if ($link) : ?>
                    <a class="btn" href="<?php echo esc_url($link['url']); ?>" target="<?php echo esc_attr($link['target']); ?>"><?php echo esc_html($link['title']); ?></a>
                <?php endif; ?>
            </div>

        </div>
    </div>
</section>