<?php 

$image_text = get_sub_field('image_text');
$foreground_image = get_sub_field('foreground_image');
$foreground_text = get_sub_field('foreground_text');
$content_text = get_sub_field('content_text');
$cta_button = get_sub_field('cta_button');
$background_colour = get_sub_field('background_colour'); 

$shadow = (get_sub_field('colour_backdrop')) ? "shadow-".get_sub_field('behind_image_background_colour') : ''; 
$offset_text = (get_sub_field('offset_title_text')) ? "offset-text" : ''; 
$row = (get_sub_field('content_placement') == 'left') ? "u-flex-row-reverse" : ''; 

// if (get_sub_field('colour_backdrop')) {
//     $shadow = "shadow-".get_sub_field('behind_image_background_colour');
// }else{
//     $shadow = "";
// }
// if (get_sub_field('offset_title_text')) {
//     $offset_text = "offset-text";
// }else{
//     $offset_text = "";
// }
// if (get_sub_field('content_placement') == 'left') {
//     $row = 'u-flex-row-reverse';
// }else{
//     $row = "";
// }

?>


<section class="cta" style="background-color: <?php echo $background_colour; ?>">
    <div class="container">
        <div class="row <?php echo $row; ?>">
            <div class="col-sm-12 col-md-6">
                <?php if( $image_text == 'image' ) { ?>
                    <div class="image <?php echo $shadow; ?>">
                        <img src="<?php echo $foreground_image['sizes']['medium']; ?>" alt="<?php echo $foreground_image['alt']; ?>">
                    </div>
                <?php } else { ?>
                    <div class="text <?php echo $offset_text; ?>">
                        <?php echo $foreground_text; ?>
                    </div>
                <?php } ?>
            </div>
            
            <div class="col-sm-12 col-md-6">
                <?php echo $content_text; 
                if( $link ): ?>
                    <a class="button" href="<?php echo esc_url( $link['url'] ); ?>" target="<?php echo esc_attr( $link['target'] ); ?>"><?php echo esc_html( $link['title'] ); ?></a>
                <?php endif; ?>
            </div>

        </div>
    </div>
</section>