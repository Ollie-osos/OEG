<?php
/*
   Plugin Name:Zoho Campaigns
   Plugin URI:https://help.zoho.com/portal/kb/articles/zoho-campaigns-plugin-for-wordpress-version-2
   Version:2.0.6
   Author:Zoho Campaigns
   Author URI:https://www.zoho.com/campaigns/
   Description:With the Zoho Campaigns plugin, convert your website visitors into leads by embedding signup forms on your Wordpress pages, sync your WooCommerce store's details, and conveniently set up targeted e-commerce campaigns using workflows.Â
   WC requires at least: 3.7.1
   WC tested up to: 6.4.1
*/
/*
    Copyright (c) 2019, ZOHO CORPORATION
    All rights reserved.

    Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// Prevent direct accesss
defined( 'ABSPATH' ) or exit;

define( 'ZC4WP_VERSION', '2.0.6' );
define( 'ZC4WP__MINIMUM_WP_VERSION', '5.0' );
define( 'ZC4WP__PLUGIN_DIR', plugin_dir_path( __FILE__ ) );
define( 'ZC4WP__ACCOUNTS_URL', 'https://accounts.zoho.' );
define( 'ZC4WP__CAMPAIGN_URL', 'https://campaigns.zoho.' );

function zcwc_registration_save( $user_id ) {
    if(isset($_POST['zc_optin_checkbox']) && get_user_meta($user_id, 'zcwc_newsletter_subscription', true) == '')
     {
        add_user_meta( $user_id, 'zcwc_newsletter_subscription', true );
     }
  }
require_once( ZC4WP__PLUGIN_DIR . 'includes/class.zcwc.php' );
add_action( 'init', array( 'ZohoCampaign', 'zcwc_init' ) );
add_action( 'user_register', 'zcwc_registration_save', 10, 1 );
add_action( 'profile_update', 'zcwc_registration_save', 10, 1 );

register_activation_hook( __FILE__, array('ZohoCampaign', 'zcwc_plugin_activation'));
register_deactivation_hook( __FILE__, array('ZohoCampaign', 'zcwc_plugin_deactivation'));

if ( is_admin() ) {
  require_once( ZC4WP__PLUGIN_DIR . 'includes/admin/class.zcwc-admin.php' );
  add_action( 'init', array( 'ZohoCampaign_Admin', 'zcwc_init' ) );
}
?>
