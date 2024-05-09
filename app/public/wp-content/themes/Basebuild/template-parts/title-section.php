<?php 
$subtitle = get_field('subtitle');
?>
<section class="section title-section">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1><?php the_title(); ?></h1>
                <?php if($subtitle){ ?><p class="large"><?php echo $subtitle; ?></p> <?php } ?>
            </div>
        </div>
    </div>
</section>