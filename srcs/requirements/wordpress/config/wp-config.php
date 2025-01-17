<?php
/**
 * La configuración base para WordPress *
 *
 * Este archivo contiene las siguientes configuraciones:
 *
 * * Ajustes de la base de datos
 * * Claves secretas
 * * Prefijo de las tablas de la base de datos
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 */

define( 'DB_NAME', 'database_name_here' ); 	// Aquí va el nombre de la base de datos de tu sitio WordPress
define( 'DB_USER', 'username_here' ); 		// Aquí va el nombre de usuario de la base de datos
define( 'DB_PASSWORD', 'password_here' );	// Aquí va la contraseña del usuario de la base de datos
define( 'DB_HOST', 'localhost' ); 		// Generalmente 'localhost'
define( 'DB_CHARSET', 'utf8' ); 		// 'utf8' es común y recomendado
define( 'DB_COLLATE', '' ); 			// Generalmente se deja vacío, WordPress lo determina automáticamente(no tocar a no ser que sepas)

/**#@+
 * Claves de autenticación únicas y sales.
 *
 * Cambia estos valores por frases únicas! Puedes generarlas usando
 * el servicio de claves secretas de WordPress:
 * {@link https://api.wordpress.org/secret-key/1.1/salt/}
 *
 * Puedes cambiar estas claves en cualquier momento para invalidar todas las cookies existentes.
 * Esto forzará a todos los usuarios a volver a iniciar sesión.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'pon tu frase única aquí' ); // Clave única para la autenticación
define( 'SECURE_AUTH_KEY',  'pon tu frase única aquí' ); // Clave para la autenticación segura
define( 'LOGGED_IN_KEY',    'pon tu frase única aquí' ); // Clave para mantener la sesión iniciada
define( 'NONCE_KEY',        'pon tu frase única aquí' ); // Clave para proteger contra ataques CSRF
define( 'AUTH_SALT',        'pon tu frase única aquí' ); // Sal para la autenticación
define( 'SECURE_AUTH_SALT', 'pon tu frase única aquí' ); // Sal para la autenticación segura
define( 'LOGGED_IN_SALT',   'pon tu frase única aquí' ); // Sal para mantener la sesión iniciada
define( 'NONCE_SALT',       'pon tu frase única aquí' ); // Sal para proteger contra ataques CSRF

$table_prefix = 'wp_'; // Prefijo para las tablas de la base de datos, comúnmente 'wp_'

/**
 * Para desarrolladores: Modo de depuración de WordPress.
 *
 * Cambia esto a 'true' para habilitar la visualización de mensajes de advertencia durante el desarrollo.
 * Se recomienda encarecidamente que los desarrolladores de plugins y temas usen WP_DEBUG en sus entornos de desarrollo.
 *
 * link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false ); // Establece si se deben mostrar los errores y advertencias de desarrollo

/** Ruta absoluta al directorio de WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	// Si no está definida la constante ABSPATH, la definimos aquí.
	define( 'ABSPATH', __DIR__ . '/' ); // Define la ruta absoluta a la instalación de WordPress
}
require_once ABSPATH . 'wp-settings.php'; // Incluye el archivo wp-settings.php que configura WordPress
