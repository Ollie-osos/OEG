<?php 

if ($args['type']) {
	$type = $args['type'];
} 
$carousel = get_field($type.'carousel');
?>

<section class="carousel">
    <div class="container border-bottom">
        <div class="row">

            <?php if (have_rows($type.'carousel')) : ?>
                <div class="swiffy-slider slider-item-show2 slider-item-reveal slider-nav-arrow slider-nav-outside-expand slider-nav-visible slider-indicators-round slider-indicators-outside"> <!-- slider-nav-autopause -->
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                            <?php if($type == 'event_'){
                                echo "<h2><a class='black-text' href='/whatson'>What's On</a></h2>";
                            }else {
                                echo "<h2><a class='black-text' href='/news'>NEWS & READING</a></h2>";
                            }
                            ?>
                            </div>
                            <div class="col-sm-12 col-md-6 u-flex u-justify-flex-end">
                                <button type="button" class="slider-nav"></button>
                                <button type="button" class="slider-nav slider-nav-next"></button>
                            </div>
                        </div>
                    </div>
                        
                    <ul class="slider-container">
                        <?php // loop through the rows of data
                        while (have_rows($type.'carousel')) : the_row();
                            $post = get_sub_field('post_carousel');
                            if ($post) :
                                setup_postdata($post); 
                                if($type == 'event_'){
                                    $labels = array_column(get_field('event_type'), 'label');
                                    $implodeLabels = implode(', ', $labels); 
                                    $locationLabel = (get_field('event_location')['label'] != '') ? get_field('event_location')['label'] : '';
                                    $end_date = (get_field('end_date') != '') ? DateTime::createFromFormat('Ymd', get_field('end_date'))->format('d M Y') : ''; 
                                    $start_date = (get_field('start_date') != '') ? DateTime::createFromFormat('Ymd', get_field('start_date'))->format('d M Y') : ''; 
                                    $display_date = (get_field('start_date') == get_field('end_date')) ? $start_date : $start_date .' - '. $end_date;
                                }
                                ?>
                                <li>
                                    <div>
                                        <a href="<?php the_permalink(); ?>">
                                            <div class="background-image" style="background-image: url('<?php echo get_the_post_thumbnail_url(); ?>')"> </div>
                                            <div class="text pt-2">
                                                
                                                    <h3 class="black-text"><?php the_title(); ?></h3>
                                                    <?php  if($type == 'event_'){
                                                        echo '<h3 class="red-text">'.$display_date.'</h3><h3 class="green-text">'.$locationLabel.'</h3><h3 class="blue-text">'.$implodeLabels.'</h3>';
                                                    } ?>
                                                
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <?php wp_reset_postdata(); ?>
                            <?php endif; ?>
                        <?php endwhile; ?>
                    </div>
                </div>

            <?php endif; ?>
        </div>
    </div>
</section>