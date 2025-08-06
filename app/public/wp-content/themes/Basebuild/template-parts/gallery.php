<?php
// https://swiffyslider.com/configuration/
$count = 0;
$images = get_field('gallery');

if ($images) { ?>
    <?php get_template_part('template-parts/modal', null, array('type' => 'normal')); ?>
    <section class="carousel">
        <div class="container border-bottom">
            <div class="row">
                <div id="gallerySlider" class="swiffy-slider slider-item-show2 slider-item-reveal slider-nav-arrow slider-nav-outside-expand slider-nav-visible slider-indicators-round slider-indicators-outside slider-nav-animation"> <!-- slider-nav-autopause -->
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
                        foreach ($images as $image): ?>
                            <li>
                                <div>
                                    <div class="background-image gallery-image" style="background-image: url('<?php echo esc_url($image['sizes']['medium']); ?>')"> &nbsp; </div>
                                </div>
                            </li>
                        <?php endforeach; ?>
                    </ul>

                </div>

            </div>
        </div>
    </section>

    <script>
        $(function () {
            $('#gallerySlider .slider-container li').each(function (i) {
                $(this).attr('data-slide-index', i);
            });
        });
    </script>
<?php }
