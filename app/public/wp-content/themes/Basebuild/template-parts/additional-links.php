<?php 

if ($args['type']) {
	$type = $args['type'];
} 

if ($args['gallery']) {
	$add_gallery = $args['gallery'];
    $title_class = 'col-sm-12 col-md-6 u-flex-column u-flex u-justify-space-between';
    $text_class = 'col-md-6 col-sm-12 al-text';
    $text = get_field($type.'text', 'option');
}else{
    $add_gallery = false;
    $title_class = 'col-sm-12 u-flex-column u-flex u-justify-space-between';
    $text_class = 'double-column col-sm-12';
    $text = '';
}

$title = get_field($type.'title', 'option');
$links = get_field($type.'links', 'option');

if($type == 'en_' && $add_gallery){
    $gallery = 'engagement_gallery';
}elseif($type == 'ed_' && $add_gallery){
    $gallery = 'education_gallery';
}else{
    $gallery = false;
}


?>

<section class="additional-links">
    <div class="container">
        <div class="row">
            <div class="<?php echo $title_class; ?>">
                <h2><?php echo $title; ?></h2>
                <?php echo $text; ?>
            </div>
            <div class="<?php echo $text_class; ?>">
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
            
        <?php if( $gallery ): 
            $images = get_field($gallery); ?>   
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
