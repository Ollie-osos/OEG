<?php

/**
 * The template for displaying the header
 *
 * Displays all of the head element and everything up until the "container" div.
 *
 */

// Get ACF vars from options
// if($args['page_colour']){
//   $page_colour = 'page-colour_' . $args['page_colour'];
// }else{
//   $page_colour = 'page-colour_pink';
// }
$current_day = strtolower(date('l')); // Get the lowercase name of the current day, e.g., 'monday'

// Get the opening time for the current day from ACF
$opening_time = get_field($current_day, 'option');
$closed = get_field('closed', 'option');

if ($opening_time && $closed == false) {
  $open_today = '<h4>Open today:<br>' . $opening_time['time'];
  $entry_fee = $opening_time['entry'];
} else {
  $open_today = "<h4 class='red-text'>Gallery<br>Closed";
  $entry_fee = "";
}

$youtube_url = get_field('youtube', 'option');
$instagram_url = get_field('instagram', 'option');
$twitter_url = get_field('twitter', 'option');
$facebook_url = get_field('facebook', 'option');

?>
<!doctype html>
<html class="no-js" <?php language_attributes(); ?>>

<head>
  <meta charset="<?php bloginfo('charset'); ?>" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel='dns-prefetch' href='//polyfill.io' />
  <link rel='dns-prefetch' href='//fonts.googleapis.com' />
  <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCDFl4uZVDXhAA0gmn4gDLjVMIrxyRn2lc&callback=console.debug&libraries=maps,marker&v=beta"></script>
  <?php wp_head(); ?>
</head>

<body <?php //body_class($page_colour); 
      ?>>


  <header class="header u-unselectable">
    <div class="container">
      <div class="header-top">
        <div class="header-brand">
          <div class="nav-item no-hover nav-logo"><a href="<?php echo get_home_url(); ?>"><img src="<?php echo get_template_directory_uri(); ?>/dist/img/logo-black.svg" alt="logo" /></a></div>
          <div class="nav-item blue-text uppercase nav-opening"><?php echo $open_today; ?><br><?php echo $entry_fee; ?> </h4>
          </div>
          <div class="right-links pt-5">
            <div class="u-flex">
              <div class="nav-item top-links">
                <div class="top-link"><a class="btn btn-primary" href="/events">What's On</a></div>
                <div class="top-link"><a class="btn btn-primary" href="/plan-your-visit">Plan your Visit</a></div>
                <div class="top-link"><a class="btn btn-primary" href="/donate">Donate</a></div>
              </div>
              <div class="nav-item nav-btn" id="header-btn"><a class="btn btn-blue">
                  <div id="close-menu-text" style="display: none;">Close &nbsp;</div>MENU
                </a></div>
            </div>
            <div class="u-flex u-justify-flex-end pt-5 u-items-center show-desktop" id="feature-links">
              <div class="social-container">
                <?php if ($youtube_url) {
                  echo '<a aria-label="youtube link" title="Youtube" target="_blank" href="' . $youtube_url . '"><span class="icon"><i class="fab fa-youtube"></i></span></a>';
                } ?>
                <?php if ($facebook_url) {
                  echo '<a aria-label="facebook link" title="Facebook" target="_blank" href="' . $facebook_url . '"><span class="icon"><i class="fab fa-facebook"></i></span></a>';
                } ?>
                <?php if ($twitter_url) {
                  echo '<a aria-label="twitter link" title="Twitter" target="_blank" href="' . $twitter_url . '"><span class="icon"><i class="fa-brands fa-x-twitter"></i></span></a>';
                } ?>
                <?php if ($instagram_url) {
                  echo '<a aria-label="instagram link" title="Instagram" target="_blank" href="' . $instagram_url . '"><span class="icon"><i class="fab fa-instagram"></i></span></a>';
                } ?>
              </div>
              <div id="accesibility">
                <div id="aa-image">
                  <img title="Accessibility options" class="toggle-aa hover-state" src="<?php echo get_template_directory_uri(); ?>/dist/img/accessibility.svg" alt="logo" style="width:26px;" />&nbsp;&nbsp;
                </div>
                <div id="aa-content" style="display:none;">
                  <div class="u-flex u-items-center">
                    <div class="header-text">Text Size: &nbsp;</div>
                    <span class="hover-state" onclick="increaseFontSize()" style="font-size: 35px; font-weight: bold">+&nbsp;</span>
                    <span class="hover-state" onclick="decreaseFontSize()" style="font-size: 35px; font-weight: bold; top: -3px; position: relative;">- </span>
                    <div class="header-text">&nbsp;&nbsp;&nbsp; Contrast: &nbsp;</div>
                    <span class="hover-state contrast-btn"><img src="<?php echo get_template_directory_uri(); ?>/dist/img/contrast.svg" style="width:26px;" alt="high contrast" /></span>
                    <span class="hover-state close toggle-aa">&nbsp;&nbsp;<img src="<?php echo get_template_directory_uri(); ?>/dist/img/close.svg" style="width:26px;" alt="close" />&nbsp;&nbsp;</span>
                  </div>
                </div>
              </div>
              <div id="search-nav">
                <div id="search-image">
                  <img title="Search" class="toggle-search hover-state" src="<?php echo get_template_directory_uri(); ?>/dist/img/search-icon.svg" alt="logo" style="width:26px;" />&nbsp;&nbsp;
                </div>
                <div id="search-content" style="display:none;">
                  <div class="u-flex u-items-center">
                    <?php echo get_search_form(); ?>
                    <span class="hover-state close toggle-search">&nbsp;&nbsp;<img src="<?php echo get_template_directory_uri(); ?>/dist/img/close.svg" style="width:26px;" alt="close" />&nbsp;&nbsp;</span>
                  </div>
                </div>
              </div>

            </div>

          </div>
        </div>
        <div class="header-nav header-bottom" id="header-menu">
          <?php foundationpress_main_nav(); ?>
          <div class="u-flex u-justify-flex-end pt-5 u-items-center show-mobile" id="feature-links">
            <div id="accesibility-m">
              <div id="aa-image-m">
                <img title="Accessibility options" class="toggle-aa-m hover-state" src="<?php echo get_template_directory_uri(); ?>/dist/img/accessibility.svg" alt="logo" style="width:26px;" />&nbsp;&nbsp;
              </div>
              <div id="aa-content-m" style="display:none;">
                <div class="u-flex u-items-center">
                  <div class="header-text">Text Size: &nbsp;</div>
                  <span class="hover-state" onclick="increaseFontSize()" style="font-size: 35px; font-weight: bold">+&nbsp;</span>
                  <span class="hover-state" onclick="decreaseFontSize()" style="font-size: 35px; font-weight: bold; top: -3px; position: relative;">- </span>
                  <div class="header-text">&nbsp;&nbsp;&nbsp; Contrast: &nbsp;</div>
                  <span class="hover-state contrast-btn"><img src="<?php echo get_template_directory_uri(); ?>/dist/img/contrast.svg" style="width:26px;" alt="high contrast" /></span>
                  <span class="hover-state close toggle-aa-m">&nbsp;&nbsp;<img src="<?php echo get_template_directory_uri(); ?>/dist/img/close.svg" style="width:26px;" alt="close" />&nbsp;&nbsp;</span>
                </div>
              </div>
            </div>
            <div id="search-nav-m">
              <div id="search-image-m">
                <img title="Search" class="toggle-search-m hover-state" src="<?php echo get_template_directory_uri(); ?>/dist/img/search-icon.svg" alt="logo" style="width:26px;" />&nbsp;&nbsp;
              </div>
              <div id="search-content-m" style="display:none;">
                <div class="u-flex u-items-center">
                  <?php echo get_search_form(); ?>
                  <span class="hover-state close toggle-search-m">&nbsp;&nbsp;<img src="<?php echo get_template_directory_uri(); ?>/dist/img/close.svg" style="width:26px;" alt="close" />&nbsp;&nbsp;</span>
                </div>
              </div>
            </div>

          </div>
          <div class="u-flex u-justify-flex-end u-items-center show-mobile" id="feature-links">
            <div class="social-container pr-0">
              <?php if ($youtube_url) {
                echo '<a aria-label="youtube link" title="Youtube" target="_blank" href="' . $youtube_url . '"><span class="icon"><i class="fab fa-youtube"></i></span></a>';
              } ?>
              <?php if ($facebook_url) {
                echo '<a aria-label="facebook link" title="Facebook" target="_blank" href="' . $facebook_url . '"><span class="icon"><i class="fab fa-facebook"></i></span></a>';
              } ?>
              <?php if ($twitter_url) {
                echo '<a aria-label="twitter link" title="Twitter" target="_blank" href="' . $twitter_url . '"><span class="icon"><i class="fa-brands fa-x-twitter"></i></span></a>';
              } ?>
              <?php if ($instagram_url) {
                echo '<a aria-label="instagram link" title="Instagram" target="_blank" href="' . $instagram_url . '"><span class="icon"><i class="fab fa-instagram"></i></span></a>';
              } ?>
            </div>
          </div>

        </div>
      </div>
    </div>
    </div>
    </div>
  </header>


  <script>
    $(function() {
      var fontSize = $('p').css('font-size');
      console.log(parseInt(fontSize));
    });

    function increaseFontSize() {
      var currentFontSize = parseInt($('p').css('font-size'));
      var currentLineHeight = parseInt($('p').css('line-height'));
      $('p').css('font-size', (currentFontSize + 4) + "px");
      $('p').css('line-height', (currentLineHeight + 8) + "px");
      sessionStorage.setItem('fontSize', currentFontSize);
      sessionStorage.setItem('lineHeight', currentLineHeight);

      var myVariable = sessionStorage.getItem('lineHeight');
      console.log('Session variable:', myVariable);
    }

    function decreaseFontSize() {
      var currentFontSize = parseInt($('p').css('font-size'));
      var currentLineHeight = parseInt($('p').css('line-height'));
      $('p').css('font-size', (currentFontSize - 4) + "px");
      $('p').css('line-height', (currentLineHeight - 4) + "px");
      sessionStorage.setItem('fontSize', currentFontSize);
      sessionStorage.setItem('lineHeight', currentLineHeight);
    }
  </script>