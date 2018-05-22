<?php
/**
 * Template part for displaying single posts.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Polished Plum
 */
get_header(); 
?>

<?php global $first_post; ?>
<!--if post has featured image or thumbnail -->
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header">
		<?php
		if ( has_post_thumbnail() ) { ?>
			<figure class="featured-image">
				<?php if ( $first_post == true ) { ?>
					<a href="<?php echo esc_url( get_permalink() ); ?>" rel="bookmark">
						<?php the_post_thumbnail(); ?>
					</a>
				<?php } else {
					the_post_thumbnail();
				}
				?>
			</figure>
		<?php }
		?>

		<?php
			if ( $first_post == true ) {
				the_title( sprintf( '<h2 class="entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h2>' );
			} else {
				the_title( '<h1 class="entry-title">', '</h1>' );
			}
		?>

            <!--show user specified excerpt if exists -->
		<?php
		if ( has_excerpt( $post->ID ) ) {
			echo '<div class="deck">';
			echo '<p>' . get_the_excerpt() . '</p>';
			echo '</div><!-- .deck -->';
		}
		?>

            <!-- display author and date under post title -->
		<div class="entry-meta">
			<?php polished_plum_posted_on(); ?>
		</div><!-- .entry-meta -->
	</header><!-- .entry-header -->

         <!-- display entry content -->
	<div class="entry-content">
		<?php the_content(''); ?>
		<?php
			wp_link_pages( array(
				'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'polished-plum' ),
				'after'  => '</div>',
			) );
		?>
	</div><!-- .entry-content -->

        <!-- if not first post put footer at bottom, otherwise read more link -->
	<?php
		if ( $first_post == false ) { ?>
			<footer class="entry-footer">
				<?php polished_plum_entry_footer(); ?>
			</footer><!-- .entry-footer -->
		<?php } else { 
			echo polished_plum_modify_read_more_link();
		}
?>
</article><!-- #post-## -->
