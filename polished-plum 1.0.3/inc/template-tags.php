<?php
/**
 * Custom template tags for this theme.
 *
 * Eventually, some of the functionality here could be replaced by core features.
 *
 * @package Polished Plum
 */
if (!function_exists('polished_plum_posted_on')) :

    /**
     * Prints HTML with meta information for the current post-date/time and author.
     */
    function polished_plum_posted_on() {
        $time_string = '<time class="entry-date published updated" datetime="%1$s">%2$s</time>';
        if (get_the_time('U') !== get_the_modified_time('U')) {
            $time_string = '<time class="entry-date published" datetime="%1$s">%2$s</time><time class="updated" datetime="%3$s">%4$s</time>';
        }

        $time_string = sprintf($time_string, esc_attr(get_the_date('c')), esc_html(get_the_date()), esc_attr(get_the_modified_date('c')), esc_html(get_the_modified_date())
        );

        $posted_on = sprintf(
                esc_html_x('on %s', 'post date', 'polished-plum'), '<a href="' . esc_url(get_permalink()) . '" rel="bookmark">' . $time_string . '</a>'
        );

        $byline = sprintf(
                esc_html_x('Posted by %s', 'post author', 'polished-plum'), '<span class="author vcard"><a class="url fn n" href="' . esc_url(get_author_posts_url(get_the_author_meta('ID'))) . '">' . esc_html(get_the_author()) . '</a></span>'
        );
        echo '<span class="byline">' . $byline . '</span><span class="posted_on"> ' . $posted_on . '</span>'; // WPCS: XSS OK.
    }

endif;

if (!function_exists('polished_plum_entry_footer')) :

    /**
     * Prints HTML with meta information for the categories, tags and comments.
     */
    function polished_plum_entry_footer() {
        // Hide category and tag text for pages.
        if ('post' === get_post_type()) {
            /* translators: used between list items, there is a space after the comma */
            $categories_list = get_the_category_list(esc_html__(', ', 'polished-plum'));
            if ($categories_list && polished_plum_categorized_blog()) {
                printf('<span class="cat-links">' . esc_html__('Posted in: %1$s', 'polished-plum') . '</span>', $categories_list); // WPCS: XSS OK.
            }

            /* translators: used between list items, there is a space after the comma */
            $tags_list = get_the_tag_list('', esc_html__(', ', 'polished-plum'));
            if ($tags_list) {
                printf('<span class="tags-links">' . esc_html__('Tagged: %1$s', 'polished-plum') . '</span>', $tags_list); // WPCS: XSS OK.
            }
        }

        if (!is_single() && !post_password_required() && ( comments_open() || get_comments_number() )) {
            if ($categories_list && polished_plum_categorized_blog()) {
                printf('<span class="cat-links">' . esc_html__('Posted in: %1$s', 'polished-plum') . '</span>', $categories_list); // WPCS: XSS OK.
            }

            /* translators: used between list items, there is a space after the comma */
            $tags_list = get_the_tag_list('', esc_html__(', ', 'polished-plum'));
            if ($tags_list) {
                printf('<span class="tags-links">' . esc_html__('Tagged is: %1$s', 'polished-plum') . '</span>', $tags_list); // WPCS: XSS OK.
            }
            echo '<span class="comments-link">';
            /* translators: %s: post title */
            comments_popup_link(sprintf(wp_kses(__('Comment<span class="screen-reader-text"> on %s</span>', 'polished-plum'), array('span' => array('class' => array()))), get_the_title()));
            echo '</span>';
        }
    }

endif;

/**
 * Returns true if a blog has more than 1 category.
 *
 * @return bool
 */
function polished_plum_categorized_blog() {
    if (false === ( $all_the_cool_cats = get_transient('polished_plum_categories') )) {
        // Create an array of all the categories that are attached to posts.
        $all_the_cool_cats = get_categories(array(
            'fields' => 'ids',
            'hide_empty' => 1,
            // We only need to know if there is more than one category.
            'number' => 2,
                ));

        // Count the number of categories that are attached to the posts.
        $all_the_cool_cats = count($all_the_cool_cats);
        set_transient('polished_plum_categories', $all_the_cool_cats);
    }

    if ($all_the_cool_cats > 1) {
        // This blog has more than 1 category so polished_plum_categorized_blog should return true.
        return true;
    } else {
        // This blog has only 1 category so polished_plum_categorized_blog should return false.
        return false;
    }
}

/**
 * Flush out the transients used in polished_plum_categorized_blog.
 */
function polished_plum_category_transient_flusher() {
    if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) {
        return;
    }
    delete_transient('polished_plum_categories');
}

add_action('edit_category', 'polished_plum_category_transient_flusher');
add_action('save_post', 'polished_plum_category_transient_flusher');




if (!function_exists('polished_plum_paging_nav')) :

    /**
     * Display navigation to next/previous set of posts when applicable.
     *
     * @since Twenty Fourteen 1.0
     *
     * @global WP_Query   $wp_query   WordPress Query object.
     * @global WP_Rewrite $wp_rewrite WordPress Rewrite object.
     */
    function polished_plum_paging_nav() {
        global $wp_query, $wp_rewrite;

        // Don't print empty markup if there's only one page.
        if ($wp_query->max_num_pages < 2) {
            return;
        }

        $paged = get_query_var('paged') ? intval(get_query_var('paged')) : 1;
        $pagenum_link = html_entity_decode(get_pagenum_link());
        $query_args = array();
        $url_parts = explode('?', $pagenum_link);

        if (isset($url_parts[1])) {
            wp_parse_str($url_parts[1], $query_args);
        }

        $pagenum_link = remove_query_arg(array_keys($query_args), $pagenum_link);
        $pagenum_link = trailingslashit($pagenum_link) . '%_%';

        $format = $wp_rewrite->using_index_permalinks() && !strpos($pagenum_link, 'index.php') ? 'index.php/' : '';
        $format .= $wp_rewrite->using_permalinks() ? user_trailingslashit($wp_rewrite->pagination_base . '/%#%', 'paged') : '?paged=%#%';

        // Set up paginated links.
        $links = paginate_links(array(
            'base' => $pagenum_link,
            'format' => $format,
            'total' => $wp_query->max_num_pages,
            'current' => $paged,
            'mid_size' => 1,
            'add_args' => array_map('urlencode', $query_args),
            'prev_text' => __('&larr; Previous', 'polished-plum'),
            'next_text' => __('Next &rarr;', 'polished-plum'),
            'type' => 'list',
                ));

        if ($links) :
            ?>
            <nav class="navigation paging-navigation" role="navigation">
                <h1 class="screen-reader-text"><?php _e('Posts navigation', 'polished-plum'); ?></h1>
            <?php echo $links; ?>
            </nav><!-- .navigation -->
            <?php
        endif;
    }

endif;

if (!function_exists('polished_plum_post_nav')) :

    /**
     * Display navigation to next/previous post when applicable.
     *
     * @since Twenty Fourteen 1.0
     */
    function polished_plum_post_nav() {
        // Don't print empty markup if there's nowhere to navigate.
        $previous = ( is_attachment() ) ? get_post(get_post()->post_parent) : get_adjacent_post(false, '', true);
        $next = get_adjacent_post(false, '', false);

        if (!$next && !$previous) {
            return;
        }
        ?>

        <!-- display pagination -->
        <nav class="navigation post-navigation" role="navigation">
            <h1 class="screen-reader-text"><?php _e('Post navigation', 'polished-plum'); ?></h1>
            <div class="nav-links">
        <?php
        if (is_attachment()) :
            previous_post_link('%link', __('<span class="meta-nav">Published In</span>%title', 'polished-plum'));
        else :
            previous_post_link('%link', __('<span class="meta-nav">Previous Post</span>%title', 'polished-plum'));
            next_post_link('%link', __('<span class="meta-nav">Next Post</span>%title', 'polished-plum'));
        endif;
        ?>
            </div><!-- .nav-links -->
        </nav><!-- .navigation -->
                <?php
            }

        endif;

        function polished_plum_modify_read_more_link() {
            $read_more_link = sprintf(
                    /* translators: %s: Name of current post. */
                    wp_kses(__('Continue reading%s', 'polished-plum'), array('span' => array('class' => array()))), the_title(' <span class="screen-reader-text">"', '"</span>', false)
            );
            $read_more_string = '<div class="continue-reading">
		<a href="' . get_permalink() . '" rel="bookmark">' . $read_more_link . '</a>
	</div>';
            return $read_more_string;
        }

        add_filter('the_content_more_link', 'polished_plum_modify_read_more_link');


        