<?php

$primary_link = get_sub_field('primary_link');
$secondary_link = get_sub_field('secondary_link');
$background_colour = get_sub_field('background_colour'); 
?>

    <section class="apply-for-coaching bg-<?php echo $background_colour; ?> section-small">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 data-sal="slide-left" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"><?php echo get_sub_field('title') ?></h2>
                    <p><?php echo get_sub_field('content') ?></p>
                    <div>
                        <?php if( $primary_link ): ?>
                            <a class="btn" href="<?php echo esc_url( $primary_link['url'] ); ?>" target="<?php echo esc_attr( $primary_link['target'] ); ?>"><?php echo esc_html( $primary_link['title'] ); ?></a>
                        <?php endif; ?>
                        <?php if( $secondary_link ): ?>
                            <a class="btn-transparent btn" href="<?php echo esc_url( $secondary_link['url'] ); ?>" target="<?php echo esc_attr( $secondary_link['target'] ); ?>"><?php echo esc_html( $secondary_link['title'] ); ?></a>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
