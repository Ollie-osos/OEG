<?php 

if ($args['type']) {
	$type = $args['type'];
} 

$title = get_field($type.'title', 'option');
$text = get_field($type.'text', 'option');
$links = get_field($type.'links', 'option');

?>

<section class="additional-links">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <h3><?php echo $title; ?></h3>
                <p><?php echo $text; ?></p>
            </div>
            <div class="col-md-6 col-sm-12">
                <?php
                if( have_rows($type.'links', 'option') ): ?>
                    <ul>
                        <?php while( have_rows($type.'links', 'option') ) : the_row();
                            $link = get_sub_field('link'); ?>
                            <li><a href="<?php echo $link['url']; ?>"><?php echo $link['title']; ?></a></li>
                        <?php endwhile; ?>
                    </ul>
                <?php else :
                    // Do something...
                endif; ?>
            </div>
        </div>
    </div>
</section>