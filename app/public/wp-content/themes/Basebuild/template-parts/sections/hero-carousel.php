<?php
// https://swiffyslider.com/configuration/
$count = 0;
$images = get_sub_field('images');

if ($images) { ?>

    <section class="hero-carousel">
        <div class="container-fluid">
            <div class="swiffy-slider slider-item-nogap slider-nav-animation slider-nav-animation-fadein slider-nav-autoplay" data-slider-nav-autoplay-interval="3500"> <!-- slider-nav-autopause -->
                <div class="slider-container">
                    <?php foreach ($images as $image) : ?>
                        <section class="full background-image"  style="background-image: url('<?php echo $image['sizes']['large']; ?>')"></section>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </section>
<?php }
