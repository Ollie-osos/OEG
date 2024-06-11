<?php
// https://swiffyslider.com/configuration/
$count = 0;
$images = get_field('gallery');

if ($images) { ?>

    <section class="carousel">
        <div class="container border-bottom">
            <div class="row">
                <div class="swiffy-slider slider-item-show2 slider-item-reveal slider-nav-arrow slider-nav-outside-expand slider-nav-visible slider-indicators-round slider-indicators-outside"> <!-- slider-nav-autopause -->
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <h2>IMAGES</h2>
                            </div>
                            <div class="col-sm-12 col-md-6 u-flex u-justify-flex-end">
                                <button type="button" class="slider-nav"></button>
                                <button type="button" class="slider-nav slider-nav-next"></button>
                            </div>
                        </div>
                    </div>
                        
                    <ul class="slider-container">
                        <?php // loop through the rows of data
                        foreach( $images as $image ): ?>
                            <li>
                                <div>
                                    <div class="background-image" style="background-image: url('<?php echo esc_url($image['sizes']['medium']); ?>')"> &nbsp; </div>
                                </div>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                                    
                </div>

            </div>
        </div>
    </section>
<?php }
