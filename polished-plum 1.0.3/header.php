<?php
/**
 * The header for our theme.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package Polished Plum
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
    <head>
        <meta charset="<?php bloginfo('charset'); ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="profile" href="http://gmpg.org/xfn/11">
        <link rel="stylesheet" href="font-awesome.css">

        <?php wp_head(); ?>
    </head>

    <body <?php body_class(); ?>>
        <div id="page" class="site">
            <a class="skip-link screen-reader-text" href="#content"><?php esc_html_e('Skip to content', 'polished-plum'); ?></a>

            <?php if (get_header_image()) { ?>
                <header id="masthead" class="site-header" style="background-image: url(<?php header_image(); ?>)" role="banner">
                <?php } else { ?>
                    <header id="masthead" class="site-header" role="banner">
                    <?php } ?>

                    <div class="site-logo" >
                        <?php $site_title = get_bloginfo('name'); ?>
                        <a href="<?php echo esc_url(home_url('/')); ?>" rel="home">
                            <?php
                            if (has_custom_logo()) {
                                the_custom_logo();
                            } else {
                                ?>


<?php } ?>
                        </a>
                    </div>



                    <div class="site-branding<?php if (is_singular()) {
    echo ' screen-reader-text';
} ?>" >

                        <?php if (is_front_page() && is_home()) : ?>
                            <h1 class="site-title"><a href="<?php echo esc_url(home_url('/')); ?>" rel="home"><?php bloginfo('name'); ?></a></h1>
                        <?php else : ?>
                            <p class="site-title"><a href="<?php echo esc_url(home_url('/')); ?>" rel="home"><?php bloginfo('name'); ?></a></p>
                        <?php
                        endif;

                        $description = get_bloginfo('description', 'display');
                        if ($description || is_customize_preview()) :
                            ?>
                            <p class="site-description"><?php echo $description; /* WPCS: xss ok. */ ?></p>


                            <div class="social-icons">
                            <?php polished_plum_social_media_icons(); ?>
                            </div>


    <?php endif;
?>

                    </div><!-- .site-branding -->
                    <nav id="site-navigation" class="main-navigation" role="navigation">
                        <button class="menu-toggle" aria-controls="menu" aria-expanded="false" ><?php esc_html_e('Menu', 'polished-plum'); ?></button>
                        <?php
                        wp_nav_menu(array(
                            'theme_location' => 'primary',
                            'menu_id' => 'primary-menu',
                            'menu_class' => 'nav-menu'
                        ));
                        ?>
                    </nav><!-- #site-navigation -->   

                </header><!-- #masthead -->

