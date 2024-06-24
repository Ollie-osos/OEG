<?php
/**
 * The main template file
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * e.g., it puts together the home page when no home.php file exists.
 *
 * Learn more: {@link https://codex.wordpress.org/Template_Hierarchy}
 *
 * @package Ollie Smith Basebuild
 * @since wpbb 1.0.0
 */

 get_header(); ?>

 <div class="page">
     <?php get_template_part( 'template-parts/title-section', null, array('archive' => 'new_')); ?>
     <?php get_template_part( 'template-parts/listings'); ?>
     <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'pr_', 'gallery' => false  )); ?>
 </div>
 
 <?php get_footer();
