<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

class Zoho_Flow_WordPress_org extends Zoho_Flow_Service
{
	public function init(){
		require_once __DIR__ . '/webhook-processor.php';
	}
	public function addActionHooks(){
	}
	public function initRestApis(){
	}

	public function get_post($request){

	    $post_id = $request['post_id'];
	    if(!ctype_digit($post_id)){
	        return new WP_Error( 'rest_bad_request', esc_html__( 'The post ID is invalid.', 'zoho-flow' ), array( 'status' => 400 ) );
	    }
	    $post_data = get_post($post_id);
	    $data = $this->update_tags_and_categories($post_id);

	    $post_data->tags = $data['tags'];
	    $post_data->categories = $data['categories'];
	    return rest_ensure_response( $post_data);
	}

	private function update_tags_and_categories($post_id){
	    $data = array();
	    $tags = array();
	    $categories = array();
	    $list = wp_get_post_tags($post_id);
	    foreach($list as $tag){
	        array_push($tags, $tag->name);
	    }
	    $list = wp_get_post_categories($post_id);
	    foreach($list as $categoryid){
	        $category = get_category($categoryid);
	        array_push($categories, $category->name);
	    }
	    $data['tags'] = $tags;
	    $data['categories'] = $categories;
	    return $data;
	}

    	public function get_posts( $request ){
	    $data = array();
	    $args = array("posts_per_page" => 100, "orderby" => "comment_count");

	    $posts_array = get_posts($args);
	    $schema = $this->get_post_schema( $request );
	    $list = array();
	    foreach($posts_array as $post)
	    {
	        if( isset( $schema['properties']['post_id'])){
	    	    $post_data['post_id'] = $post->ID;
	        }
	    	if ( isset( $schema['properties']['post_title'] ) ) {
		    $post_data['post_title'] = $post->post_title;
	    	}
	    	if ( isset( $schema['properties']['post_content'] ) ) {
		    $post_data['post_content'] = $post->post_content;
	    	}
	    	if ( isset( $schema['properties']['post_date'] ) ) {
		    $post_data['post_date'] = $post->post_date;
	    	}
	    	if ( isset( $schema['properties']['post_status'] ) ) {
		    $post_data['post_status'] = $post->post_status;
	    	}
	    	if ( isset( $schema['properties']['comment_count'] ) ) {
		    $post_data['comment_count'] = $post->comment_count;
	    	}

	    	array_push($list, $post_data);
	    }
	    $data['posts'] = $list;
	    $data['found'] = count($list);
	    return rest_ensure_response($data);
    	}

	public function upload_media($request) {

	    $file = $request['file'];
	    $filename = basename($file);

	    $upload_file = wp_upload_bits($filename, null, file_get_contents($file));

	    if (!$upload_file['error']) {
	        $wp_filetype = wp_check_filetype($filename, null );
	        $attachment = array(
	            'post_mime_type' => $wp_filetype['type'],
	            'post_parent' => 0,
	            'post_title' => preg_replace('/\.[^.]+$/', '', $filename),
	            'post_content' => '',
	            'post_status' => 'inherit'
	        );
	        $attachment_id = wp_insert_attachment( $attachment, $upload_file['file'], 0 );
	        if (!is_wp_error($attachment_id)) {
	            require_once(ABSPATH . "wp-admin" . '/includes/image.php');
	            $attachment_data = wp_generate_attachment_metadata( $attachment_id, $upload_file['file'] );
	            wp_update_attachment_metadata( $attachment_id,  $attachment_data );
	        }
	    }

	    return rest_ensure_response($upload_file);
	}

	public function upload_media_multipart($request){
		if(!empty($request->get_file_params()['media_file'])){
			$parent_post_id = 0;
			if(!empty($request['post_id'])){
				$parent_post_id = $request['post_id'];
			}

		    $file_object = $request->get_file_params()['media_file'];
		    $filename = $file_object['name'];
		    if(!empty($request['media_file_name'])){
				$filename = $request['media_file_name'];
			}

		    $upload_file = wp_upload_bits($filename, null, file_get_contents($file_object['tmp_name']));

		    $response_object = array(
		    	"file" => $upload_file['file'],
		    	"url" => $upload_file['url'],
		    	"type" => $upload_file['type'],
		    	"name" => preg_replace('/\.[^.]+$/', '', $filename),
		    	"size" => $file_object['size'],
		    	"id" => $attachment_id
		    );

		    if (!$upload_file['error']) {
		        $attachment = array(
		            'post_mime_type' => $file_object['type'],
		            'post_parent' => $parent_post_id,
		            'post_title' => preg_replace('/\.[^.]+$/', '', $filename),
		            'post_content' => '',
		            'post_status' => 'inherit'
		        );
		        $attachment_id = wp_insert_attachment( $attachment, $upload_file['file'], $parent_post_id );
		        if (!is_wp_error($attachment_id)) {
		            require_once(ABSPATH . "wp-admin" . '/includes/image.php');
		            $attachment_data = wp_generate_attachment_metadata( $attachment_id, $upload_file['file'] );
		            wp_update_attachment_metadata( $attachment_id,  $attachment_data );
		            $response_object['id'] = $attachment_id;
		        }
		        else{
		        	return new WP_Error( 'rest_bad_request', esc_html__( 'Error in file upload', 'zoho-flow' ), array( 'status' => 400 ));
		        }
		    }
		    else{
		    	return new WP_Error( 'rest_bad_request', esc_html__( $upload_file['error'], 'zoho-flow' ), array( 'status' => 400 ));
		    }


		    return rest_ensure_response($response_object);
		}
		else{
			return new WP_Error( 'rest_bad_request', esc_html__( 'Invalid media file.', 'zoho-flow' ), array( 'status' => 400 ) );
		}

	}

	public function remove_media($request){
		$attachment_id = $request['attachment_id'];
	    if(!ctype_digit($attachment_id)){
	        return new WP_Error( 'rest_bad_request', esc_html__( 'The attachment ID is invalid.', 'zoho-flow' ), array( 'status' => 400 ) );
	    }
	    $attachment_data = wp_delete_attachment($attachment_id);
	    if(empty($attachment_data) || $attachment_data == false){
	    	return new WP_Error( 'rest_bad_request', esc_html__( 'Unable to remove attachment' ), array( 'status' => 400 ) );
	    }
	    return rest_ensure_response( $attachment_data);
	}

	public function get_self($request){
	    $user = wp_get_current_user();

	    if(empty($user)){
	        return rest_ensure_response($user);
	    }
	    if(empty($user->roles)){
	        $user->roles = null;
	        $user->caps = null;
	        $user->allcaps = null;
	    }
	    $user->metadata = $this->returnMeta($user->ID, true);
	    return rest_ensure_response($user);
	}

	public function get_user_by( $request ){

	    $login = esc_attr($request['login']);

	    if(isset($login) && filter_var($request['login'], FILTER_VALIDATE_EMAIL)){
	        $user = get_user_by('email', $login);
	    }
	    else if(isset($request['user_id'])){
	        $user_id = $request['user_id'];
	        if(!ctype_digit($user_id)){
	            return new WP_Error( 'rest_bad_request', esc_html__( 'The User ID is invalid.', 'zoho-flow' ), array( 'status' => 400 ) );
	        }
	        $user = get_user_by('id', $user_id);
	    }
	    else if (isset($request['login'])) {
	        $user = get_user_by('login', $request['login']);
	    }
	    if(empty($user)){
	        return rest_ensure_response($user);
	    }
	    if(empty($user->roles)){
	        $user->roles = null;
	        $user->caps = null;
	        $user->allcaps = null;
	    }
	    if(isset($request['user_id'])){
	       $user->metadata = $this->returnMeta($user_id, true);
	    } else {
	        $user->metadata = $this->returnMeta($user->ID, true);
	    }

	    return rest_ensure_response($user);
	}

	public function get_users( $request ){
	    $data = array();
			$users = array();
			$params = $_GET;
			$custom_args = array();
			foreach ($params as $param => $value) {
				if(!empty($value)){
					if(($param == 'role') || ($param == 'role__in') || ($param == 'role__not_in') || ($param == 'meta_key') || ($param == 'meta_value') || ($param == 'capability') || ($param == 'capability__in')
					 || ($param == 'capability__not_in') || ($param == 'include') || ($param == 'exclude') || ($param == 'search_columns') || ($param == 'orderby') || ($param == 'fields') || ($param == 'nicename__in')
						|| ($param == 'nicename__not_in') || ($param == 'login__in') || ($param == 'login__not_in')){
							$custom_args[$param] = explode(',',$value);
						}
						else{
							$custom_args[$param] = $value;
						}
				}
			}
			if(sizeof($custom_args) > 0){
				if(empty($params['number'])){
					$custom_args['number'] = 1000;
				}
				$users = get_users( $custom_args );
			}
			else{
				$most_privilege = array(
					'orderby' => 'ID',
					'order' => 'ASC',
					'role__in' => array( 'administrator','editor', 'author' ),
					'number'=> 500,
					'paged'=> 1,
					'count_total'=> false  );
				$least_privilege = array(
	    		'orderby' => 'ID',
	    		'order' => 'DESC',
	    		'role__not_in' => array( 'administrator','editor', 'author' ),
	    		'number'=> 500,
	    		'paged'=> 1,
	    		'count_total'=> false  );
	    	$users = array_merge(
	    		get_users( $most_privilege ),
	    		get_users( $least_privilege ) );
			}

	    $schema = $this->get_user_schema();

	    foreach($users as $user){
	        if( isset( $schema['properties']['user_id'])){
	            $post_data['user_id'] = $user->ID;
	        }
	        if( isset( $schema['properties']['user_login'])){
	           $post_data['user_login'] = $user->user_login;
	        }
	        if( isset( $schema['properties']['user_email'])){
	            $post_data['user_email'] = $user->user_email;
	        }
	        if( isset( $schema['properties']['user_registered'])){
	            $post_data['user_registered'] = $user->user_registered;
	        }
	        if( isset( $schema['properties']['display_name'])){
	            $post_data['display_name'] = $user->display_name;
	        }
	        if( isset( $schema['properties']['role'])){
	           $post_data['role'] = $user->caps;
	        }
	        if( isset( $schema['properties']['roles'])){
	           $post_data['roles'] = $user->allcaps;
	        }
	        array_push($data, $post_data);
	    }
	    return rest_ensure_response($data);
	}

	public function get_comments( $request ){
	    $data = array();
            $args = array('');
	        $comments = get_comments($args);

	        $schema = $this->get_comment_schema();
	        foreach ($comments as $comment){
	            if( isset( $schema['properties']['comment_id'])){
	               $post_data['comment_id'] =$comment->comment_ID;
	            }
	            if( isset( $schema['properties']['comment_post_id'])){
	                $post_data['comment_post_id']=$comment->comment_post_ID;
	            }
	            if(isset($schema['properties']['comment_author'])){
	                $post_data['comment_author'] =$comment->comment_author;
	            }
	            if(isset($schema['properties']['comment_author_email'])){
	                $post_data['comment_author_email'] = $comment->comment_author_email;
	            }
	            if(isset($schema['properties']['comment_content'])){
	                $post_data['comment_content'] = $comment->comment_content;
	            }
	            if(isset($schema['properties']['comment_date'])){
	                $post_data['comment_date'] = $comment->comment_date;
	            }
	            array_push($data, $post_data);
	        }
	    return rest_ensure_response($data);
	}

	public function create_post($request){
	    $postarr = array(
	        'post_title'   =>  wp_strip_all_tags($request['post_title']),
	        'post_content' =>  wp_strip_all_tags($request['post_content']),
	        'post_status'  =>  $request['post_status'],
	        'post_author'  =>  get_current_user_id(),
	        'post_type'    =>  'post',
	        'post_date'    =>  date( 'Y-m-d H:i:s', time() ),
	        'comment_status'   =>  $request['comment_status'],
	        'ping_status'  =>  $request['ping_status']
	    );

	    $post_id = wp_insert_post( $postarr);
	    wp_set_post_tags($post_id, wp_strip_all_tags($request['tags']), true);
	    wp_set_post_categories($post_id, wp_strip_all_tags($request['category']), false);
	    if(is_wp_error($post_id)){
                //the post is valid
                $errors = $post_id->get_error_messages();
                $error_code = $post_id->get_error_code();
                foreach ($errors as $error) {
                    return new WP_Error( $error_code, esc_html__( $error, 'zoho-flow' ), array('status' => 400) );
                }
            }
	    $request['post_id'] = $post_id;
	    $this->call_webhook_for_post($post_id, $postarr['post_type']);

	    return rest_ensure_response(get_post($post_id));

	}

	public function create_post_insert($request){
	    $postarr = array(
	        'post_title'   =>  $request['post_title'],
	        'post_content' =>  $request['post_content'],
	        'post_title' =>  $request['post_title'],
	        'post_excerpt' =>  $request['post_excerpt'],
	        'post_status'  =>  $request['post_status'],
	        'comment_status'   =>  $request['comment_status'],
	        'ping_status'  =>  $request['ping_status'],
	        'post_name'  =>  $request['post_name'],
	        'post_parent'  =>  $request['post_parent'],
	        'menu_order'  =>  $request['menu_order'],
	        'post_mime_type'  =>  $request['post_mime_type'],
	        'import_id'  =>  $request['import_id'],
	        'ping_status'  =>  $request['ping_status'],
	        'post_category'  =>  $request['post_category'],
	        'tags_input'  =>  $request['tags_input']

	    );
	    if(!empty($request['ID'])){
	    	$postarr['ID'] = $request['ID'];
	    }
			if(!empty($request['post_author'])){
				$postarr['post_author'] = $request['post_author'];
			}
	    else{
	    	$postarr['post_author'] = get_current_user_id();
	    }
	    if(empty($request['post_type'])){
	    	$postarr['post_type'] = $request['post_type'];
	    }
	    else{
	    	$postarr['post_type'] = 'post';
	    }
	    if(!empty($request['post_password'])){
	    	$postarr['post_password'] = $request['post_password'];
	    }
	    if(!empty($request['guid'])){
	    	$postarr['guid'] = $request['guid'];
	    }
	    if(!empty($request['import_id'])){
	    	$postarr['import_id'] = $request['import_id'];
	    }

	    $post_id = wp_insert_post( $postarr, true);

	    if(is_wp_error($post_id)){
                //the post is valid
                $errors = $post_id->get_error_messages();
                $error_code = $post_id->get_error_code();
                foreach ($errors as $error) {
                    return new WP_Error( $error_code, esc_html__( $error, 'zoho-flow' ), array('status' => 400) );
                }
            }
	    $request['post_id'] = $post_id;
	    $this->call_webhook_for_post($post_id, $postarr['post_type']);

	    $post_data = get_post($post_id);
	    $data = $this->update_tags_and_categories($post_id);

	    $post_data->tags = $data['tags'];
	    $post_data->categories = $data['categories'];
	    $post_data->permalink = get_permalink($post_id);

	    return rest_ensure_response($post_data);

	}

	public function update_post($request){
	    $post_id = $request['post_id'];
	    if(!ctype_digit($post_id)){
	        return new WP_Error( 'rest_bad_request', esc_html__( 'The post ID is invalid.', 'zoho-flow' ), array( 'status' => 400 ) );
	    }

	    $post_arr = array(
	        'ID'           =>  $post_id,
	        'post_title'   =>  wp_strip_all_tags($request['post_title']),
	        'post_content' =>  wp_strip_all_tags($request['post_content']),
	        'post_status'  =>  $request['post_status'],
	        'post_author'  =>  $request['post_author'],
	        'post_type'    =>  'post',
	        'post_date'    =>  date( 'Y-m-d H:i:s', time() )
	    );
	    $post_id = wp_update_post($post_arr);
	    wp_set_post_tags($post_id, wp_strip_all_tags($request['tags']), true);
	    wp_set_post_categories($post_id, wp_strip_all_tags($request['category']), true);
	    if (is_wp_error($post_id)) {
	        $errors = $post_id->get_error_messages();
	        $error_code = $post_id->get_error_code();
	        foreach ($errors as $error) {
	            return new WP_Error( $error_code, esc_html__( $error, 'zoho-flow' ) , array('status' => 400));
	        }
	    }
	    $this->call_webhook_for_post($post_id, $post_arr['post_type']);

	    return rest_ensure_response(get_post($post_id));
	}

	public function create_user($request){
	    $userdata = array(
	        'user_login'   =>  $request['user_login'],
	        'user_pass'    =>  $request['user_pass'],
	        'user_email'   =>  $request['user_email'],
	        'last_name'    =>  $request['last_name'],
	        'first_name'   =>  $request['first_name'],
	        'user_registered'  =>  date( 'Y-m-d H:i:s', time()),
	        'role'         =>  $request['role'],
	        'user_url'     =>  $request['user_url'],
	        'description'  =>  $request['description'],
	        'nickname'	   =>  $request['nickname']
	    );
	    $user_id = wp_insert_user( $userdata ) ;
	    $this->update_meta_values($request, $user_id, $userdata);

	    if ( is_wp_error( $user_id ) ) {
	        $errors = $user_id->get_error_messages();
	        $error_code = $user_id->get_error_code();
	        foreach ($errors as $error) {
	            return new WP_Error($error_code, esc_html__( $error, 'zoho-flow' ), array( 'status' => 400 )  );
	        }
	    }
	    return rest_ensure_response(get_user_by('ID', $user_id));
	}

	public function update_user($request){
	    $user_id = $request['user_id'];
	    if(!ctype_digit($user_id)){
	        return new WP_Error( 'rest_bad_request', esc_html__( 'The user ID is invalid.', 'zoho-flow' ), array( 'status' => 400 ) );
	    }
	    $olddata = get_user_by('ID', $user_id);

	    $userdata = array(
	        'ID'           => $request['user_id'],
	        'user_pass'    =>  (isset($request['user_pass']) && !empty($request['user_pass'])) ? $request['user_pass'] : $olddata->user_pass,
	        'user_email'   =>  (isset($request['user_email']) && !empty($request['user_email'])) ? $request['user_email'] : $olddata->user_email,
	        'last_name'    =>  (isset($request['last_name']) && !empty($request['last_name'])) ? $request['last_name'] : $olddata->last_name,
	        'first_name'   =>  (isset($request['first_name']) && !empty($request['first_name'])) ? $request['first_name'] : $olddata->first_name,
	        'user_registered'  =>  date( 'Y-m-d H:i:s', time()),
	        'user_url'     =>  (isset($request['user_url']) && !empty($request['user_url'])) ? $request['user_url'] : $olddata->user_url,
	        'description'  =>  (isset($request['description']) && !empty($request['description'])) ? $request['description'] : $olddata->description,
	        'nickname'     =>  (isset($request['nickname']) && !empty($request['nickname'])) ? $request['nickname'] : $olddata->nickname
	    );

	    $data = wp_update_user( $userdata ) ;
	    if ( is_wp_error( $data ) ) {
	        $errors = $data->get_error_messages();
	        foreach ($errors as $error) {
	            return new WP_Error( 'rest_bad_request', esc_html__( $error, 'zoho-flow' ), array('status' => 400) );
	        }
	    }
	    $user_data = $this->update_meta_values($request, $user_id, $userdata);
	    return rest_ensure_response($user_data);
	}

	public function get_resetpassword_link($request) {
	    $data = array();
	    $user_login = $request['user_login'];
	    if($user_login == "" || empty($user_login)){
	        return new WP_Error( 'rest_bad_request', esc_html__( 'User Login must not be empty.', 'zoho-flow' ), array( 'status' => 400 ) );
	    }

	    $current_userid = get_current_user_id();
	    $user_login = trim( wp_unslash( $user_login ) );
	    $user_data = get_user_by( 'login', $user_login );

	    if(empty($user_data)){
	        return rest_ensure_response($user_data);
	    }

	    if ( ! current_user_can( 'edit_user', $user_data->ID ) || $current_userid === $user_data->ID) {
	        return new WP_Error( 'rest_bad_request', esc_html('Sorry, you are not allowed to edit this user.', 'zoho-flow'), array('status' => 400) );
	    }

	    if ( is_multisite() ) {
	        $site_name = get_network()->site_name;
	    } else {
	        $site_name = wp_specialchars_decode( get_option( 'blogname' ), ENT_QUOTES );
	    }

	    $key = get_password_reset_key( $user_data );
	    $locale = get_user_locale( $user_data );
	    $rplink = network_site_url( "wp-login.php?action=rp&key=$key&login=" . rawurlencode( $user_login ), 'login' ) . '&wp_lang=' . $locale;

	    $data['link'] = $rplink;
	    $data['site'] = $site_name;
	    $data['user_login'] = $user_login;
	    return rest_ensure_response($data);
	}

	public function call_webhook_for_post($post_id, $post_type){
	    $data = get_post($post_id);
	    $termdata = $this->update_tags_and_categories($post_id);
	    $data->tags = $termdata['tags'];
	    $data->categories = $termdata['categories'];
	    $args = array(
	        'post_type'    =>  'posts'
	    );
	    $webhooks = $this->get_webhook_posts($args);
	    foreach ( $webhooks as $webhook ) {
	        $url = $webhook->url;
	        zoho_flow_execute_webhook($url, $data, array());
	    }
	}

	public function get_webhooks($request){
	    $data = array();
	    $post_id = $request['post_id'];
	    if(!ctype_digit($post_id)){
	        return new WP_Error( 'rest_bad_request', esc_html__( 'The post ID is invalid.', 'zoho-flow' ), array( 'status' => 400 ) );
	    }
	    $args = array(
	        'post_id' => $post_id
	    );
	    $webhooks = $this->get_webhook_posts($args);

	    foreach ( $webhooks as $webhook ) {
	        $webhook = array(
	            'plugin_service' => $this->get_service_name(),
	            'id' => $webhook->ID,
	            'form_id' => $post_id,
	            'url' => $webhook->url
	        );
	        array_push($data, $webhook);
	    }

	    return rest_ensure_response( $data );
	}

	public function create_post_comments_webhook($request){
	    $postid = $request['post_id'];
	    $url = esc_url_raw($request['url']);
	    if(!ctype_digit($postid)){
	        return new WP_Error( 'rest_bad_request', esc_html__( 'The post ID is invalid.', 'zoho-flow' ), array( 'status' => 400 ) );
	    }
	    $post_obj = get_post($postid);
	    if(empty($post_obj)){
	        return new WP_Error( 'rest_not_found', esc_html__( 'The post is not found.', 'zoho-flow' ), array( 'status' => 404 ) );
	    }
	    $post_title = $post_obj->post_title;

	    $post_id = $this->create_webhook_post($post_title, array(
	        'post_id' => $postid,
	        'url' => $url
	    ));
	    return rest_ensure_response( array(
	        'plugin_service' => $this->get_service_name(),
	        'id' => $post_id,
	        'post_id' =>$postid,
	        'url' => $url
	    ) );
	}

	public function delete_webhook($request){
	    $webhook_id = $request['webhook_id'];
	    if(!ctype_digit($webhook_id)){
	        return new WP_Error( 'rest_bad_request', esc_html__( 'The post ID is invalid.', 'zoho-flow' ), array( 'status' => 400 ) );
	    }
	    $result = $this->delete_webhook_post($webhook_id);
	    if(is_wp_error($result)){
	        return $result;
	    }
	    return rest_ensure_response(array(
	        'plugin_service' => $this->get_service_name(),
	        'id' => $result->ID
	    ));
	    return rest_ensure_response($result);
	}

	public function get_webhooks_for_post( $request ){

	    $data = array();
	    $args = array(
	        'post_type' => $request['post_type']
	    );
	    $webhooks = $this->get_webhook_posts($args);
	    foreach ( $webhooks as $webhook ) {
	        $webhook = array(
	            'plugin_service' => $this->get_service_name(),
	            'id' => $webhook->ID,
	            'post_type' => $request['post_type'],
	            'url' => $webhook->url
	        );
	        array_push($data, $webhook);
	    }

	    return rest_ensure_response( $data );
	}

	public function create_webhook_for_post( $request ){
	    $post_title = $request['post_type'];
	    $url = esc_url_raw($request['url']);
	    $post_id = $this->create_webhook_post($post_title, array(
	        'post_type' => $request['post_type'],
	        'url' => $url
	    ));

	    return rest_ensure_response( array(
	        'plugin_service' => $this->get_service_name(),
	        'id' => $post_id,
	        'post_type' =>$request['post_type'],
	        'url' => $url
	    ) );
	}

	public function get_comments_webhooks( $request ){

	    $data = array();
	    $args = array(
	        'post_type' => 'comments'
	    );
	    $webhooks = $this->get_webhook_posts($args);

	    foreach ( $webhooks as $webhook ) {
	        $webhook = array(
	            'plugin_service' => $this->get_service_name(),
	            'id' => $webhook->ID,
	            'url' => $webhook->url
	        );
	        array_push($data, $webhook);
	    }

	    return rest_ensure_response( $data );
	}

	public function create_comments_webhooks( $request ) {
	    $post_type ='comments';
	    $url = esc_url_raw($request['url']);
	    $post_id = $this->create_webhook_post($post_type, array(
	    	'post_type' => $$post_type,
	        'url' => $url
	    ));

	    return rest_ensure_response( array(
	        'plugin_service' => $this->get_service_name(),
	        'id' => $post_id,
	        'post_type' =>$request['post_type'],
	        'url' => $url
	    ) );
	}

	public function wp_core_register_post_type(){
	    if(empty(post_type_exists('users'))){
    	    $args = array(
    	        'public'    => true,
    	        'label'     => __( 'Users', 'textdomain' ),
    	        'capability_type' => 'users'
    	    );
    	    register_post_type( 'users', $args );
	    }
	}

	public function process_comment_post($comment_id,  $commentdata_comment_approved, $commentdata){

	    $args = array(
	        'post_id' => $commentdata['comment_post_ID']
	    );
	    $commentdata['comment_id'] = $comment_id;

	    $webhooks = $this->get_webhook_posts($args);
	    if(empty($webhooks)){
	        $args_array = array(
	            'post_type' => 'comments'
	        );
	        $webhooks = $this->get_webhook_posts($args_array);
	    }
	    foreach ( $webhooks as $webhook ) {
	        $url = $webhook->url;
	        zoho_flow_execute_webhook($url, $commentdata, array());
	    }
	}

	public function process_spammed_comment($comment_id, $comment){

	    $args = array(
	        'post_id' => $comment->comment_post_ID
	    );

	    $webhooks = $this->get_webhook_posts($args);
	    foreach ( $webhooks as $webhook ) {
	        $url = $webhook->url;
	        zoho_flow_execute_webhook($url, $comment, array());
	    }
	}

	public function process_edit_comment($comment_ID, $comment){

	    $comment['commment_id'] = $comment_ID;
	    $args = array(
	        'post_id'=> $comment['comment_post_ID']
	    );

	    $webhooks = $this->get_webhook_posts($args);
	    foreach ( $webhooks as $webhook ) {
	        $url = $webhook->url;
	        zoho_flow_execute_webhook($url, $comment, array());
	    }
	}

	public function process_set_comment_status($comment_id, $comment_status){

	    $comment = get_comment($comment_id);
	    $comment->comment_status = $comment_status;
	    $args = array(
	        'post_id'=> $comment->comment_post_ID
	    );

	    $webhooks = $this->get_webhook_posts($args);
	    foreach ( $webhooks as $webhook ) {
	        $url = $webhook->url;
	        zoho_flow_execute_webhook($url, $comment, array());
	    }
	}

	public function process_user_register($user_id){
	    $user = get_user_by('ID', $user_id);
	    $args = array(
	        'post_type'=> 'users'
	    );

	    $webhooks = $this->get_webhook_posts($args);
	    foreach ( $webhooks as $webhook ) {
	        $url = $webhook->url;
	        zoho_flow_execute_webhook($url, $user, array());
	    }
	}

	public function process_profile_update($user_id, $old_user_data){
	    $user = get_user_by('ID', $user_id);
	    $times = did_action('profile_update');
	    if($times ===1){
	    	    $args = array(
	    	        'post_type'=> 'users'
	    	    );

	    	    $webhooks = $this->get_webhook_posts($args);
	    	    foreach ( $webhooks as $webhook ) {
	    	        $url = $webhook->url;
	    	        zoho_flow_execute_webhook($url, $user, array());
	    	    }
	    	    return rest_ensure_response($user);
	    }
	}

	public function process_save_post($post_id, $post , $update){

	    $post_status = $post->post_status;
	    $post_type = $post->post_type;
	    if (wp_is_post_revision($post_id)) {
	        return;
	    }
	    $times = did_action('save_post');
	    if($times === 1 && $post_type ==='post' && $post_status==='publish'){
    		$args = array(
    		    'post_type' => 'posts'
    		);
    		$webhooks = $this->get_webhook_posts($args);
    		foreach($webhooks as $webhook){
    		   $url = $webhook->url;
    		   zoho_flow_execute_webhook($url, $post, array());
    		}
	    }
	}

	public function process_wp_login($user_login, $user){
	    $args = array(
	        'post_type'=> 'user_login'
	    );

	    $webhooks = $this->get_webhook_posts($args);
	    foreach ( $webhooks as $webhook ) {
	        $url = $webhook->url;
	        zoho_flow_execute_webhook($url, $user, array());
	    }
	}

	public function get_post_schema() {
	    $schema = array(
	        '$schema'              => 'http://json-schema.org/draft-04/schema#',
	        'title'                => 'posts',
	        'type'                 => 'post',
	        'properties'           => array(
	            'post_id' => array(
	                'description'  => esc_html__( 'Post Id', 'zoho-flow' ),
	                'type'         => 'integer',
	                'context'      => array('view'),
	            ),
	            'post_title' => array(
	                'description'  => esc_html__( 'Post Title', 'zoho-flow' ),
	                'type'         => 'string',
	                'context'      => array( 'view', 'edit'),
	                'readonly'     => true,
	            ),
	            'post_content' => array(
	                'description'  => esc_html__( 'Content of a Post', 'zoho-flow' ),
	                'type'         => 'string',
	                'context'      => array( 'view', 'edit'),
	            ),
	            'post_date' => array(
	                'description' => esc_html__("Created Date of Post", "zoho-flow"),
	                'type'        => 'date',
	                'context'     => array('view'),
	                'readonly'    => true,
	            ),
	            'post_status' => array(
	                'description' => esc_html__( 'Post status', 'zoho-flow' ),
	                'type'        => 'string',
	                'context'     => array('view'),
	            ),
	            'comment_count' => array(
	                'description' => esc_html__('Comment count', 'zoho-flow'),
	                'type'        => 'integer',
	                'context'     => array('view'),
	            ),
	        ),
	    );

	    return $schema;
	}

	public function get_user_schema() {
	    $schema = array(
	        '$schema'              => 'http://json-schema.org/draft-04/schema#',
	        'title'                => 'users',
	        'type'                 => 'user',
	        'properties'           => array(
	            'user_id' => array(
	                'description'  => esc_html__( 'User Id', 'zoho-flow' ),
	                'type'         => 'integer',
	                'context'      => array('view'),
	            ),
	            'user_login' => array(
	                'description'  => esc_html__( 'User login', 'zoho-flow' ),
	                'type'         => 'string',
	                'context'      => array( 'view', 'edit'),
	                'readonly'     => true,
	            ),
	            'user_email' => array(
	                'description'  => esc_html__( 'User email', 'zoho-flow' ),
	                'type'         => 'string',
	                'context'      => array( 'view', 'edit'),
	            ),
	            'user_registered' => array(
	                'description' => esc_html__("User registered date", "zoho-flow"),
	                'type'        => 'date',
	                'context'     => array('view'),
	                'readonly'    => true,
	            ),
	            'display_name' => array(
	                'description' => esc_html__( 'Display Name', 'zoho-flow' ),
	                'type'        => 'string',
	                'context'     => array('view'),
	            ),
	            'role' => array(
	                'description' => esc_html__('Comment count', 'zoho-flow'),
	                'type'        => 'array',
	                'context'     => array('view'),
	            ),
	            'roles' => array(
	                'description' => esc_html__('User role', 'zoho-flow'),
	                'type'        => 'array',
	                'context'     => array('view'),
	            ),
	        ),
	    );

	    return $schema;
	}

	public function get_comment_schema() {
	    $schema = array(
	        '$schema'              => 'http://json-schema.org/draft-04/schema#',
	        'title'                => 'posts',
	        'type'                 => 'post',
	        'properties'           => array(
	            'comment_id' => array(
	                'description'  => esc_html__( 'Comment Id', 'zoho-flow' ),
	                'type'         => 'integer',
	                'context'      => array('view'),
	            ),
	            'comment_post_id' => array(
	                'description'  => esc_html__( 'Comment Post Id', 'zoho-flow' ),
	                'type'         => 'integer',
	                'context'      => array( 'view'),
	                'readonly'     => true,
	            ),
	            'comment_author' => array(
	                'description'  => esc_html__( 'Author of the comment', 'zoho-flow' ),
	                'type'         => 'string',
	                'context'      => array( 'view', 'edit'),
	            ),
	            'comment_author_email' => array(
	                'description' => esc_html__("Email of the comment author", "zoho-flow"),
	                'type'        => 'string',
	                'context'     => array('view'),
	                'readonly'    => true,
	            ),
	            'comment_content' => array(
	                'description' => esc_html__( 'Comment content', 'zoho-flow' ),
	                'type'        => 'string',
	                'context'     => array('view', 'edit'),
	            ),
	            'comment_date' => array(
	                'description' => esc_html__('Commented date', 'zoho-flow'),
	                'type'        => 'date',
	                'context'     => array('view'),
	            ),
	        ),
	    );

	    return $schema;
	}

	public function  get_userinfo_meta($request){
	    $metakeys = $this->returnMeta($request['user_id'], FALSE);
	    return rest_ensure_response($metakeys);
	}

	private function update_meta_values($request, $user_id, $userdata) {
	    $dataarr = array();
	    foreach ($request->get_params() as $key => $value){
	        update_user_meta($user_id, $key, $request[$key]);
	        if(isset($request[$key])){
	            $value1 = get_user_meta($user_id, $key, true);
	            $dataarr[$key] = $value1;
	        }
	    }

	    $u = new WP_User( $user_id);
	    $role = $request['role'];
	    if(isset($role) && !empty($role)) {
	        $role= trim($role);
	        $role = str_replace(" ", "_", $role);
	        $role = strtolower($role);
	        $u->set_role($role);
	    }
	    return $dataarr;
	}

	public function get_post_types(){
	    $posttypes = get_post_types();
	    $result = array();
	    foreach ($posttypes as $posttype){
	        array_push($result, $posttype);
	    }
	    return rest_ensure_response($result);
	}

	public function get_categories(){
	    $data = array();
	    $list = array();
	    $args = array('taxonomy' => 'category', 'orderby' => 'name', 'hide_empty' => false );
	    $categories = get_categories($args);
	    foreach( array_keys( $categories ) as $key){
	        array_push($list, $categories[$key]);
	    }
	    $data['found'] = count($list);
	    $data['categories'] = $list;
	    return rest_ensure_response($data);
	}

	public function get_tags() {
	    $data = array();
	    $args = array('taxonomy' => 'post_tag', 'orderby' => 'name', 'hide_empty' => false );
	    $tags = get_tags($args);
	    $data['found'] = count($tags);
	    $data['tags'] = $tags;
	    return rest_ensure_response($data);
	}

	private function returnMeta($id, $returnKeyValue){

	    $meta = get_user_meta($id);
	    $usermeta = array();
	    $metadata = array();
	    foreach ($meta as $key => $value){
	        $data = array(
	            'meta_key' => $key,
	        );
	        $metadata[$key] = $value[0];
	        array_push($usermeta, $data);
	    }
	    if($returnKeyValue){
	        return $metadata ;
	    } else {
	        return rest_ensure_response($usermeta);
	    }
	}
	public function get_system_info(){
		return rest_ensure_response( parent::get_system_info() );
	}
}
