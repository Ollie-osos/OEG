<?php

/**
 * The template for displaying search results pages.
 *
 * @package FoundationPress
 * @since FoundationPress 1.0.0
 */

get_header(); ?>

<div class="page">
	<section class="section">
		<div class="container">
			<div class="row u-justify-center">
				<div class="col-sm-10 col-xs-12 u-text-center">
					<h1>Search</h1>
					<div>
						<form role="search" method="get" id="searchform" action="" class="row">
							<div class="col-xs-12 col-sm-10"><input class="search" type="text" value="" name="s" id="s" aria-label="Search"/></div>
							<div class="col-xs-12 col-sm-2"><input type="submit" value="Search" name="search" class="search-button button"></div>
						</form></div>
					<h3 class="entry-title"><?php _e('Search Results for', 'foundationpress'); ?> &ldquo;<?php echo get_search_query(); ?>"</h3>
				</div>
				<?php if (have_posts()) : ?>
					<div class="col-sm-12">
						<ul class="u-text-center no-bullets">
							<?php while (have_posts()) : the_post(); ?>
								<li>
									<h3><a class="underline" href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a></h3>
								</li>
							<?php endwhile; ?>
						</ul>
					</div>
				<?php else : ?>
					<div class="col-sm-12">
						<h4>No content found, please try searching again.</h4>
					</div>

				<?php endif; ?>

				<?php
				// if (function_exists('foundationpress_pagination')) :
				// 	foundationpress_pagination();
				// elseif (is_paged()) :
				?>
					
				<?php // endif; ?>
			</div>
			<div class="row" id="post-nav">
				<div class="col-sm-6"><h3 class="black-text post-next"><?php previous_posts_link(__('&larr; Previous Page', 'foundationpress')); ?></h3></div>
				<div class="col-sm-6 u-text-right"><h3 class="black-text post-previous"><?php next_posts_link(__('Next Page &rarr;', 'foundationpress')); ?></h3></div>
			</div>
		</div>
	</section>
</div>



<?php get_footer(); ?>