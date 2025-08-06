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
        <div id="modalSlider" class="swiffy-slider slider-nav-outside slider-nav-chevron slider-nav-visible slider-nav-animation">
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
        $('#gallerySlider .slider-container li').on('click', function () {
            const clickedIndex = $(this).data('slide-index'); // read from attribute
            console.log('Clicked slide index:', clickedIndex);
            
            console.log('Clicked slide index:', clickedIndex);
            $('#single-modal').addClass('show');

            setTimeout(function () {
                const modalSlider = document.querySelector('#modalSlider');

                if (!modalSlider.hasAttribute('data-slider-initialized')) {
                    swiffyslider.init(modalSlider);
                    modalSlider.setAttribute('data-slider-initialized', 'true');
                }

                // Safe slideTo
                swiffyslider.slideTo(modalSlider, clickedIndex);
            }, 50);
        });


        $('.close').on('click', function () {
            $('#single-modal').removeClass('show');
        });

    });
</script>