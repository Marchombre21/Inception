// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', getenv('SQL_DATABASE'));

/** Utilisateur de la base de données MySQL. */
define('DB_USER', getenv('SQL_USER'));

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', getenv('SQL_PASSWORD'));

/** Adresse de l’hébergement MySQL. */
define('DB_HOST', 'mariadb');
