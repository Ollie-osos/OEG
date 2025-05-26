<?php
$video = get_sub_field('video');
$sal = 'data-sal="fade" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600"';
?>

<section class="main-hero">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 pb-3">
                <div class="videoWrapper">
                    <iframe src="<?php echo $video; ?>"></iframe>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- <div class="videoWrapper">
    <div id="poster" style="pointer:cursor;" data-video="<?php // echo $video; ?>?autoplay=1">
        <img src="<?php // echo $poster; ?>">
        <div class="play"><div>&nbsp;</div></div>
    </div>
</div> -->

<!-- <script>
$(function() {
    // Show dropdown when clicked
    $('#poster').on('click', function(e) {
        video = '<iframe src="'+ $(this).attr('data-video') +'"></iframe>';
        $(this).replaceWith(video);
    });
});
</script> -->