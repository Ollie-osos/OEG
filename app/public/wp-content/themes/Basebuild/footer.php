<?php

/**
 * The template for displaying the footer
 *
 * @package FoundationPress
 * @since FoundationPress 1.0.0
 */


// $current_day = strtolower(date('l')); 
// $opening_time = get_field($current_day, 'option');

// if ($opening_time) {
//   $open_today = $opening_time['time'];
// } else {
//   $open_today = "Closed";
// }

// Get vars from options ACF
$email_form = get_field('email_form', 'option');
$footer_description = get_field('footer_description', 'option');
$phone = get_field('phone', 'option');
$phone_display = get_field('phone_display', 'option');
$email = get_field('email', 'option');
$address = get_field('address', 'option');


$youtube_url = get_field('youtube', 'option');
$instagram_url = get_field('instagram', 'option');
$twitter_url = get_field('twitter', 'option');
$facebook_url = get_field('facebook', 'option');
$tiktok_url = get_field('tiktok', 'option');

?>

<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-12">
				<a href="<?php echo get_home_url(); ?>"><img src="<?php echo get_template_directory_uri(); ?>/dist/img/logo-blue.svg" alt="logo" /></a>
			</div>
			<div class="col-md-3 col-sm-12">
				<h4>Gallery Information</h4>
				<p><?php echo $address; ?><br></p>
				<p>Open 10 – 5, Tue–Sun</p>
				<a href="tel:<?php echo $phone; ?>"><?php echo $phone_display; ?></a>
				<a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a>
				<br>
				<a href="/engagement-get-involved/venue-hire/">Venue Hire</a>
				<a href="/jobs">Jobs</a>
				<a href="/awards">Awards</a>
				<a href="https://www.paypal.com/gb/fundraiser/charity/3396780" target="_blank">Donate</a>
			</div>
			<div class="col-md-3 col-sm-12">
				<h4>Policies</h4>
				<?php foundationpress_footer_nav1(); ?>
				<br>
				<h4>Website Information</h4>
				
				<a href="/privacy-policy">Privacy Policy</a>
				<a href="/terms-conditions">Terms & Conditions</a>
				<a href="/cookie-policy">Cookie Policy</a>
			</div>
			<div class="col-md-3 col-sm-12">
				<h4>Social Links</h4>
				<div class="social-container pt-2">
					<?php if($youtube_url){ echo '<a aria-label="youtube link" target="_blank" href="'.$youtube_url.'"><span class="icon"><i class="fab fa-youtube"></i></span></a>'; } ?>
					<?php if($facebook_url){ echo '<a aria-label="facebook link" target="_blank" href="'.$facebook_url.'"><span class="icon"><i class="fab fa-facebook"></i></span></a>'; } ?>
					<?php if($twitter_url){ echo '<a aria-label="twitter link" target="_blank" href="'.$twitter_url.'"><span class="icon"><i class="fa-brands fa-x-twitter"></i></span></a>'; } ?>
					<?php if($instagram_url){ echo '<a aria-label="instagram link" target="_blank" href="'.$instagram_url.'"><span class="icon"><i class="fab fa-instagram"></i></span></a>'; } ?>
					<?php if($tiktok_url){ echo '<a aria-label="tiktok link" target="_blank" href="'.$tiktok_url.'"><span class="icon"><i class="fa-brands fa-tiktok"></i></span></a>'; } ?>
				</div>
			</div>
		</div>
		<div class="row baseline-content">
			<div class="col-sm-12 u-flex u-justify-space-between">
				<p>NO.1204519<br><br>REGISTERED CHARITY<br>NO.1056743</p>

				<?php 
				$images = get_field('footer_gallery', 'option');
				if( $images ): ?>
					<?php foreach( $images as $image ): ?>
						<img src="<?php echo $image['sizes']['medium']; ?>" alt="partner logos" />
					<?php endforeach; ?>
				<?php endif; ?>
				
			</div>
		</div>
	</div>
	
</footer>
<div id="back-top">
	<span class="icon"><i class="fa fa-arrow-up"></i></span>
</div>
<?php wp_footer(); ?>
</body>

</html>