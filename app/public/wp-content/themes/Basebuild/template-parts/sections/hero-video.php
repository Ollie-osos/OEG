<?php
$video = get_sub_field('video');
$poster = get_sub_field('poster');
$title = get_sub_field('title');

?>

<section class="hero-video section-small">
    <div class="container">
        <div class="row u-justify-center" data-sal="slide-up" data-sal-delay="300" data-sal-easing="ease-out-quart" data-sal-duration="600">
            <div class="col-sm-12 col-md-10">
                <h2 class="u-text-center"><?php echo $title; ?></h2>
                <div class="videoWrapper">
                    <div id="poster" style="pointer:cursor;" data-video="<?php echo $video; ?>?autoplay=1">
                        <img src="<?php echo $poster; ?>">
                        <div class="play"><div>&nbsp;</div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
$(function() {
    // Show dropdown when clicked
    $('#poster').on('click', function(e) {
        video = '<iframe src="'+ $(this).attr('data-video') +'"></iframe>';
        $(this).replaceWith(video);
    });
});
</script>