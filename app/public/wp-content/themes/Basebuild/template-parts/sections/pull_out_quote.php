<?php $pull_out_quote = get_sub_field('pull_out_quote'); ?>

<section class="pull_out_quote bg-lighter-blue section-small">
    <div class="container">
        <div class="row u-items-center">
            <div class="col-sm-12 u-flex u-flex-row" data-sal="slide-left" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600">
                <div class="quote-mark"><img src="<?php echo get_template_directory_uri() ?>/dist/img/quote-<?php echo get_sub_field('quote_colour') ?>.svg" alt="quote mark"></div>
                <div class="col pl-4"><p class="blue-text extra-large"><?php echo $pull_out_quote; ?></p></div>
            </div>
        </div>
    </div>
</section>