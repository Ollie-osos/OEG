<?php

$layout = get_field('layout');
$gallery = get_field('image_gallery');
$link = get_field('link');

if ($link) {
    $cta = '<a class="btn btn-full" href="' . $link["url"] . '">' . $link["title"] . '</a>';
} else {
    $cta = '';
}

?>

<section class="content-page">
    <div class="container">
        
        <?php if ($layout == 'hero') { ?>
            <div class="row">
                <div class="col-sm-12 pb-3">
                    <?php if (get_field('hero_video')) { ?>
                        <div class="videoWrapper">
                            <?php echo get_field('hero_video'); ?>
                            <br>

                        </div>
                    <?php } else { ?>
                        <div class="hero_image">
                            <img src="<?php echo get_the_post_thumbnail_url(); ?>" alt="Hero image">
                        </div>
                    <?php } ?>
                </div>
                <div class="col-sm-12 double-column"><?php the_content(); ?><br><?php echo $cta; ?></div>
            <div class="row">
        <?php } elseif ($layout == 'gallery') { ?>
            <div class="row mobile-reverse-row">
                <div class="col-sm-12 col-md-6">
                    <?php if ($gallery) { ?>
                        <?php foreach ($gallery as $image) : ?>
                            <img src="<?php echo esc_url($image['sizes']['large']); ?>" alt="<?php echo esc_attr($image['alt']); ?>" />
                            <br>
                        <?php endforeach; ?>
                    <?php } ?>
                </div>
                <div class="col-sm-12 col-md-6"><?php the_content(); ?><br><?php echo $cta; ?></div>
            </div>
        <?php } else { ?>
            <div class="row mobile-reverse-row">
                <div class="col-sm-12 col-md-6">
                    <div class="image">
                        <img src="<?php echo get_the_post_thumbnail_url(); ?>" alt="Hero image">
                    </div>
                </div>
                <div class="col-sm-12 col-md-6"><?php the_content(); ?><br><?php echo $cta; ?></div>
            </div>
        <?php } ?>
        
    </div>
</section>