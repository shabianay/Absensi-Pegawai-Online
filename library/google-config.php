<?php
session_start();
include_once '../library/sw-config.php';
// Include Librari Google Client (API)
include_once '../library/google-client/Google_Client.php';
include_once '../library/google-client/contrib/Google_Oauth2Service.php';

$client_id = '414601558843-58gthdvq0kcbeljba8h16qmicv0j85c6.apps.googleusercontent.com'; // Google client ID
$client_secret = '7GOCSPX-guhs_y9vB4r0CplZFyedhQb3ASed'; // Google Client Secret
$redirect_url = ''.$site_url.'/oauth/google'; // Callback URL

// Call Google API
$gclient = new Google_Client();
$gclient->setClientId($client_id); // Set dengan Client ID
$gclient->setClientSecret($client_secret); // Set dengan Client Secret
$gclient->setRedirectUri($redirect_url); // Set URL untuk Redirect setelah berhasil login

$google_oauthv2 = new Google_Oauth2Service($gclient);
?>
