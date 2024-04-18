<?php
// https://swiffyslider.com/configuration/
$count = 0;
$images = get_field('gallery');

if ($images) { ?>

    <section class="fullscreen-carousel">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>Images</h2>
                    <div class="swiffy-slider slider-item-snapstart slider-nav-chevron slider-nav-visible slider-nav-animation slider-nav-animation-fadein slider-nav-autoplay" data-slider-nav-autoplay-interval="3500"> <!-- slider-nav-autopause -->
                        <ul class="slider-container">
                            <?php foreach ($images as $image) : ?>
                                <li>
                                    <a href="<?php echo esc_url($image['url']); ?>">
                                        <img src="<?php echo esc_url($image['sizes']['large']); ?>" alt="<?php echo esc_attr($image['alt']); ?>" />
                                    </a>
                                    <p><?php echo esc_html($image['caption']); ?></p>
                                </li>
                            <?php endforeach; ?>

                        </ul>

                        <button type="button" class="slider-nav"></button>
                        <button type="button" class="slider-nav slider-nav-next"></button>

                        <div class="slider-indicators">
                            <?php
                            foreach ($images as $image) :
                                if ($count < 1) :
                                    echo '<button class="active"></button>';
                                else :
                                    echo '<button></button>';
                                endif;
                            endforeach; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
<?php }
