<?php
/**
 * The template for displaying archive pages
 *
 * Used to display archive-type pages if nothing more specific matches a query.
 * For example, puts together date-based pages if no date.php file exists.
 *
 * If you'd like to further customize these archive views, you may create a
 * new template file for each one. For example, tag.php (Tag archives),
 * category.php (Category archives), author.php (Author archives), etc.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package FoundationPress
 * @since FoundationPress 1.0.0
 */

get_header(); ?>

<div class="page">
	<?php get_template_part( 'template-parts/title-section'); ?>
	<?php if ( have_posts() ) : ?>
		<section class="events">
			<div class="container border-bottom">
				<div class="row" id="posts-list"> <!-- Post data will be displayed here --> 
					<?php while ( have_posts() ) : the_post(); ?>
						<div class="post col-sm-12 col-md-6">
							<a href="<?php the_permalink(); ?>">
								<div class="background-image" style="background-image: url('<?php echo get_the_post_thumbnail_url(); ?>')"> </div>
								<div class="text pt-2"> 
									<h3 class="black-text"><?php the_title(); ?></h3>
									<?php echo '<h3 class="black-text">'. get_field('subtitle').'</h3>'; ?>
								</div>
							</a>
						</div>
					<?php endwhile; ?>
				</div>
			</div>
		</section>
	<?php endif; // End have_posts() check. ?>
	<?php get_template_part( 'template-parts/additional-links', null, array('type' => 'pr_', 'gallery' => false  )); ?>
</div>

<?php get_footer();
