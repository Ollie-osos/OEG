<?php 

// add options page
if( function_exists('acf_add_options_page') ) {
	acf_add_options_page(array(
		'page_title' 	=> 'Global Settings',
		'menu_title'	=> 'Global Settings',
	));	
	//    ARCHIVES SETTINGS ---------------
    acf_add_options_page(array(
        'page_title'    =>'Archives',
        'menu_title'    =>'Archives',
        'menu_slug' 	=> 'archive',
        'capability'	=> 'edit_posts',
        'parent_slug'	=> '',
        'position'		=> 5,
        'redirect'		=> true,
        'icon_url'		=> 'dashicons-archive'
    ));

    acf_add_options_sub_page(array(
        'page_title' 	=> "Archives Content",
        'menu_title'	=> "Archives Content",
        'menu_slug'	    => 'theme-events',
        'parent_slug'	=> 'archive',
        'position'		=> false,
        'redirect'		=> false,
        'icon_url'		=> false
    ));
} 

// to add custom post types to the sites menu
add_action( 'init', 'create_post_type' );

function create_post_type() {
	register_post_type( 'sep_projects',
		array(
			'labels' => array(
				'name' => __( 'SEP Projects' ),
				'singular_name' => __( 'SEP Project' )
			),
			'public' => true,
			'show_in_nav_menus' => true,
			'has_archive' => true,
			'taxonomies' => array('category', 'post_tag'),
			'supports' => array('title', 'thumbnail', 'editor'),
			// 'menu_icon' => 'dashicons-welcome-learn-more'
		)
	);
	register_post_type( 'open_eye_hub',
		array(
			'labels' => array(
				'name' => __( 'Open Eye Hub' ),
				'singular_name' => __( 'Open Eye Hub' )
			),
			'public' => true,
			'show_in_nav_menus' => true,
			'has_archive' => true,
			'taxonomies' => array('category', 'post_tag'),
			'supports' => array('title', 'thumbnail', 'editor'),
			// 'menu_icon' => 'dashicons-welcome-learn-more'
		)
	);
	register_post_type( 'opportunities',
		array(
			'labels' => array(
				'name' => __( 'Opportunities + Solutions' ),
				'singular_name' => __( 'Opportunities + Solutions' )
			),
			'public' => true,
			'show_in_nav_menus' => true,
			'has_archive' => true,
			'taxonomies' => array('category', 'post_tag'),
			'supports' => array('title', 'thumbnail', 'editor'),
			// 'menu_icon' => 'dashicons-welcome-learn-more'
		)
	);
	register_post_type( 'resources',
		array(
			'labels' => array(
				'name' => __( 'Resources' ),
				'singular_name' => __( 'Resources' )
			),
			'public' => true,
			'show_in_nav_menus' => true,
			'has_archive' => true,
			'taxonomies' => array('category', 'post_tag'),
			'supports' => array('title', 'thumbnail', 'editor'),
			// 'menu_icon' => 'dashicons-welcome-learn-more'
		)
	);
	// register_post_type( 'shop',
	// 	array(
	// 		'labels' => array(
	// 			'name' => __( 'Shop' ),
	// 			'singular_name' => __( 'Shop' )
	// 		),
	// 		'public' => true,
	// 		'show_in_nav_menus' => true,
	// 		'has_archive' => true,
	// 		'taxonomies' => array('category', 'post_tag'),
	// 		'supports' => array('title', 'thumbnail', 'editor'),
	// 		// 'menu_icon' => 'dashicons-welcome-learn-more'
	// 	)
	// );
	register_post_type( 'events',
		array(
			'labels' => array(
				'name' => __( "What's on" ),
				'singular_name' => __( 'Event' )
			),
			'public' => true,
			'rewrite' => array('slug' => 'whatson'),
			'show_in_nav_menus' => true,
			'has_archive' => true,
			'taxonomies' => array('category', 'post_tag'),
			'supports' => array('title', 'thumbnail', 'editor'),
			'menu_icon' => 'dashicons-playlist-audio'
		)
	);
}