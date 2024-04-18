<?php 
$large_text = get_sub_field('large_text');
$background_color = get_sub_field('background_colour'); 

?>

<section class="large-text section-small bg-<?php echo $background_color; ?>">
    <div class="container">
        <div class="row u-justify-center">
            <div class="col-sm-12 col-md-10" data-sal="slide-up" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="500">
                <?php echo $large_text; ?>
            </div>
        </div>
    </div>
</section>
