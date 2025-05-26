<?php

get_header(); 
$end_date = (get_field('end_date') != '') ? DateTime::createFromFormat('Ymd', get_field('end_date'))->format('d M Y') : ''; 
$start_date = (get_field('start_date') != '') ? DateTime::createFromFormat('Ymd', get_field('start_date'))->format('d M Y') : ''; 
$display_date = (get_field('start_date') == get_field('end_date')) ? $start_date : $start_date .' - '. $end_date;
$event_type = get_field('event_type');
$access = get_field('access');
$address = get_field('address');
$additional_date = get_field('additional_date');
$opening_times = get_field('opening_times');
$ticketing = get_field('ticketing');
$gallery = get_field('gallery');

$labels = array_column($event_type, 'label');
$implodeLabels = implode(', ', $labels);


if( $access ){
   // Loop through each item using a foreach loop
   $access_icons = '';
    foreach ($access as $item) {
        // Use a switch-case statement to perform different actions based on the value of $item
        switch ($item) {
            case "wheelchair":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-ga.png" alt="access icon"></div>';
                break;
            case "toilets":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-t.png" alt="access icon"></div>';
                break;
            case "accessible-toilet":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-at.png" alt="access icon"></div>';
                break;
            case "gender-neutral":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-gn.png" alt="access icon"></div>';
                break;
            case "quiet-hours":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-qh.png" alt="access icon"></div>';
                break;
            case "hearing-loop":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-hl.png" alt="access icon"></div>';
                break;
            case "baby-changing":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-bc.png" alt="access icon"></div>';
                break;
            case "refreshments":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-r.png" alt="access icon"></div>';
                break;
            case "parking":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-p.png" alt="access icon"></div>';
                break;
            case "disabled-parking":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-dp.png" alt="access icon"></div>';
                break;
            case "good-access":
                $access_icons .=  '<div class="img"><img src="'. get_template_directory_uri().'/dist/img/access-ga.png" alt="access icon"></div>';
                break;
        
            default:
                // $access_icons .= '';
                break;
        }
    }
} else {
    $access_icons = '';
}

?>

<div class="page">
    <section class="ev_hero">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-5 col-lg-4 page-sidebar">
                    <div class="show-mobile">
                        <img src="<?php echo get_the_post_thumbnail_url();?>" alt="Hero image">
                    </div>
                    <div class="ev ev_title"><h1><?php the_title(); ?></h1></div>
                    <div class="ev ev_date"><h3 class="red-text"><?php echo $display_date; ?></h3></div>
                    <div class="ev ev_type">
                        <h3 class="blue-text"><?php  echo $implodeLabels; ?></h3>
                        <br>
                    </div>

                    <section class="border-bottom show-mobile no-space">
                        <div class="container">&nbsp;</div>
                    </section>

                    <div class="show-desktop event-info">

                        <?php if($address){ ?>
                            <div class="ev ev_address">
                                <h4>Address:</h4>
                                <p><?php echo $address; ?></p>
                            </div>
                        <?php } ?>
                        <?php if($additional_date){ ?>
                            <div class="ev ev_additional_date">
                                <h4>Date:</h4>
                                <p><?php echo $additional_date; ?></p>
                            </div>
                        <?php } ?>
                        <?php if($opening_times){ ?>
                            <div class="ev ev_opening_times">
                                <h4>Open:</h4>
                                <p><?php echo $opening_times; ?></p>
                            </div>
                        <?php } ?>
                        <?php if($ticketing){ ?>
                            <div class="ev ev_ticketing">
                                <h4>Ticketing:</h4>
                                <p><a href="<?php echo $ticketing['url']; ?>"><?php echo $ticketing['title']; ?></a></p>
                            </div>
                        <?php } ?>
                        <?php if($access_icons != '' ){ ?>
                            <div class="ev ev_access">
                                <h4>Access</h4>
                                <div class="access_options">
                                    <?php echo $access_icons; ?>
                                </div>
                                <p class="small"><a href="/access">Further access information</a></p>
                            </div>
                        <?php } ?>
                        <div class="ev ev_access">
                            <h4>Share</h4>
                            <div class="social-share">
                                <img onclick="shareOnWhatsApp()" src="<?php echo get_template_directory_uri();?>/dist/img/share-whatsapp.svg" alt="share icons"/>
                                <img onclick="shareOnFacebook()" src="<?php echo get_template_directory_uri();?>/dist/img/share-facebook.svg" alt="share icons"/>
                                <img onclick="shareOnTwitter()" src="<?php echo get_template_directory_uri();?>/dist/img/share-twitter.svg" alt="share icons"/>
                                <img onclick="shareByEmail()" src="<?php echo get_template_directory_uri();?>/dist/img/share-email.svg" alt="share icons"/>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-7 col-lg-8 page-content">
                    <div class="show-desktop">
                        <?php if(get_the_post_thumbnail_url()){ ?>
                        <img src="<?php echo get_the_post_thumbnail_url();?>" alt="Event image">
                        <?php } ?>
                    </div>
                    <div class="ev_content">
                        <?php the_content(); ?>
                    </div>
                    <section class="border-bottom show-mobile">
                        <div class="container">&nbsp;</div>
                    </section>
                    <div class="show-mobile event-info">
                        <?php if($address){ ?>
                            <div class="ev ev_address">
                                <h4>Address:</h4>
                                <p><?php echo $address; ?></p>
                            </div>
                        <?php } ?>
                        <?php if($additional_date){ ?>
                            <div class="ev ev_additional_date">
                                <h4>Date:</h4>
                                <p><?php echo $additional_date; ?></p>
                            </div>
                        <?php } ?>
                        <?php if($opening_times){ ?>
                            <div class="ev ev_opening_times">
                                <h4>Open:</h4>
                                <p><?php echo $opening_times; ?></p>
                            </div>
                        <?php } ?>
                        <?php if($ticketing){ ?>
                            <div class="ev ev_ticketing">
                                <h4>Ticketing:</h4>
                                <p><a href="<?php echo $ticketing['url']; ?>"><?php echo $ticketing['title']; ?></a></p>
                            </div>
                        <?php } ?>
                        <?php if($access_icons != '' ){ ?>
                            <div class="ev ev_access">
                                <h4>Access</h4>
                                <div class="access_options">
                                    <?php echo $access_icons; ?>
                                </div>
                                <p class="small"><a href="/access">Further access information</a></p>
                            </div>
                        <?php } ?>
                        <div class="ev ev_access">
                            <h4>Share</h4>
                            <div class="social-share">
                                <img onclick="shareOnWhatsApp()" src="<?php echo get_template_directory_uri();?>/dist/img/share-whatsapp.svg" alt="share icons"/>
                                <img onclick="shareOnFacebook()" src="<?php echo get_template_directory_uri();?>/dist/img/share-facebook.svg" alt="share icons"/>
                                <img onclick="shareOnTwitter()" src="<?php echo get_template_directory_uri();?>/dist/img/share-twitter.svg" alt="share icons"/>
                                <img onclick="shareByEmail()" src="<?php echo get_template_directory_uri();?>/dist/img/share-email.svg" alt="share icons"/>
                            </div>
                            
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php get_template_part( 'template-parts/gallery'); ?>
    <?php get_template_part( 'template-parts/related-events'); ?>
    <?php get_template_part( 'template-parts/divide'); ?>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'pv_', 'gallery' => false )); ?>
    <?php get_template_part( 'template-parts/mailing-list'); ?>
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

