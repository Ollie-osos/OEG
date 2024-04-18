<?php
$background_colour = get_sub_field('background_colour');
$image = get_sub_field('image');
$text = get_sub_field('text'); ?>

<section class="podcast-hero" style="background-color: <?php echo $background_colour; ?>">
    <div class="container">
        <div class="row">

            <div class="col-sm-12 col-md-8 image" data-sal="fade" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"> 
                <img src="<?php echo $image['sizes']['medium']; ?>" alt="<?php echo $image['sizes']['medium']; ?>">
            </div>
        </div>
        <div class="col-sm-12 col-md-4 pt-4 pb-3 u-text-center">
            <?php echo $text; ?>
        </div>
    </div>
</section>