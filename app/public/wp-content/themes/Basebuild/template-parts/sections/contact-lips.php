<?php 
$background_colour = get_sub_field('background_colour');
$form_embed = get_sub_field('form_embed');
$text = get_sub_field('text');
$add_lips = get_sub_field('add_lips'); ?>

<section class="contact" style="background-color: <?php echo $background_colour; ?>">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6">
                <?php echo $text; ?>
            </div>
            <div class="col-sm-12 col-md-6">
                <?php echo $form_embed; ?>
                <?php if ($add_lips) { echo '<div class="lips"></div>'; } ?>
            </div>
        </div>
    </div>
</section>