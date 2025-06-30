<?php

if ($args['type']) {
    $type = $args['type'];
    if ($type == 'builder'){
        $photos = get_sub_field('images');
    } else {
        $photos = get_field('gallery');
    }
} else {
    $photos = get_field('gallery');
}

?>

<div id="single-modal" class="modal-single">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="swiffy-slider slider-nav-outside slider-nav-chevron slider-nav-visible">
            <ul class="slider-container u-text-center">
                <?php foreach ($photos as $photo) { ?>
                    <li><img class="image-modal" src="<?php echo $photo['sizes']['medium'] ?>" alt="<?php echo $photo['alt'] ?>"></li>
                <?php } ?>
            </ul>
            <button type="button" class="slider-nav"></button>
            <button type="button" class="slider-nav slider-nav-next"></button>
        </div>
    </div>
</div>

<script>
    $(function() {
        $('.slider-container li').on('click', function(e) {
            $('#single-modal').addClass('show');
        });

        $('.close').on('click', function(e) {
            $('#single-modal').removeClass('show');
        });
    });
</script>