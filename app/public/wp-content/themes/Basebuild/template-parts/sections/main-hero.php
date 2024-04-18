<?php 

$foreground_image = get_sub_field('foreground_image');
$modal_video = get_sub_field('modal_video');
$foreground_text = get_sub_field('foreground_text');
$link = get_sub_field('cta_button');
$add_modal = get_sub_field('add_modal');
$add_quote_mark = get_sub_field('add_quote_mark'); 
$image_display_type = get_sub_field('image_display_type'); 
$row = (get_sub_field('content_placement') == 'left') ? "u-flex-row-reverse" : '';
$half = (get_sub_field('content_placement') == 'left') ? "right" : 'left';

$sal = 'data-sal="fade" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"';
?>

<section class="main-hero">
    <div class="container-fluid bg-blue">
        <div class="row <?php echo $row; ?> u-items-center">
            <div class="col-sm-12 col-md-6">
                <div class="half-center <?php echo $half; ?>">
                    <?php if( $add_quote_mark ): ?>
                        <div class="quote-mark"><img src="<?php echo get_template_directory_uri() ?>/dist/img/quote-<?php echo get_sub_field('quote_colour') ?>.svg" alt="quote mark"></div>
                    <?php endif; ?>
                    <div class="wysiwyg" data-sal="slide-left" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"><?php echo $foreground_text; ?></div>
                    <?php if( $link ): ?>
                        <a class="btn" href="<?php echo esc_url( $link['url'] ); ?>" target="<?php echo esc_attr( $link['target'] ); ?>"><?php echo esc_html( $link['title'] ); ?></a>
                    <?php endif; ?>
                </div>
            </div>
            <div class="col-sm-12 col-md-6 foreground-image">
                <img src="<?php echo $foreground_image['sizes']['medium']; ?>" alt="<?php echo $foreground_image['alt']; ?>">
                <?php if ($add_modal) : ?>
                    <a href="#main-hero-modal" aria-label="Open Modal" class="play">
                        <div>&nbsp;</div>
                    </a>
                    <?php get_template_part( 'template-parts/sections/modal', null, array( 'id' => 'main-hero-modal', 'video' => $modal_video)); // include 'modal.php'; ?>
                <?php endif; ?>
            </div>
        </div>
    </div>
    
</section>


