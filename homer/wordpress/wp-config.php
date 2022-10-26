<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress' );

/** Database hostname */
define( 'DB_HOST', '192.168.184.51' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Ofi]I;;.X,@rj$%&T%>{Rw61TQp4-s9iyvn:vsxUqAD<oDJkAh@e/5/KADK*;7ST' );
define( 'SECURE_AUTH_KEY',  '$Xo8=gK.KO0Af%YSlR3;^Zi%[4z7Z&xJ:!_v6`t`G47ReRz$!(~vpY8^Uu:Fv3|m' );
define( 'LOGGED_IN_KEY',    'GHioQA!9]`:L)-VN<Q{I,M$%v;ne4j =v(iU*O QBA(EG,B[2gpQH5#^)N{%:lpR' );
define( 'NONCE_KEY',        'XMT$d_Fl5&1ef)0qXsrlU{O{^K~<_q/]j+0TuH,h,R~1=l#ld{umD%W=I-RIWn;/' );
define( 'AUTH_SALT',        '4U&vy:.yIGY$lh>3.3zzZCH{#=]*!0pH:%AA|8=peFl)^YFHGKD2tSvrhicEQ+50' );
define( 'SECURE_AUTH_SALT', '@5_H7`jIt)ZHIYz(e -sSG+9N?EaW<LG%3h9Hh=<.z;Rsh3D#tSX6w*#b@w8RdLX' );
define( 'LOGGED_IN_SALT',   '8S3Uvf]]hkUK0J-vDx}|83Eh=iJe/3>z }{M8JX5(v*{+6T!y=bFw<qU0RI0ep8/' );
define( 'NONCE_SALT',       'v[HpL?:Pydw<pHUDnI,HpRPcpIyl,FS^#rtsPx>q@0 0fd!s9If}F,B8t8&JejVA' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

