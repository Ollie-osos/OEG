<?php 

$image = get_sub_field('image');
$sal = 'data-sal="fade" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"';
?>

<section class="main-hero">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 pb-3">
                <div class="hero_image">
                    <img src="<?php echo $image['sizes']['large'] ?>" alt="Hero image">
                    <?php if($image['caption']){ ?> <span class='caption'> <?php echo $image['caption']; ?> </span> <?php } ?>
                </div>
            </div>
        </div>
    </div>
</section>


