<?php 
$background_colour = get_sub_field('background_colour');
$image_1 = get_sub_field('image_1');
$image_2 = get_sub_field('image_2');
$text = get_sub_field('text');

?>

<section class="ceri-message" style="background-color: <?php echo $background_colour; ?>">
    <div class="container">
        <div class="row">
            <div class="ceri-message__image1">
                <img src="<?php echo $image_1['sizes']['medium']; ?>" alt="<?php echo $image_1['alt']; ?>">
            </div>
            <div class="ceri-message__image2">
                <img src="<?php echo $image_2['sizes']['medium']; ?>" alt="<?php echo $image_2['alt']; ?>">
            </div>
            <div class="col-12">
                <h4><?php echo $text; ?></h4>
            </div>
        </div>
    </div>
</section>