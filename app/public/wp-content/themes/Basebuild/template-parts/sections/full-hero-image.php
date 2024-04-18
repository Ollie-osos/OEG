<?php
$image = get_sub_field('image');
$large_text = get_sub_field('large_text');
$text_colour = get_sub_field('text_colour');
$text_position = get_sub_field('text_position');

if ($text_position == 'left') {
    $row = "u-text-left u-justify-flex-start";
    $col = "col-sm-12 col-md-8";
} else if ($text_position == 'right') {
    $row = "u-text-right u-justify-flex-end";
    $col = "col-sm-12 col-md-8";
} else {
    $row = "u-text-center u-justify-center";
    $col = "col-sm-12 col-md-10";
}
?>


<section class="full background-image u-flex u-items-center" style="background-image: url('<?php echo $image['sizes']['large']; ?>')">
    <div class="container">
        <div class="row <?php echo $row; ?>">
            <div class="<?php echo $col; ?>">
                <div class="h1 <?php echo $text_colour; ?>-text" data-sal="slide-left" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"><?php echo $large_text; ?></div>
            </div>
        </div>
    </div>
</section>