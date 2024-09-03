<?php
// Include WordPress core file
require_once( '../wp-load.php' );

// Fetch posts based on selected filters

$category1 = isset($_POST['category1']) ? $_POST['category1'] : '';
$category2 = isset($_POST['category2']) ? $_POST['category2'] : '';




// Arguments for the custom query
$args = array(
    'post_type' => 'events', // Change to your post type
    'date_query' => array(
        array(
            'column' => 'post_date_gmt',
            'before' => '1 year ago',
        ),
    ),
    'posts_per_page' => -1,
    'meta_query' => array(
        'relation' => 'AND',
        array(
            'key' => 'event_type',
            'value' => $category1, // Change to the value you are looking for
            'compare' => 'LIKE',
        ),
    ),
);

// Query WordPress posts
$posts_query = new WP_Query($args);

// Display post data in HTML format
if ($posts_query->have_posts()) :
    while ($posts_query->have_posts()) : $posts_query->the_post();
        
        $labels = array_column(get_field('event_type'), 'label');
        $implodeLabels = implode(', ', $labels); 
        $end_date = DateTime::createFromFormat('Ymd', get_field('end_date'))->format('d M Y'); 
        $start_date = DateTime::createFromFormat('Ymd', get_field('start_date'))->format('d M Y'); 
        ?>
        <div class="post col-sm-12 col-md-6">
            <a href="<?php the_permalink(); ?>">
                <div class="background-image" style="background-image: url('<?php echo get_the_post_thumbnail_url(); ?>')"> </div>
                <div class="text pt-2"> 
                    <h3 class="black-text"><?php the_title(); ?></h3>
                    <?php echo '<h3 class="red-text">'.$start_date.' - '.$end_date.'</h3><h3 class="blue-text">'.$implodeLabels.'</h3>'; ?>
                </div>
            </a>
        </div>
        <?php
    endwhile;
    wp_reset_postdata(); // Restore global post data
else :
    
endif;
?>