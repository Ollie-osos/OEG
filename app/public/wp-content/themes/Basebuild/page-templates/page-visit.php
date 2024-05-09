<?php
/**
* Template Name: Plan Your Visit
*
*/
get_header(); ?>

<div class="page">
<?php get_template_part( 'template-parts/title-section'); ?>
<section class="sidebar">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-4 sidebar">
                <h4>Open Eye Gallery</h4>
				<p>Open Eye Gallery,<br>19 Mann Island,<br>Liverpool, L3 1BP<br></p>
				<p>Open 10 – 5, Tue–Sun</p>
				<a href="tel:+441512366768">+44 (0)151 236 6768</a>
				<a href="mailto:info@openeye.org.uk">info@openeye.org.uk</a>
            </div>
            <div class="col-sm-12 col-md-8 content">
                <img src="<?php echo get_template_directory_uri();?>/dist/img/map.png" alt="map">
                <p>text text</p>
            </div>
        </div>
    </div>
</section>
</div>
<?php get_footer();


