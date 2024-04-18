<?php
// $background_colour = get_sub_field('background_colour');
$image_1 = get_sub_field('image_1');
$image_2 = get_sub_field('image_2');
$text = get_sub_field('text');

?>

<section class="bg-blue section-small ceri-message">
    <div class="container">
        <div class="row u-justify-center">
            <div class="col-md-8 xol-sm-12 u-text-center message">
                <div class="h1"><?php echo $text; ?></div>
                <img id="kiss" src="<?php echo get_template_directory_uri() ?>/dist/img/kiss.svg" alt="">
            </div>

        </div>
    </div>
    <div class="ceri-message__image1" data-sal="slide-up" data-sal-delay="600" data-sal-easing="ease-out-quart" data-sal-duration="500">
        <?php if ($image_1) { ?> <img src="<?php echo $image_1['sizes']['medium']; ?>" alt="<?php echo $image_1['alt']; ?>"> <?php } ?>
    </div>
    <div class="ceri-message__image2" data-sal="slide-up" data-sal-delay="600" data-sal-easing="ease-out-quart" data-sal-duration="500">
        <?php if ($image_2) { ?> <img src="<?php echo $image_2['sizes']['medium']; ?>" alt="<?php echo $image_2['alt']; ?>"> <?php } ?>
    </div>
</section>