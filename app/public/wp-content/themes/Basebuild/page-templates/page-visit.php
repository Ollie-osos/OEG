<?php
/**
* Template Name: Plan Your Visit
*
*/
$phone = get_field('phone', 'option');
$phone_display = get_field('phone_display', 'option');
$email = get_field('email', 'option');
$address = get_field('address', 'option');
$transport_options = get_field('transport_options');

get_header(); ?>

<div class="page">
    <?php get_template_part( 'template-parts/title-section', null, array('archive' => 'none')); ?>
    <section class="sidebar">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-4 sidebar pb-2">
                    <h3>Open Eye Gallery</h3>
                    <p><?php echo $address; ?><br></p>
                    <p>Open 10 – 5, Tue–Sun</p>
                    <a href="tel:<?php echo $phone; ?>"><?php echo $phone_display; ?></a>
                    <a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a>
                </div>
                <div class="col-sm-12 col-md-8 content">
                    <gmp-map center="53.403831481933594,-2.993616819381714" zoom="14" map-id="DEMO_MAP_ID">
                        <gmp-advanced-marker position="53.403831481933594,-2.993616819381714" title="My location"></gmp-advanced-marker>
                    </gmp-map>
                    <p><?php the_content (); ?></p>
                    <div class="accordion">
                        <div class="accordion-item">
                            <div class="accordion-header">Expand to see transport options</div>
                            <div class="accordion-content"><?php echo $transport_options; ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'pv_', 'gallery' => false  )); ?>
</div>
<script>
$(document).ready(function() {
    $('.accordion-header').click(function() {
        // Toggle the current accordion content
        $(this).next('.accordion-content').slideToggle();
        // Toggle the active class for the clicked header
        $(this).toggleClass('active');
        // Hide the other accordion contents and remove their active class
        $('.accordion-content').not($(this).next()).slideUp().prev().removeClass('active');
    });
});
</script>
<?php get_footer();


// AIzaSyCDFl4uZVDXhAA0gmn4gDLjVMIrxyRn2lc