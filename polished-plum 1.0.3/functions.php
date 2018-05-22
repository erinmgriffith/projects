<?php
/**
 * Polished Plum functions and definitions.
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package Polished Plum
 */

if ( ! function_exists( 'polished_plum_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
function polished_plum_setup() {
	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on Polished Plum, use a find and replace
	 * to change 'Polished Plum' to the name of your theme in all the template files.
	 */
	load_theme_textdomain( 'polished-plum', get_template_directory() . '/languages' );

	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );

	/*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
	add_theme_support( 'title-tag' );

	/*
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
	 */
	add_theme_support( 'post-thumbnails' );

	// This theme uses wp_nav_menu() in one location.
	register_nav_menus( array(
		'primary' => esc_html__( 'Primary', 'polished-plum' ),
	) );

	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form',
		'comment-form',
		'comment-list',
		'gallery',
		'caption',
	) );

	// Set up the WordPress core custom background feature.
	add_theme_support( 'custom-background', apply_filters( 'polished_plum_custom_background_args', array(
		'default-color' => 'ffffff',
		'default-image' => '',
	) ) );
}
endif;
add_action( 'after_setup_theme', 'polished_plum_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function polished_plum_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'polished_plum_content_width', 640 );
}
add_action( 'after_setup_theme', 'polished_plum_content_width', 0 );

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function polished_plum_widgets_init() {
	register_sidebar( array(
		'name'          => esc_html__( 'widget-area', 'polished-plum' ),
		'id'            => 'sidebar-1',
		'description'   => esc_html__( 'Add widgets here.', 'polished-plum' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
}
add_action( 'widgets_init', 'polished_plum_widgets_init' );
 add_theme_support( 'custom-logo', array(
        'height'      => 50,
        'width'       => 50,
        'flex-height' => true,
        'flex-width'  => false,
 	) );
 
 
 
/**
 * Enqueue scripts and styles.
 */
function polished_plum_scripts() {
	wp_enqueue_style( 'polished-plum-style', get_stylesheet_uri() );
	wp_enqueue_style( 'polished-plum-icons', 'https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css' );
        	wp_enqueue_style( 'polished-plum-google-fonts', 'https://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans|Oswald:400,700');

	wp_enqueue_style( 'polished-plum-font-awesome', get_stylesheet_uri() );

	wp_enqueue_script( 'polished-plum-navigation', get_template_directory_uri() . '/js/navigation.js', array('jquery'), '20151215', true );

	wp_enqueue_script( 'polished-plum-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20151215', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
        
}
add_action( 'wp_enqueue_scripts', 'polished_plum_scripts' );




function polished_plum_customizer_social_media_array() {
	/* store social site names in array */
	$social_sites = array('twitter', 'facebook', 'google-plus', 'flickr', 'pinterest', 'youtube', 'tumblr', 'dribbble', 'rss', 'linkedin', 'instagram', 'email');
	return $social_sites;
}


/* add settings to create various social media text areas. */
add_action('customize_register', 'polished_plum_add_social_sites_customizer');
 
function polished_plum_add_social_sites_customizer($wp_customize) {
	$wp_customize->add_section( 'polished_plum_social_settings', array(
			'title'    => __('Social Media Icons', 'polished-plum'),
			'priority' => 35,
	) );
	$social_sites = polished_plum_customizer_social_media_array();
	$priority = 5;
	foreach(polished_plum_customizer_social_media_array() as $social_site) {
		$wp_customize->add_setting( "$social_site", array(
				'type'              => 'theme_mod',
				'capability'        => 'edit_theme_options',
				'sanitize_callback' => 'esc_url_raw'
		) );
		$wp_customize->add_control( $social_site, array(
				'label'    => __( "url:", 'polished-plum' ),
				'section'  => 'my_social_settings',
				'type'     => 'text',
				'priority' => $priority,
		) );
		$priority = $priority + 5;
	}
}

/* takes user input from the customizer and outputs linked social media icons */
function polished_plum_social_media_icons() {
    $social_sites = polished_plum_customizer_social_media_array();
    /* any inputs that aren't empty are stored in $active_sites array */
    foreach($social_sites as $social_site) {
        if( strlen( get_theme_mod( $social_site ) ) > 0 ) {
            $active_sites[] = $social_site;
        }
    }
 
    /* for each active social site, add it as a list item */
        if ( ! empty( $active_sites ) ) {
 
            echo "<ul class='social-media-icons'>";
            foreach ( $active_sites as $active_site ) {
	            /* setup the class */
		        $class = 'fa fa-' . $active_site;
                if ( $active_site == 'email' ) {
                    ?>
                    <li>
                        <a class="email" target="_blank" href="mailto:<?php echo antispambot( is_email( get_theme_mod( $active_site ) ) ); ?>">
                            <i class="fa fa-envelope" title="<?php _e('email icon', 'polished-plum'); ?>"></i>
                        </a>
                    </li>
                <?php } else { ?>
                    <li>
                        <a class="<?php echo $active_site; ?>" target="_blank" href="<?php echo esc_url( get_theme_mod( $active_site) ); ?>">
                            <i class="<?php echo esc_attr( $class ); ?>" title="<?php printf( __('%s icon', 'polished-plum'), $active_site ); ?>"></i>
                        </a>
                    </li>
                <?php
                }
            }
            echo "</ul>";
        }
}

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Custom functions that act independently of the theme templates.
 */
require get_template_directory() . '/inc/extras.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
require get_template_directory() . '/inc/jetpack.php';
