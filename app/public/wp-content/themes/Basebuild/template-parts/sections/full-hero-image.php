<?php 
$image = get_sub_field('image');
$large_text = get_sub_field('large_text'); ?>


<section class="full-hero-image" style="background-image: url(<?php echo $image['sizes']['large']; ?>">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <?php echo $large_text; ?>
            </div>
        </div>
    </div>
</section>