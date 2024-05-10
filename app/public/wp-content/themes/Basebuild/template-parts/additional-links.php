<?php 

if ($args['type']) {
	$type = $args['type'];
} 

$title = get_field($type.'title', 'option');
$text = get_field($type.'text', 'option');
$links = get_field($type.'links', 'option');

if($type == 'en_'){
    $gallery = 'engagement_gallery';
}elseif($type == 'ed_'){
    $gallery = 'education_gallery';
}
?>

<section class="additional-links border-bottom">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6 u-flex-column u-flex u-justify-space-between">
                <h2><?php echo $title; ?></h2>
                <p><?php echo $text; ?></p>
            </div>
            <div class="col-md-6 col-sm-12">
                <?php
                if( have_rows($type.'links', 'option') ): ?>
                        <?php while( have_rows($type.'links', 'option') ) : the_row();
                            $link = get_sub_field('link'); ?>
                            <a class="btn btn-full" href="<?php echo $link['url']; ?>"><?php echo $link['title']; ?></a>
                        <?php endwhile; ?>
                <?php else :
                    // Do something...
                endif; ?>
            </div>
        </div>
            
        <?php 
        $images = get_field($gallery);
        if( $images ): ?>
            <div class="row">
                <?php foreach( $images as $image ): ?>
                    <div class="col-md-6 col-sm-12">
                        <div class="background-image" style="background-image: url('<?php echo esc_url($image['sizes']['medium']); ?>')">
                            &nbsp;
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
            
    </div>
</section>
