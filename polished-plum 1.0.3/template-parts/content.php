<?php
/**
 * Template part for displaying posts.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Polished Plum
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <header class="entry-header">
        <!-- all header content is wrapped in a div. if this is a single post, then the div is given a class name single-post-header 
        otherwise the div has no class -->
        <?php
        if (is_single()) :
            echo '<div class="single-post-header">';
        else: echo '<div class="multi-post-header"><div>';
        endif;
        ?>

        <?php
        $author_id = get_the_author_meta('ID');
        echo '<div class="author-avatar">' . get_avatar($author_id) . '</div>';
        
        ?>
        <?php if (has_post_thumbnail()) { ?>
            <figure class="featured-image">
                <a href="<?php echo esc_url(get_permalink()); ?>" rel="bookmark">
                    <?php the_post_thumbnail(); ?>	
                </a>
            </figure>
        <?php }
        ?>


        <?php
        if (is_single()) :
            the_title('<h1 class="entry-title">', '</h1>');
        else :
            the_title('<h2 class="entry-title"><a href="' . esc_url(get_permalink()) . '" rel="bookmark">', '</a></h2>');
        endif;
        ?>

        <?php if ('post' === get_post_type()) : ?>
            <div class="entry-meta">
                <?php polished_plum_posted_on(); ?>
            </div><!-- .entry-meta -->
        <?php endif;
        ?>
        </div>

    </header><!-- .entry-header -->

    <div class="entry-content">

    <?php
    if (is_single()) :
        the_content();
    else: the_excerpt();
        ?>
               <a href="<?php echo esc_url(get_permalink()); ?>" class="continue-reading" rel="bookmark">
            <?php
               echo polished_plum_modify_read_more_link();
         
            ?>
        </a>
        <?php
    endif;
    ?>


     
    </div>  


    <footer class="entry-footer">
        <?php polished_plum_entry_footer(); ?>
  
    </footer>  
</article><!-- #post-## -->
