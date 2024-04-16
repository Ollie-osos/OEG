<?php
// Include WordPress core file
require_once( 'wp-load.php' );

// Fetch posts based on selected filters
$category = $_POST['category'];
$dateFilter = $_POST['dateFilter'];

$args = array(
    'post_type' => 'events',
    'meta_key'      => 'event_type',
    'meta_value'    => $category,
    'posts_per_page' => -1, // Get all posts
    // 'date_query' => array(),
);

// Construct date query based on selected filter
// switch ($dateFilter) {
//     case 'today':
//         $args['date_query'][] = array(
//             'after' => 'midnight',
//             'before' => 'tomorrow',
//             'inclusive' => true,
//         );
//         break;
//     case 'week':
//         $args['date_query'][] = array(
//             'after' => '1 week ago',
//         );
//         break;
//     case 'month':
//         $args['date_query'][] = array(
//             'after' => '1 month ago',
//         );
//         break;
// }

// Query WordPress posts
$posts_query = new WP_Query($args);

// Display post data in HTML format
if ($posts_query->have_posts()) :
    while ($posts_query->have_posts()) : $posts_query->the_post();
        // Output post data as needed
        ?>
        <div class="post">
            <h2><?php the_title(); ?></h2>
            <div class="post-content">
                <?php the_content(); ?>
            </div>
        </div>
        <?php
    endwhile;
    wp_reset_postdata(); // Restore global post data
else :
    echo '<p>No posts found.</p>';
endif;
?>