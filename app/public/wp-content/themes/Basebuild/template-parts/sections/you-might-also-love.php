<?php

if ($args['type']) {
	$type = $args['type'];
    if($type == 'blog'){
        $cta = 'ctas_blogs';
        $ymal_title = 'ymal_title_blogs';
        $option = 'option';
        $add = 'add_ymal_blogs';
        $bg = 'light-blue';
    }elseif($type == 'podcasts'){
        $cta = 'ctas_podcasts';
        $ymal_title = 'ymal_title_podcasts';
        $option = 'option';
        $add = 'add_ymal_podcasts';
        $bg = 'pink';
    }elseif($type == 'courses'){
        $cta = 'ctas_courses';
        $ymal_title = 'ymal_title_courses';
        $option = 'option';
        $add = 'add_ymal_courses';
        $bg = 'pink';
    }else{
        $cta = 'ctas';
        $ymal_title = 'ymal_title';
        $option = '';
        $add = 'add_ymal';
        $bg = 'pink';
    }
} 

$add_ymal = get_field($add, $option);

if($add_ymal){
?>


<section class="cards section-small bg-<?php echo $bg; ?>">
    <?php if (get_field($ymal_title, $option)) {
        echo '<h2 class="u-text-center blue-text">' . get_field($ymal_title, $option) . '</h2>';
    }
    if (have_rows($cta, $option)) : ?>
        <div class="container">
            <div class="row">
                <?php // loop through the rows of data
                while (have_rows($cta, $option)) : the_row();

                    $title = get_sub_field('title');
                    $subtitle = get_sub_field('subtitle');
                    $image = get_sub_field('image');
                    $link = get_sub_field('link'); ?>

                    <div class="col-sm-12 col-md-6 card-spacer ">
                        <div class="card h-100 u-flex u-flex-column">
                            <div class="card__container">
                                <?php if ($image) {
                                    echo '<div class="card__image" style="background-image: url(' . $image['sizes']['medium'] . ')"/> </div>';
                                } ?>
                            </div>
                            <div class="card__mobile-title">
                                <div class="content">
                                    <?php if ($link) { ?>
                                        <a href="<?php echo $link['url']; ?>">
                                            <?php if ($title) {
                                                echo '<div class="card__header white-text"> ' . $title . ' </div>';
                                            } ?>
                                            <?php if ($subtitle) {
                                                echo '<p class="pink-text"> ' . $subtitle . ' </p>';
                                            } ?>
                                        </a>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="card__body content"></div>
                        </div>
                    </div>

              <?php  endwhile; ?>
            </div>
        </div>

    <?php endif; ?>
</section>
<?php } 