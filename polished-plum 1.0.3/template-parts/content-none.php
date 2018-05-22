<?php
/**
 * Template part for displaying a message that posts cannot be found.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Polished Plum
 */
?>

<section class="no-results not-found">
    <header class="page-header">
        <h1 class="page-title"><?php esc_html_e('Nothing Found', 'polished-plum'); ?></h1>
    </header><!-- .page-header -->

    <div class="page-content">
        <?php if (is_home() && current_user_can('publish_posts')) : ?>
            <p><?php printf(wp_kses(__('Ready to publish your first post? <a href="%1$s">Get started here</a>.', 'polished-plum'), array('a' => array('href' => array()))), esc_url(admin_url('post-new.php'))); ?></p>

        <?php elseif (is_search()) : ?>
            <p><?php esc_html_e('Sorry, but nothing matched your search terms. Please try again with some different keywords.', 'polished-plum'); ?></p>
            <?php
            get_search_form();
        else :
            ?>

            <p><?php esc_html_e('It seems we can&rsquo;t find what you&rsquo;re looking for. It might help to look in this list of most recent posts.', 'polished-plum'); ?></p>
            <h2>Recent Posts</h2>
            <ul>
                <?php
                $args = array('numberposts' => '5');
                $recent_posts = wp_get_recent_posts($args);
                foreach ($recent_posts as $recent) {
                    echo '<li><a href="' . get_permalink($recent["ID"]) . '">' . $recent["post_title"] . '</a> </li> ';
                }
                wp_reset_query();
                ?>
            </ul>
            <span class="get-search-form">
                <p> Or maybe you could try a search . . .</p>
                <h2> Search </h2>
                <?php
                get_search_form();

            endif;
            ?>
        </span>
    </div><!-- .page-content -->
</section><!-- .no-results -->
