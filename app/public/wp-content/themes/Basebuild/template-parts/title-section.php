<?php 

if ($args['archive'] && $args['archive'] != 'none' ) {
	$archive = $args['archive'];
    $title = get_field($archive.'title', 'option');
    $subtitle = get_field($archive.'subtitle', 'option');
}else{
    $title = get_the_title();
    $subtitle = get_field('subtitle');
}
?>
<section class="section title-section border-bottom">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1><?php echo $title; ?></h1>
                <?php if($subtitle){ ?><br><p class="large"><?php echo $subtitle; ?></p> <?php } ?>
            </div>
        </div>
    </div>
</section>