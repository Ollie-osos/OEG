<?php
// https://swiffyslider.com/configuration/
$section_title = get_sub_field('section_title');
$images = get_sub_field('images');

if ($images) { ?>

    <section class="marquee section-normal bg-blue">
        <div class="container">
            <div class="row u-text-center">
                <div class="col-12" data-sal="slide-left" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600">
                    <h2><?php echo $section_title; ?></h2>
                </div>
                <div class="col-12">
                    <div class="swiffy-slider slider-nav-outside slider-item-ratio-16x9 slider-item-show3 slider-item-show2-sm slider-nav-chevron slider-nav-visible slider-nav-autoplay">
                        <ul class="slider-container">
                            <?php foreach ($images as $image) : ?>
                                <li><img src="<?php echo esc_url($image['sizes']['medium']); ?>" alt="<?php echo esc_attr($image['alt']); ?>" /></li>
                            <?php endforeach; ?>

                        </ul>
                        <button type="button" class="slider-nav"></button>
                        <button type="button" class="slider-nav slider-nav-next"></button>
                    </div>
                </div>
            </div>
        </div>

        </div>
    <?php }
