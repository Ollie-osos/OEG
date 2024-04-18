<?php

get_header(); 
$start_date = get_field('start_date');
$end_date = get_field('end_date');
$event_type = get_field('event_type');
$access = get_field('access');
$address = get_field('address');
$additional_date = get_field('additional_date');
$opening_times = get_field('opening_times');
$ticketing = get_field('ticketing');
$gallery = get_field('gallery');

$labels = array_column($event_type, 'label');
$implodeLabels = implode(', ', $labels);

print_r($access);

if( $access ): 
   // Loop through each item using a foreach loop
   $access_icons = '';
    foreach ($access as $item) {
        // Use a switch-case statement to perform different actions based on the value of $item
        switch ($item) {
            case "wheelchair":
                $access_icons .= " <span class='access_icon icon_wheelchair'></span>";
                break;
            case "toilets":
                $access_icons .= " <span class='access_icon icon_toilets'>&nbsp;</span>";
                break;
            case "accessible-toilet":
                $access_icons .= " <span class='access_icon icon_accessible-toilet'>&nbsp;</span>";
                break;
            case "gender-neutral":
                $access_icons .= " <span class='access_icon icon_gender-neutral'>&nbsp;</span>";
                break;
            case "quiet-hours":
                $access_icons .= " <span class='access_icon icon_quiet-hours'>&nbsp;</span>";
                break;
            case "hearing-loop":
                $access_icons .= " <span class='access_icon icon_hearing-loop'>&nbsp;</span>";
                break;
            case "baby-changing":
                $access_icons .= " <span class='access_icon icon_baby-changing'>&nbsp;</span>";
                break;
            case "refreshments":
                $access_icons .= " <span class='access_icon icon_refreshments'>&nbsp;</span>";
                break;
            case "parking":
                $access_icons .= " <span class='access_icon icon_parking'>&nbsp;</span>";
                break;
            case "disabled-parking":
                $access_icons .= " <span class='access_icon icon_disabled-parking'>&nbsp;</span>";
                break;
        
            default:
                // $access_icons .= '';
                break;
        }
    }
endif; 
?>

<div class="page">
    <section class="ev_hero">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-4 col-lg-5 page-sidebar">
                    <div class="mobile-hero u-none-md">
                        <img src="<?php get_the_post_thumbnail_url();?>" alt="Hero image">
                    </div>
                    <div class="ev_title"> <h1><?php the_title(); ?></h1></div>
                    <div class="ev_date"><?php echo $start_date .' - '. $end_date; ?></div>
                    <div class="ev_type">
                        <p><?php  echo $implodeLabels; ?></p>
                    </div>
                    <div class="ev_address">
                        <h5>Address:</h5>
                        <p><?php echo $address; ?></p>
                        <?php print_r($access); ?>
                    </div>
                    <div class="ev_additional_date">
                        <h5>Date:</h5>
                        <p><?php echo $additional_date; ?></p>
                    </div>
                    <div class="ev_opening_times">
                        <h5>Open:</h5>
                        <p><?php echo $opening_times; ?></p>
                    </div>
                    <div class="ev_ticketing">
                        <h5>Ticketing:</h5>
                        <p><?php echo $ticketing; ?></p>
                    </div>
                    <div class="ev_access">
                        <h5>Access</h5>
                        <?php echo $access_icons; ?>
                        <a href="/access">Further access information</a>
                    </div>
                    <div class="ev_access">
                        <h5>Share</h5>
                        <div class="social-share">
                            <img onclick="shareOnWhatsApp()" src="<?php echo get_template_directory_uri();?>/dist/img/share-whatsapp.svg" alt="share icons"/>
                            <img onclick="shareOnFacebook()" src="<?php echo get_template_directory_uri();?>/dist/img/share-facebook.svg" alt="share icons"/>
                            <img onclick="shareOnTwitter()" src="<?php echo get_template_directory_uri();?>/dist/img/share-twitter.svg" alt="share icons"/>
                            <img onclick="shareByEmail()" src="<?php echo get_template_directory_uri();?>/dist/img/share-email.svg" alt="share icons"/>
                        </div>
                        
                    </div>

                </div>
                <div class="col-sm-12 col-md-8 col-lg-7 page-content">
                    <div class="desktop-hero u-none-sm">
                        <img src="<?php get_the_post_thumbnail_url();?>" alt="Hero image">
                    </div>
                    <div class="ev_content">
                        <?php the_content(); ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <?php get_template_part( 'template-parts/related-events'); ?>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'pv_' )); ?>
</div>

<script>

function shareOnWhatsApp() {
    var pageUrl = encodeURIComponent(window.location.href);
    var whatsappUrl = "https://api.whatsapp.com/send?text=" + pageUrl;
    window.open(whatsappUrl, "_blank");
}

function shareOnFacebook() {
    var pageUrl = encodeURIComponent(window.location.href);
    var facebookUrl = "https://www.facebook.com/sharer/sharer.php?u=" + pageUrl;
    window.open(facebookUrl, "_blank");
}

function shareOnTwitter() {
    var pageUrl = encodeURIComponent(window.location.href);
    var twitterUrl = "https://twitter.com/intent/tweet?url=" + pageUrl;
    window.open(twitterUrl, "_blank");
}

function shareByEmail() {
    var pageUrl = encodeURIComponent(window.location.href);
    var emailSubject = "Check out this page on Open Eye Gallery!";
    var emailBody = "I found this page and wanted to share it with you: " + window.location.href;
    var emailUrl = "mailto:?subject=" + emailSubject + "&body=" + emailBody;
    window.location.href = emailUrl;
}
</script>

<?php get_footer();

