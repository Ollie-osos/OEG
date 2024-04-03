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
        'page_title' 	=> 'Courses archive',
        'menu_title'	=> 'Courses archive',
        'menu_slug'	    => 'theme-course',
        'parent_slug'	=> 'archive',
        'position'		=> false,
        'redirect'		=> false,
        'icon_url'		=> false
    ));

    acf_add_options_sub_page(array(
        'page_title' 	=> 'Podcasts archive',
        'menu_title'	=> 'Podcasts archive',
        'menu_slug'	    => 'theme-Podcast',
        'parent_slug'	=> 'archive',
        'position'		=> false,
        'redirect'		=> false,
        'icon_url'		=> false
    ));
} 

// to add custom post types to the sites menu
add_action( 'init', 'create_post_type' );

function create_post_type() {
	register_post_type( 'courses',
		array(
			'labels' => array(
				'name' => __( 'Courses' ),
				'singular_name' => __( 'Course' )
			),
			'public' => true,
			'show_in_nav_menus' => true,
			'has_archive' => true,
			'taxonomies' => array('category', 'post_tag'),
			// 'supports' => array('title', 'thumbnail', 'author'),
			'menu_icon' => 'dashicons-welcome-learn-more'
		)
	);
	register_post_type( 'podcasts',
		array(
			'labels' => array(
				'name' => __( 'Podcasts' ),
				'singular_name' => __( 'Podcast' )
			),
			'public' => true,
			'show_in_nav_menus' => true,
			'has_archive' => true,
			'taxonomies' => array('category', 'post_tag'),
			// 'supports' => array('title', 'thumbnail', 'author'),
			'menu_icon' => 'dashicons-playlist-audio'
		)
	);
}