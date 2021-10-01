
<?php 
if ($mod ==''){
    header('location:../404');
    echo'kosong';
}else{
    include_once 'mod/sw-header.php';
if(!isset($_COOKIE['COOKIES_MEMBER']) OR !isset($_COOKIE['COOKIES_COOKIES'])){

$query = mysqli_query($connection, "SELECT max( employees_code) as kodeTerbesar FROM employees");
$data = mysqli_fetch_array($query);
$kode_karyawan = $data['kodeTerbesar'];
$urutan = (int) substr($kode_karyawan, 3, 3);
$urutan++;
$huruf = "OM";
$kode_karyawan = $huruf . sprintf("%03s", $urutan);

 echo'
 <!-- App Capsule -->
    <div id="appCapsule">
        <div style="background:#00B4FF;border-radius:30px;margin:0 16px;padding:10px 15px" class="section text-center">
            <h1 style="color:#FFFFFF;font-size:24px;"><i class="fa fa-key"></i> Reset</h1>
            <img src="'.$site_url.'/content/'.$site_logo.'" height="70">
            <h4 style="color:#FFFFFF;">Masukkan email Anda untuk mengatur ulang password</h4>
        </div>
        <div class="section mb-5 p-2">
            <form id="form-forgot">
                <div class="card">
                    <div class="card-body pb-1">
    
                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label class="label">E-mail</label>
                                <input type="email" class="form-control" id="email" name="employees_email" required>
                                <i class="clear-input"><ion-icon name="close-circle"></ion-icon></i>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="form-links mt-2">
                    <div>
                        <a class="btn btn-success" href="login"><i class="fa fa-user"></i> Login</a>
                    </div>
                    <div>
                        <a class="btn btn-primary" href="registrasi"><i class="fa fa-user-plus"></i> Register</a>
                    </div>
                </div>

                <div class="form-button-group transparent">
                   <button type="submit" class="btn btn-danger btn-block"><i class="fa fa-key"></i> Reset</button>
                   <a href="oauth/google" class="btn btn-warning btn-block"><ion-icon name="logo-google"></ion-icon> Reset with Google</a>
                </div>

            </form>
        </div>

    </div>
    <!-- * App Capsule -->';}
  else{
  }

  include_once 'mod/sw-footer.php';
} ?>
<?php 
if ($mod ==''){
    header('location:../404');
    echo'kosong';
}else{
    include_once 'mod/sw-header.php';
if(!isset($_COOKIE['COOKIES_MEMBER']) && !isset($_COOKIE['COOKIES_COOKIES'])){
        setcookie('COOKIES_MEMBER', '', 0, '/');
        setcookie('COOKIES_COOKIES', '', 0, '/');
        // Login tidak ditemukan
        setcookie("COOKIES_MEMBER", "", time()-$expired_cookie);
        setcookie("COOKIES_COOKIES", "", time()-$expired_cookie);
        session_destroy();
        header("location:./");
}else{
  echo'<!-- App Capsule -->
    <div id="appCapsule">
    <div class="section mt-2">
    <div class="card">
    <div class="card-body">
        <div class="row text-center">
        <div class="col-sm-4 col-md-4">
            <div class="form-group basic">
                <div class="input-wrapper">
                    <div class="input-group">
                        <input type="text" class="form-control datepicker start_date" name="start_date" placeholder="Tanggal Awal" required>
                        <div class="input-group-addon">
                            <ion-icon name="calendar-outline"></ion-icon>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-4  col-md-4">
            <div class="form-group basic">
                <div class="input-wrapper">
                    <div class="input-group">
                        <input type="text" name="end_date" class="form-control datepicker end_date" value="'.tanggal_ind($date).'">
                        <div class="input-group-addon">
                            <ion-icon name="calendar-outline"></ion-icon>
                        </div>
                    </div>

                </div>
            </div> 
        </div>
        <div class="col-sm-4 col-md-4 justify-content-between">
           <button type="button" class="btn btn-primary mt-1 btn-sortir"><ion-icon name="checkmark-outline"></ion-icon>Tampilkan</button>
           <button type="button" class="btn btn-warning mt-1" data-toggle="modal" data-target="#modal-print"><ion-icon name="print-outline"></ion-icon> Cetak</button>
           <button type="button" class="btn btn-success mt-1 btn-clear"><ion-icon name="repeat-outline"></ion-icon> Clear</button>
        </div>

        </div>       
    </div>
    </div>
    </div>

        <div class="section mt-2">
            <div class="section-title">Data Absensi</div>
            <div class="card">
                <div class="table-responsive">
                    <div class="loaddata"></div>
                </div>
            </div>
             <div class="alert alert-warning mt-2" role="alert">
                <ion-icon name="alert-circle-outline"></ion-icon> Untuk melihat foto absen silahkan klik pada waktu masuk/pulang</a>
            </div>
        </div>
    

        <!-- MODAL EXPLORE -->
        <div class="modal fade action-sheet inset" id="modal-print" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Cetak / Explore</h5>
                        <a href="javascript:void(0);" class="close" style="position: absolute;right:15px;top: 10px;"  data-dismiss="modal" aria-hidden="true"><ion-icon name="close-outline"></ion-icon></a>
                    </div>
                    <div class="modal-body">
                        <div class="action-sheet-content">
                            <div class="form-group basic">
                                <div class="input-wrapper">
                                    <label class="label">Pilih Tipe</label>
                                    <select class="form-control custom-select type" name="type" required>
                                       <option value="pdf">PDF</option>
                                       <option value="excel">EXCEL</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group basic">
                                <button type="button" class="btn btn-primary btn-block mt-2 btn-print"><ion-icon name="print-outline"></ion-icon> Cetak</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- UPDATE ABSENSI  -->
        <div class="modal fade action-sheet inset" id="modal-show" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" style="z-index:10000">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Absen Tanggal <span class="status-date badge badge-success"></span></h5>
                        <a href="javascript:void(0);" class="close" style="position: absolute;right:15px;top: 10px;"  data-dismiss="modal" aria-hidden="true"><ion-icon name="close-outline"></ion-icon></a>
                    </div>
                    <div class="modal-body">
                        <div class="action-sheet-content">

                            <form id="update-history">
                                <input type="hidden" name="presence_id" id="presence_id" readonly>

                                <!--<div class="form-group basic">
                                    <div class="input-wrapper">
                                        <label class="label">Jam Masuk</label>
                                        <input type="text" class="form-control" id="timein" name="time_in" value="" required>
                                        <i class="clear-input">
                                            <ion-icon name="close-circle"></ion-icon>
                                        </i>
                                    </div>
                                    <span class="small">Format jam ex: 07:30</span>
                                </div>

                                <div class="form-group basic">
                                    <div class="input-wrapper">
                                        <label class="label">Jam Pulang</label>
                                        <input type="text" class="form-control" name="time_out" id="timeout" value="" required>
                                        <i class="clear-input">
                                            <ion-icon name="close-circle"></ion-icon>
                                        </i>
                                    </div>
                                    <span class="small">Format jam ex: 17:00</span>
                                </div>-->


                                <div class="form-group basic">
                                    <div class="input-wrapper">
                                        <label class="label">Kehadiran</label>
                                        <select class="form-control custom-select" name="present_id" id="status" required>';
                                            $query="SELECT * from present_status order by present_name ASC";
                                              $result = $connection->query($query);
                                              while($row = $result->fetch_assoc()) { 
                                              echo'<option value="'.$row['present_id'].'">'.$row['present_name'].'</option>';
                                              }echo'
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group basic">
                                    <label class="label">Keterangan</label>
                                    <div class="input-wrapper">
                                    <textarea id="information" rows="2" class="form-control" name="information" placeholder="Keterangan"></textarea>
                                    </div>
                                    <span class="small">Kosongkan jika tidak memberi keterangan</span>
                                </div>

                                <div class="form-group basic">
                                    <button type="submit" class="btn btn-primary btn-block">Simpan</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- * END UPDATE ABSENSI -->

</div>';

  }
  include_once 'mod/sw-footer.php';
} ?>
<?php 
if ($mod ==''){
    header('location:../404');
    echo'kosong';
}else{
    include_once 'mod/sw-header.php';
    if(!isset($_COOKIE['COOKIES_MEMBER'])){
        header('location:index');
    }
    else {
        echo'
            <!-- App Capsule -->
            <div id="appCapsule">
                <!-- Wallet Card -->
                <div class="section wallet-card-section pt-1">
                    <div class="wallet-card">
                        <!-- Balance -->
                        <div class="balance">
                            <div class="left">
                                <span class="title"> Selamat '.$salam.'</span>
                                <h1 class="total">'.ucfirst($row_user['employees_name']).'</h1>
                            </div>
                        </div>
                        <!-- * Balance -->
                        <!-- Wallet Footer -->
                        <div class="wallet-footer">
                            <div class="item">
                                <a href="./profile">
                                    <div class="icon-wrapper bg-primary">
                                       <ion-icon name="person-outline"></ion-icon>
                                    </div>
                                    <strong>Profil</strong>
                                </a>
                            </div>
                            <div class="item">
                                <a href="./present">
                                    <div class="icon-wrapper bg-success">
                                        <ion-icon name="camera-outline"></ion-icon>
                                    </div>
                                    <strong>Absen</strong>
                                </a>
                            </div>
                            <div class="item">
                                <a href="./id-card">
                                    <div class="icon-wrapper bg-warning">
                                       <ion-icon name="id-card-outline"></ion-icon>
                                    </div>
                                    <strong>ID Card</strong>
                                </a>
                            </div>
                            <div class="item">
                                <a href="./history">
                                    <div class="icon-wrapper bg-danger">
                                       <ion-icon name="document-text-outline"></ion-icon>
                                    </div>
                                    <strong>Riwayat</strong>
                                </a>
                            </div>
                        </div>
                        <!-- * Wallet Footer -->
                    </div>
                </div>
                <!-- Wallet Card -->
                <div class="section mt-2 mb-2">
                    <div class="section-title">1 Minggu Terakhir</div>
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table table-dark rounded bg-primary">
                                    <thead>
                                        <tr>
                                            <th scope="col">Tanggal</th>
                                            <th scope="col">Jam Masuk</th>
                                            <th scope="col">Jam Pulang</th>
                                        </tr>
                                    </thead>
                                    <tbody>';
                                        $query_absen="SELECT presence_date,time_in,time_out FROM presence WHERE MONTH(presence_date) ='$month' AND employees_id='$row_user[id]' ORDER BY presence_id DESC LIMIT 6";
                                        $result_absen = $connection->query($query_absen);
                                        if($result_absen->num_rows > 0){
                                            while ($row_absen= $result_absen->fetch_assoc()) {
                                            echo'
                                            <tr>
                                                <th scope="row">'.tgl_ind($row_absen['presence_date']).'</th>
                                                <td>'.$row_absen['time_in'].'</td>
                                                <td>'.$row_absen['time_out'].'</td>
                                            </tr>';
                                        }}
                                        echo'
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- App Capsule -->
        ';
    }
    include_once 'mod/sw-footer.php';
}
?>
<?php 
if ($mod ==''){
    header('location:../404');
    echo'kosong';
}else{
    include_once 'mod/sw-header.php';
    require_once'./library/phpqrcode/qrlib.php'; 
if(!isset($_COOKIE['COOKIES_MEMBER'])){
            setcookie('COOKIES_MEMBER', '', 0, '/');
            setcookie('COOKIES_COOKIES', '', 0, '/');
            // Login tidak ditemukan
            setcookie("COOKIES_MEMBER", "", time()-$expired_cookie);
            setcookie("COOKIES_COOKIES", "", time()-$expired_cookie);
            session_destroy();
            header("location:./");
    }else{

      $codeContents = $row_user['employees_code'];
      $tempdir = './content/employees-code-qr/';
      #parameter inputan
      $isi_teks = $codeContents;
      $namafile = ''.$row_user['employees_code'].'.jpg';
      if(file_exists('./content/employees-code-qr/'.$namafile.'')){
          $namafile = ''.$row_user['employees_code'].'.jpg';
        }else{
          $quality = 'L'; //ada 4 pilihan, L (Low), M(Medium), Q(Good), H(High)
          $ukuran = 5; //batasan 1 paling kecil, 10 paling besar
          $padding = 1;
          QRCode::png($isi_teks,$tempdir.$namafile,$quality,$ukuran,$padding);
        }

  echo'
  <!-- App Capsule -->
    <div id="appCapsule">
        <!-- Wallet Card -->
        <div class="section wallet-card-section pt-1">
            <div class="wallet-card">
                <div class="text-center">
                    <!-- * ID Card -->
                    <div class="id-card">
                        <div class="body-id-card text-center" id="divToPrint">
                            <div class="avatar">';
                                if($row_user['photo'] ==''){
                                    echo'<img src="'.$base_url.'content/avatar.jpg" alt="image" class="imaged w100 rounded">';
                                    }else{
                                    echo'
                                    <img src="'.$base_url.'content/karyawan/'.$row_user['photo'].'" alt="'.$row_user['employees_name'].'" class="imaged w100 rounded">';}
                            echo'
                            </div>
                            <h3>'.$row_user['employees_name'].'</h3>
                            <p>'.$row_user['employees_code'].'</p>
                            <div class="barcode">
                                <img class="img-responsive text-center" src="'.$tempdir.''.$namafile.'" alt="QR CODE">
                            </div>
                            <p>'.$row_user['employees_code'].'</p>
                        </div>
                    </div>';?>
                    <hr>
                    <a href="#" class="btn btn-primary btn-Convert-Html2Image"><ion-icon name="save-outline"></ion-icon> Siampan ID Card</a>
                    <div id="previewImage" class="d-none"></div>
                </div>
            </div>
        </div>
        <!-- Wallet Card --> 
    </div>
    <!-- * App Capsule -->
    <?php
  }
  include_once 'mod/sw-footer.php';
} ?>
<?php

	$fullurl = ($_SERVER['PHP_SELF']);
	$trimmed = trim($fullurl, ".php");
	$canonical = rtrim($trimmed, '/' . '/?');

	if (isset($_COOKIE['COOKIES_MEMBER'])) {
	    header("location:./");
	} else {

	?>

	<!DOCTYPE html>
	<html lang="id-ID" xml:lang="id-ID">

	    <head>

	    	<!--Viewport -->
	    	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
	    	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
	    	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible"/>

	    	<!--Canonical-->
	    	<meta content="all" name="robots"/>
	    	<link href="<?php echo $site_url; ?>" rel="home"/>
	    	<link href="<?php echo $site_url; ?><?php echo $fullurl; ?>" rel="canonical"/>

	    	<!--Title-->
	    	<title><?php echo $site_name; ?></title>
	    	<meta name="description" content="<?php echo $site_description; ?>"/>
	    	<meta name="keywords" content="absensi online, aplikasi absensi, aplikasi absensi online, sistem absensi online, absensi online pemerintah, absensi online perusahaan"/>

	    	<!--OG-->
	    	<meta content="website" property="og:type"/>
	    	<meta content="<?php echo $site_name; ?>" property="og:title"/>
	    	<meta content="<?php echo $site_description; ?>" property="og:description"/>
	    	<meta content="<?php echo $site_url; ?><?php echo $fullurl; ?>" property="og:url"/>
	    	<meta content="<?php echo $site_name; ?>" property="og:site_name"/>
	    	<meta content="<?php echo $site_name; ?>" property="og:headline"/>
	    	<meta content="<?php echo $site_url; ?>/content/logo/absensionline.jpg" property="og:image"/>
	    	<meta content="1920" property="og:image:width"/>
	    	<meta content="1080" property="og:image:height"/>
	    	<meta content="id_ID" property="og:locale"/>
	    	<meta content="en_US" property="og:locale:alternate"/>
	    	<meta content="true" property="og:rich_attachment"/>
	    	<meta content="true" property="pinterest-rich-pin"/>
	    	<meta content="" property="fb:app_id"/>
	    	<meta content="" property="fb:pages"/>
	    	<meta content="" property="fb:admins"/>
	    	<meta content="" property="fb:profile_id"/>
	    	<meta content="<?php echo $site_name; ?>" property="article:author"/>
	    	<meta content="summary_large_image" name="twitter:card"/>
	    	<meta content="@mycodingxd" name="twitter:site"/>
	    	<meta content="@mycodingxd" name="twitter:creator"/>
	    	<meta content="<?php echo $site_url; ?><?php echo $fullurl; ?>" property="twitter:url"/>
	    	<meta content="<?php echo $site_name; ?>" property="twitter:title"/>
	    	<meta content="<?php echo $site_description; ?>" property="twitter:description"/>
	    	<meta content="<?php echo $site_url; ?>/content/logo/absensionline.jpg" property="twitter:image"/>

	    	<!--Webapp-->
	    	<link href="<?php echo $site_url; ?>/manifest.json" rel="manifest"/>
	    	<meta content="<?php echo $site_url; ?>" name="msapplication-starturl"/>
	    	<meta content="<?php echo $site_url; ?>" name="start_url"/>
	    	<meta content="<?php echo $site_name; ?>" name="application-name"/>
	    	<meta content="<?php echo $site_name; ?>" name="apple-mobile-web-app-title"/>
	    	<meta content="<?php echo $site_name; ?>" name="msapplication-tooltip"/>
	    	<meta content="#005CAA" name="theme_color"/>
	    	<meta content="#005CAA" name="theme-color"/>
	    	<meta content="#FFFFFF" name="background_color"/>
	    	<meta content="#005CAA" name="msapplication-navbutton-color"/>
	    	<meta content="#005CAA" name="msapplication-TileColor"/>
	    	<meta content="#005CAA" name="apple-mobile-web-app-status-bar-style"/>
	    	<meta content="true" name="mssmarttagspreventparsing"/>
	    	<meta content="yes" name="apple-mobile-web-app-capable"/>
	    	<meta content="yes" name="mobile-web-app-capable"/>
	    	<meta content="yes" name="apple-touch-fullscreen"/>
	    	<link href="<?php echo $site_url; ?>/favicon.png"/>
	    	<link href="<?php echo $site_url; ?>/favicon.png"/>
	    	<link href="<?php echo $site_url; ?>/content/logo/absensionline32.png" rel="icon" sizes="32x32"/>
	    	<meta content="<?php echo $site_url; ?>/content/logo/absensionline144.png" name="msapplication-TileImage"/>
	    	<link href="<?php echo $site_url; ?>/content/logo/absensionline180.png" rel="apple-touch-icon"/>
	    	<link href="<?php echo $site_url; ?>/content/logo/absensionline48.png" rel="icon" sizes="48x48"/>
	    	<link href="<?php echo $site_url; ?>/content/logo/absensionline72.png" rel="icon" sizes="72x72"/>
	    	<link href="<?php echo $site_url; ?>/content/logo/absensionline96.png" rel="icon" sizes="96x96"/>
	    	<link href="<?php echo $site_url; ?>/content/logo/absensionline168.png" rel="icon" sizes="168x168"/>
	    	<link href="<?php echo $site_url; ?>/content/logo/absensionline192.png" rel="icon" sizes="192x192"/>
	    	<link href="<?php echo $site_url; ?>/content/logo/absensionline512.png" rel="icon" sizes="512x512"/>

	    	<!--verification-->
	    	<meta name="yandex-verification" content=""/>
	    	<meta name="p:domain_verify" content=""/>
	    	<meta name="msvalidate.01" content=""/>
	    	<meta name="google-site-verification" content="" />
	    	<meta name="dmca-site-verification" content=""/>
	    	<meta name="facebook-domain-verification" content=""/>

	    	<!--Location-->
	    	<meta content="ID" name="geo.region"/>
	    	<meta content="Indonesia" name="geo.country"/>
	    	<meta content="Indonesia" name="geo.placename"/>
	    	<meta content="x;x" name="geo.position"/>
	    	<meta content="x,x" name="ICBM"/>

	    	<!--resource-->
	    	<link href="//fonts.googleapis.com" rel="preconnect dns-prefetch"/>
	    	<link href="//api.github.com" rel="preconnect dns-prefetch"/>
	    	<link href="//api.mapbox.com" rel="preconnect dns-prefetch"/>
	    	<link href="//cdnjs.cloudflare.com" rel="preconnect dns-prefetch"/>
	    	<link href="//unpkg.com" rel="preconnect dns-prefetch"/>
			<link href="//kit.fontawesome.com" rel="preconnect dns-prefetch"/>
			
            <!--cssfont-->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css" rel="stylesheet"/>

            <!--css-->
            <link href="mod/assets-index/css/scroll.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/bootstrap.min.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/animate.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/meanmenu.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/magnific-popup.min.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/owl.carousel.min.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/odometer.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/slick.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/style.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/responsive.css" rel="stylesheet"/>
            <link href="mod/assets-index/css/footer.css" rel="stylesheet"/>

	    </head>

	    <body>

	        <!--HEADER-->
	        <header id="header">
	        	<div class="startp-mobile-nav fixed">
	        		<div class="logo">
	        			<a href="./"><img src="<?php echo $site_url; ?>/content/<?php echo $site_logo; ?>" class="home-logo"></a>
	        		</div>
	        	</div>
	        	<div class="startp-nav fixed">
	        		<div class="container">
	        			<nav class="navbar navbar-expand-md navbar-light">
	        				<a class="navbar-brand" href="./"><img src="<?php echo $site_url; ?>/content/<?php echo $site_logo; ?>" class="home-logo"></a>
	        				<div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
	        				</div>
	        			</nav>
	        		</div> 
	        	</div>
	        </header>

	        <!--BERANDA-->
	        <div class="main-banner">
	        	<div class="d-table">
	        		<div class="d-table-cell c">
	        			<div class="container">
	        				<div class="row h-100 justify-content-center align-items-center">
	        					<div class="col-lg-5">
	        						<div class="hero-content text-center text-white">
	        							<p>
	        								<img src="<?php echo $site_url; ?>/content/logo/favicon.png" class="img-fluid" width="180px">
	        							</p>
	        							<h1 class="text-white"><?php echo $site_name; ?></h1>
	        							<p>
	        								<a href="<?php echo $site_url; ?>/login" class="btn btn-primary"><i aria-hidden="true" class="fa fa-sign-in-alt"></i> MASUK</a>
	        								<a href="<?php echo $site_url; ?>/registrasi" class="btn btn-primary"><i aria-hidden="true" class="fa fa-user-plus"></i> DAFTAR</a>
	        							</p>
	        						</div>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
	        	</div>
	        	<div class="shape1"><img src="mod/assets-index/images/shape1.png" alt="shape"></div>
	        	<div class="shape2 rotateme"><img src="mod/assets-index/images/shape2.svg" alt="shape"></div>
	        	<div class="shape3"><img src="mod/assets-index/images/shape3.svg" alt="shape"></div>
	        	<div class="shape4"><img src="mod/assets-index/images/shape4.svg" alt="shape"></div>
	        	<div class="shape5"><img src="mod/assets-index/images/shape5.png" alt="shape"></div>
	        	<div class="shape6 rotateme"><img src="mod/assets-index/images/shape4.svg" alt="shape"></div>
	        	<div class="shape7"><img src="mod/assets-index/images/shape4.svg" alt="shape"></div>
	        	<div class="shape8 rotateme"><img src="mod/assets-index/images/shape2.svg" alt="shape"></div>
	        </div>

	        <div class="go-top">
	        	<i data-feather="arrow-up"></i>
	        </div>

			<!--Scroll Indicator Load-->
			<div class='progress-container'>
				<div class='progress-bar' id='progressbar'/>
			</div>
			<script type='text/javascript'>
				//<![CDATA[
				window.addEventListener("scroll", myFunction);
				function myFunction() {
					var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
					var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
					var scrolled = (winScroll / height) * 100;
					document.getElementById("progressbar").style.width = scrolled + "%";
				}
				//]]>
			</script>

	        <!--javascript-->
	        <script src="mod/assets-index/js/jquery.min.js"></script>
	        <script src="mod/assets-index/js/jquery.meanmenu.min.js"></script>
	        <script src="mod/assets-index/js/jquery.magnific-popup.min.js"></script>
	        <script src="mod/assets-index/js/jquery.appear.js"></script>
	        <script src="mod/assets-index/js/odometer.min.js"></script>
	        <script src="mod/assets-index/js/slick.js"></script>
	        <script src="mod/assets-index/js/owl.carousel.min.js"></script>
	        <script src="mod/assets-index/js/feather.min.js"></script>
	        <script src="mod/assets-index/js/main.js"></script>

	    </body>

	</html>

<?php } ?>
<?php 
if ($mod ==''){
    header('location:../404');
    echo'kosong';
}else{
    include_once 'mod/sw-header.php';
if(!isset($_COOKIE['COOKIES_MEMBER'])){

$query = mysqli_query($connection, "SELECT max( employees_code) as kodeTerbesar FROM employees");
$data = mysqli_fetch_array($query);
$kode_karyawan = $data['kodeTerbesar'];
$urutan = (int) substr($kode_karyawan, 3, 3);
$urutan++;
$huruf = "OM";
$kode_karyawan = $huruf . sprintf("%03s", $urutan);

 echo'
 
 <!-- App Capsule -->
    <div id="appCapsule">
        <div style="background:#00B4FF;border-radius:30px;margin:0 16px;padding:10px 15px" class="section text-center">
            <h1 style="color:#FFFFFF;font-size:24px;"><i class="fa fa-user"></i> Login</h1>
            <img src="'.$site_url.'/content/'.$site_logo.'" height="70">
            <h4 style="color:#FFFFFF;">Masukkan email dan password Anda untuk login ke sistem</h4>
        </div>
        <div class="section mb-5 p-2">
            <form id="form-login">
                <div class="card">
                    <div class="card-body pb-1">
                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label class="label" for="email1">E-mail</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Masukkan E-mail" required>
                                <i class="clear-input"><ion-icon name="close-circle"></ion-icon></i>
                            </div>
                        </div>
        
                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label class="label" for="password1">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Masukkan Password" required>
                                <i class="clear-input"><ion-icon name="close-circle"></ion-icon></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-links mt-2">
                    <div>
                        <a class="btn btn-primary" href="registrasi"><i class="fa fa-user-plus"></i> Register</a>
                    </div>
                    <div>
                        <a class="btn btn-danger" href="forgot"><i class="fa fa-key"></i> Reset Password</a>
                    </div>
                </div>

                <div class="form-button-group transparent">
                   <button type="submit" class="btn btn-success btn-block"><ion-icon name="log-in"></ion-icon> Login</button>
                   <a href="oauth/google" class="btn btn-warning btn-block"><ion-icon name="logo-google"></ion-icon> Login with Google</a>
                </div>

            </form>
        </div>

    </div>
    <!-- * App Capsule -->';}
  else{
  }

  include_once 'mod/sw-footer.php';
} ?>
<?php 
if ($mod ==''){
    header('location:../404');
    echo'kosong';
}else{
    include_once 'mod/sw-header.php';
if(!isset($_COOKIE['COOKIES_MEMBER']) && !isset($_COOKIE['COOKIES_COOKIES'])){
        setcookie('COOKIES_MEMBER', '', 0, '/');
        setcookie('COOKIES_COOKIES', '', 0, '/');
        // Login tidak ditemukan
        setcookie("COOKIES_MEMBER", "", time()-$expired_cookie);
        setcookie("COOKIES_COOKIES", "", time()-$expired_cookie);
        session_destroy();
        header("location:./");
}else{
  echo'<!-- App Capsule -->
    <div id="appCapsule">
        <!-- Wallet Card -->
        <div class="section wallet-card-section pt-1">
            <div class="wallet-card">
                <!-- Balance -->
                <!--<div class="balance">
                    <div class="left">
                        <span class="title"> Selamat '.$salam.'</span>
                        <h4>'.ucfirst($row_user['employees_name']).'</h4>
                    </div>
                    <div class="right">
                        <span class="title">'.tgl_ind($date).' </span>
                        <h4><span class="clock"></span></h4>
                    </div>

                </div>-->
                <!-- * Balance -->
                <!-- Wallet Footer --><div class="text-center"><h3>'.tgl_ind($date).' - <span class="clock"></span></h3></div>
                <div class="wallet-footer text-center">
                    <div class="webcam-capture-body text-center">
                        <span class="latitude d-none" id="latitude"></span>
                        <div class="webcam-capture"></div>
                        <div class="form-group basic">';
                        $query ="SELECT employees_id,time_in FROM presence WHERE employees_id='$row_user[id]' AND presence_date='$date'";
                        $result = $connection->query($query);
                        $row = $result->fetch_assoc();
                        if($result->num_rows > 0){
                        echo'
                        <button class="btn btn-success btn-lg btn-block" onClick="captureimage(0)"><ion-icon name="camera-outline"></ion-icon>Absen Pulang</button>';}
                        else{
                        echo'
                        <button class="btn btn-success btn-lg btn-block" onClick="captureimage(0)"><ion-icon name="camera-outline"></ion-icon>Absen Masuk</button>';
                        }
                        echo'
                        </div>
                    </div>
                </div>
                <!-- * Wallet Footer -->
                
            </div>
        </div>
        <!-- Card -->
    </div>
    <!-- * App Capsule -->
';

  }
  include_once 'mod/sw-footer.php';
} ?>
<?php 
if ($mod ==''){
    header('location:../404');
    echo'kosong';
}else{
    include_once 'mod/sw-header.php';
if(!isset($_COOKIE['COOKIES_MEMBER'])){
        setcookie('COOKIES_MEMBER', '', 0, '/');
        setcookie('COOKIES_COOKIES', '', 0, '/');
        // Login tidak ditemukan
        setcookie("COOKIES_MEMBER", "", time()-$expired_cookie);
        setcookie("COOKIES_COOKIES", "", time()-$expired_cookie);
        session_destroy();
        header("location:./");
}else{
  echo'<!-- App Capsule -->
    <div id="appCapsule">
        <div class="section mt-3 text-center">
            <div class="avatar-section">
                <input type="file" class="upload" name="file" id="avatar" accept=".jpg, .jpeg, ,gif, .png" capture="camera">
                <a href="#">';
                if($row_user['photo'] ==''){
                echo'<img src="'.$base_url.'content/avatar.jpg" alt="image" class="imaged w100 rounded">';
                }else{
                    echo'
                    <img src="'.$base_url.'content/karyawan/'.$row_user['photo'].'" alt="avatar" class="imaged w100 rounded">';}
                        echo'
                    <span class="button">
                        <ion-icon name="camera-outline"></ion-icon>
                    </span>
                </a>
            </div>
        </div>

        <div class="section mt-2 mb-2">
            <div class="section-title">Profil</div>
            <div class="card">
                <div class="card-body">
                    <form id="update-profile">
                        <div class="form-group boxed">
                            <div class="input-wrapper">
                                <label class="label" for="text4">Username</label>
                                <input type="text" class="form-control" value="'.$row_user['employees_code'].'" style="background:#eeeeee" disabled readonly>
                                <i class="clear-input">
                                    <ion-icon name="close-circle"></ion-icon>
                                </i>
                            </div>
                        </div>

                        <div class="form-group boxed">
                            <div class="input-wrapper">
                                <label class="label" for="email4">Nama</label>
                                <input type="text" class="form-control" id="name" name="employees_name" value="'.$row_user['employees_name'].'" required>
                                <i class="clear-input">
                                    <ion-icon name="close-circle"></ion-icon>
                                </i>
                            </div>
                        </div>

                        <div class="form-group boxed">
                            <div class="input-wrapper">
                                <label class="label" for="select4">Jabatan</label>
                                <select class="form-control custom-select" name="position_id">';
                                      $query="SELECT * from position order by position_name ASC";
                                      $result = $connection->query($query);
                                      while($rowa = $result->fetch_assoc()) { 
                                      if($rowa['position_id'] == $row_user['position_id']){
                                        echo'<option value="'.$rowa['position_id'].'" selected>'.$rowa['position_name'].'</option>';
                                      }else{
                                        echo'<option value="'.$rowa['position_id'].'">'.$rowa['position_name'].'</option>';
                                      }
                                      }echo'
                                </select>
                            </div>
                        </div>

                        <div class="form-group boxed">
                            <div class="input-wrapper">
                                <label class="label" for="select4">Shift</label>
                                <select class="form-control custom-select" name="shift_id">';
                                     $query="SELECT shift_id,shift_name from shift order by shift_name ASC";
                                      $result = $connection->query($query);
                                      while($rowa = $result->fetch_assoc()) {
                                      if($rowa['shift_id'] == $row_user['shift_id']){ 
                                        echo'<option value="'.$rowa['shift_id'].'" selected>'.$rowa['shift_name'].'</option>';
                                      }else{
                                        echo'<option value="'.$rowa['shift_id'].'">'.$rowa['shift_name'].'</option>';
                                      }
                                      }echo'
                                </select>
                            </div>
                        </div>


                        <div class="form-group boxed">
                            <div class="input-wrapper">
                                <label class="label" for="password4">Lokasi Penempatan</label>
                                <select class="form-control custom-select" name="building_id">';
                                $query  ="SELECT building_id,name,address from building";
                                $result = $connection->query($query);
                                while($row = $result->fetch_assoc()) {
                                    if($row['building_id'] == $row_user['building_id']){ 
                                        echo'<option value="'.$row['building_id'].'" selected>'.$row['name'].'</option>';
                                    }else{
                                        echo'<option value="'.$row['building_id'].'">'.$row['name'].'</option>';
                                    }
                                }echo'
                                </select>
                            </div>
                        </div>

                        <hr>
                            <button type="submit" class="btn btn-primary mr-1 btn-block btn-profile">Simpan</button>
                        
                    </form>

                </div>
            </div>
        </div>

      
        <div class="section mt-2 mb-2">
            <div class="section-title">Update Password</div>
            <div class="card">
                <div class="card-body">
                    <form id="update-password">
                        <div class="form-group boxed">
                            <div class="input-wrapper">
                                <label class="label" for="text4">Email</label>
                                <input type="email" class="form-control" name="employees_email" value="'.$row_user['employees_email'].'" style="background:#eeeeee" readonly>
                                <i class="clear-input">
                                    <ion-icon name="close-circle"></ion-icon>
                                </i>
                            </div>
                        </div>

                        <div class="form-group boxed">
                            <div class="input-wrapper">
                                <label class="label" for="email4">Password baru</label>
                                <input type="password" class="form-control" name="employees_password" id="employees_password" required>
                                <i class="clear-input">
                                    <ion-icon name="close-circle"></ion-icon>
                                </i>
                            </div>
                        </div>
                        <hr>
                        <button type="submit" class="btn btn-primary mr-1 btn-block">Simpan</button>
                    </form>

                </div>
            </div>
        </div>
        
    </div>
    <!-- * App Capsule -->
';

  }
  include_once 'mod/sw-footer.php';
} ?>
<?php 
if ($mod ==''){
    header('location:../404');
    echo'kosong';
}else{
    include_once 'mod/sw-header.php';
if(!isset($_COOKIE['COOKIES_MEMBER']) OR !isset($_COOKIE['COOKIES_COOKIES'])){

$query = mysqli_query($connection, "SELECT max( employees_code) as kodeTerbesar FROM employees");
$data = mysqli_fetch_array($query);
$kode_karyawan = $data['kodeTerbesar'];
$urutan = (int) substr($kode_karyawan, 3, 3);
$urutan++;
$huruf = "OM";
$kode_karyawan = $huruf . sprintf("%03s", $urutan);

 echo'
 <!-- App Capsule -->
    <div id="appCapsule">
        <div style="background:#00B4FF;border-radius:30px;margin:0 16px;padding:10px 15px" class="section text-center">
            <h1 style="color:#FFFFFF;font-size:24px;"><i class="fa fa-user-plus"></i> Register</h1>
            <img src="'.$site_url.'/content/'.$site_logo.'" height="70">
            <h4 style="color:#FFFFFF;">Silakan mengisi data pendaftaran akun dengan valid</h4>
        </div>
        <div class="section mb-5 p-2">
            <form id="form-registrasi">
                <div class="card">
                    <div class="card-body pb-1">
                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label class="label">Nama</label>
                                <input type="text" class="form-control" id="name" name="employees_name" placeholder="Nama Lengkap" required>
                                <i class="clear-input"><ion-icon name="close-circle"></ion-icon></i>
                            </div>
                        </div>

                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label class="label">E-mail</label>
                                <input type="email" class="form-control" id="email" name="employees_email" placeholder="Masukkan E-mail" required>
                                <i class="clear-input"><ion-icon name="close-circle"></ion-icon></i>
                            </div>
                        </div>

                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label class="label">Jabatan</label>
                                <select class="form-control" name="position_id" id="position_id"  required="">
                                  <option value="">- Pilih -</option>';
                                  $query="SELECT * from position order by position_name ASC";
                                  $result = $connection->query($query);
                                  while($row = $result->fetch_assoc()) { 
                                  echo'<option value="'.$row['position_id'].'">'.$row['position_name'].'</option>';
                                  }echo'
                                </select>
                            </div>
                        </div>

                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label class="label">Shift</label>
                                <select class="form-control" name="shift_id" id="shift_id" required="">
                                  <option value="">- Pilih -</option>';
                                  $query="SELECT shift_id,shift_name from shift order by shift_name ASC";
                                  $result = $connection->query($query);
                                  while($row = $result->fetch_assoc()) { 
                                  echo'<option value="'.$row['shift_id'].'">'.$row['shift_name'].'</option>';
                                  }echo'
                                </select>
                            </div>
                        </div>

                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label class="label">Lokasi</label>
                                <select class="form-control" name="building_id" id="building" required="">
                                  <option value="">- Pilih -</option>';
                                  $query="SELECT building_id,name,address from building order by name ASC";
                                  $result = $connection->query($query);
                                  while($row = $result->fetch_assoc()) { 
                                  echo'<option value="'.$row['building_id'].'">'.$row['name'].'</option>';
                                  }echo'
                              </select>
                            </div>
                        </div>

                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label class="label" for="password1">Password</label>
                                <input type="password" class="form-control" id="password" name="employees_password"  placeholder="Masukkan Password" required>
                                <i class="clear-input"><ion-icon name="close-circle"></ion-icon></i>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-links mt-2">
                    <div>
                        <a class="btn btn-success" href="login"><i class="fa fa-user"></i> Login</a>
                    </div>
                    <div>
                        <a class="btn btn-danger" href="forgot"><i class="fa fa-key"></i> Reset Password</a>
                    </div>
                </div>

                <div class="form-button-group transparent">
                   <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-user-plus"></i> Register</button>
                   <a href="oauth/google" class="btn btn-warning btn-block"><ion-icon name="logo-google"></ion-icon> Register with Google</a>
                </div>

            </form>
        </div>

    </div>
    <!-- * App Capsule -->';}
  else{
  }

  include_once 'mod/sw-footer.php';
} ?>
<?php if(empty($connection)){
	header('location:./404');
} else {

if(isset($_COOKIE['COOKIES_MEMBER'])){
echo'
<div class="appBottomMenu">
        <a href="./" class="item">
            <div class="col">
                <ion-icon name="home-outline"></ion-icon>
                <strong>Home</strong>
            </div>
        </a>
        <a href="./profile" class="item">
            <div class="col">
                <ion-icon name="person-outline"></ion-icon>
                <strong>Profil</strong>
            </div>
        </a>
        <a href="present" class="item">
            <div class="col">
                <ion-icon name="camera-outline"></ion-icon>
                <strong>Absen</strong>
            </div>
        </a>
        <!--<a href="./id-card" class="item">
            <div class="col">
               <ion-icon name="id-card-outline"></ion-icon>
                <strong>ID Card</strong>
            </div>
        </a>-->
        <a href="./history" class="item">
            <div class="col">
                 <ion-icon name="document-text-outline"></ion-icon>
                <strong>Riwayat</strong>
            </div>
        </a>
    </div>
<!-- * App Bottom Menu -->';
}

echo'
<!-- ///////////// Js Files ////////////////////  -->
<!-- Jquery -->
<script src="'.$base_url.'mod/assets/js/lib/jquery-3.4.1.min.js"></script>
<!-- Bootstrap-->
<script src="'.$base_url.'mod/assets/js/lib/popper.min.js"></script>
<script src="'.$base_url.'mod/assets/js/lib/bootstrap.min.js"></script>
<!-- Ionicons -->
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
<script src="https://kit.fontawesome.com/0ccb04165b.js" crossorigin="anonymous"></script>
<!-- Base Js File -->
<script src="'.$base_url.'mod/assets/js/base.js"></script>
<script src="'.$base_url.'mod/assets/js/sweetalert.min.js"></script>
<script src="'.$base_url.'mod/assets/js/webcamjs/webcam.min.js"></script>';
if($mod =='id-card'){
echo'
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>';?>
<script type="text/javascript">
    /* ---------- Save Id Card ----------*/
var element = $("#divToPrint"); // global variable
var getCanvas; // global variable
         html2canvas(element, {
         onrendered: function (canvas) {
                $("#previewImage").append(canvas);
                getCanvas = canvas;
             }
         });
    
    $(".btn-Convert-Html2Image").on('click', function () {
        var imgageData = getCanvas.toDataURL("image/png");
        // Now browser starts downloading it instead of just showing it
        var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
        $(".btn-Convert-Html2Image").attr("download", "ID-CARD.jpg").attr("href", newData);
    });
</script>
<?PHP }

if($mod =='history'){
echo'
<script src="'.$base_url.'mod/assets/js/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="'.$base_url.'mod/assets/js/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="'.$base_url.'mod/assets/js/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="'.$base_url.'mod/assets/js/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script>
    $(".datepicker").datepicker({
        format: "dd-mm-yyyy",
        "autoclose": true
    }); 
    
</script>';
}
echo'
<script src="'.$base_url.'/mod/assets/js/sw-script.js"></script>';
if ($mod =='present'){?>
<script type="text/javascript">
   var result;
    $(document).ready(function getLocation() {
        result = document.getElementById("latitude");
       // 
        if(navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
        } else {
            swal({title: 'Oops!', text:'Maaf, browser Anda tidak mendukung geolokasi HTML5.', icon: 'error', timer: 3000,});
        }
    });
    
    // Define callback function for successful attempt
    function successCallback(position) {
       result.innerHTML =""+ position.coords.latitude + ","+position.coords.longitude + "";
    }

    // Define callback function for failed attempt
    function errorCallback(error) {
        if(error.code == 1) {
            swal({title: 'Oops!', text:'Anda telah memutuskan untuk tidak membagikan posisi Anda, tetapi tidak apa-apa. Kami tidak akan meminta Anda lagi.', icon: 'error', timer: 3000,});
        } else if(error.code == 2) {
            swal({title: 'Oops!', text:'Jaringan tidak aktif atau layanan penentuan posisi tidak dapat dijangkau.', icon: 'error', timer: 3000,});
        } else if(error.code == 3) {
            swal({title: 'Oops!', text:'Waktu percobaan habis sebelum bisa mendapatkan data lokasi.', icon: 'error', timer: 3000,});
        } else {
            swal({title: 'Oops!', text:'Waktu percobaan habis sebelum bisa mendapatkan data lokasi.', icon: 'error', timer: 3000,});
        }
    }
    
    // start webcame
    Webcam.set({
        width: 590,height: 460,
        image_format: 'jpeg',
        jpeg_quality:80,
    });

    var cameras = new Array(); //create empty array to later insert available devices
    navigator.mediaDevices.enumerateDevices() // get the available devices found in the machine
    .then(function(devices) {
        devices.forEach(function(device) {
        var i = 0;
            if(device.kind=== "videoinput"){ //filter video devices only
                cameras[i]= device.deviceId; // save the camera id's in the camera array
                i++;
            }
        });
    })

    Webcam.set('constraints',{
        width: 590,
        height: 460,
        image_format: 'jpeg',
        jpeg_quality:80,
        sourceId: cameras[0]
    });

    Webcam.attach('.webcam-capture');
    // preload shutter audio clip
    var shutter = new Audio();
    //shutter.autoplay = true;
    shutter.src = navigator.userAgent.match(/Firefox/) ? './mod/assets/js/webcamjs/shutter.ogg' : './mod/assets/js/webcamjs/shutter.mp3';
    function captureimage() {
    var latitude = $('.latitude').html();
        // play sound effect
        shutter.play();
        // take snapshot and get image data
        Webcam.snap( function(data_uri) {
            // display results in page
            Webcam.upload(data_uri, './sw-proses?action=present&latitude='+latitude+'', function(code,text) {
                $data       =''+text+'';
                var results = $data.split("/");
                $results = results[0];
                $results2 = results[1];
                if($results =='success'){
                    swal({title: 'Berhasil!', text:$results2, icon: 'success', timer: 3500,});
                    setTimeout("location.href = './';",3600);
                }else{
                    swal({title: 'Oops!', text:text, icon: 'error', timer: 3500,});
                }
            });    
        } );
    }
</script>
<?php }?>
  <!-- </body></html> -->
  </body>
</html><?php }?>


<?php

$fullurl = ($_SERVER['PHP_SELF']);
$trimmed = trim($fullurl, ".php");
$canonical = rtrim($trimmed, '/' . '/?');

if(empty($connection)){
  header('location:./404');
} else {
echo'
<!DOCTYPE html>
<html lang="id-ID" xml:lang="id-ID">
<head>

  <!--Viewport -->
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
  <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible"/>

  <!--Canonical-->
  <meta content="all" name="robots"/>
  <link href="'.$site_url.'" rel="home"/>
  <link href="'.$site_url.''.$fullurl.'" rel="canonical"/>

  <!--Title-->
  <title>'.$site_name.'</title>
  <meta name="description" content="Halaman Pengguna '.$site_name.', '.$site_description.'"/>
  <meta name="keywords" content="absensi online, aplikasi absensi, aplikasi absensi online, sistem absensi online, absensi online pemerintah, absensi online perusahaan"/>

  <!--OG-->
  <meta content="website" property="og:type"/>
  <meta content="'.$site_name.'" property="og:title"/>
  <meta content="'.$site_description.'" property="og:description"/>
  <meta content="'.$site_url.''.$canonical.'" property="og:url"/>
  <meta content="'.$site_name.'" property="og:site_name"/>
  <meta content="'.$site_name.'" property="og:headline"/>
  <meta content="'.$site_url.'/content/logo/absensionline.jpg" property="og:image"/>
  <meta content="1920" property="og:image:width"/>
  <meta content="1080" property="og:image:height"/>
  <meta content="id_ID" property="og:locale"/>
  <meta content="en_US" property="og:locale:alternate"/>
  <meta content="true" property="og:rich_attachment"/>
  <meta content="true" property="pinterest-rich-pin"/>
  <meta content="" property="fb:app_id"/>
  <meta content="" property="fb:pages"/>
  <meta content="" property="fb:admins"/>
  <meta content="" property="fb:profile_id"/>
  <meta content="'.$site_name.'" property="article:author"/>
  <meta content="summary_large_image" name="twitter:card"/>
  <meta content="'.$site_url.''.$canonical.'" property="twitter:url"/>
  <meta content="'.$site_name.'" property="twitter:title"/>
  <meta content="'.$site_description.'" property="twitter:description"/>
  <meta content="'.$site_url.'/content/logo/absensionline.jpg" property="twitter:image"/>

  <!--Webapp-->
  <link href="'.$site_url.'/manifest.json" rel="manifest"/>
  <meta content="'.$site_url.'" name="msapplication-starturl"/>
  <meta content="'.$site_url.'" name="start_url"/>
  <meta content="'.$site_name.'" name="application-name"/>
  <meta content="'.$site_name.'" name="apple-mobile-web-app-title"/>
  <meta content="'.$site_name.'" name="msapplication-tooltip"/>
  <meta content="#00B4FF" name="theme_color"/>
  <meta content="#00B4FF" name="theme-color"/>
  <meta content="#FFFFFF" name="background_color"/>
  <meta content="#00B4FF" name="msapplication-navbutton-color"/>
  <meta content="#00B4FF" name="msapplication-TileColor"/>
  <meta content="#00B4FF" name="apple-mobile-web-app-status-bar-style"/>
  <meta content="true" name="mssmarttagspreventparsing"/>
  <meta content="yes" name="apple-mobile-web-app-capable"/>
  <meta content="yes" name="mobile-web-app-capable"/>
  <meta content="yes" name="apple-touch-fullscreen"/>
  <link href="'.$site_url.'/favicon.png" rel="apple-touch-icon"/>
  <link href="'.$site_url.'/favicon.png" rel="shortcut icon" type="image/x-icon"/>
  <link href="'.$site_url.'/content/logo/absensionline32.png" rel="icon" sizes="32x32"/>
  <meta content="'.$site_url.'/content/logo/absensionline144.png" name="msapplication-TileImage"/>
  <link href="'.$site_url.'/content/logo/absensionline180.png" rel="apple-touch-icon"/>
  <link href="'.$site_url.'/content/logo/absensionline48.png" rel="icon" sizes="48x48"/>
  <link href="'.$site_url.'/content/logo/absensionline72.png" rel="icon" sizes="72x72"/>
  <link href="'.$site_url.'/content/logo/absensionline96.png" rel="icon" sizes="96x96"/>
  <link href="'.$site_url.'/content/logo/absensionline168.png" rel="icon" sizes="168x168"/>
  <link href="'.$site_url.'/content/logo/absensionline192.png" rel="icon" sizes="192x192"/>
  <link href="'.$site_url.'/content/logo/absensionline512.png" rel="icon" sizes="512x512"/>

  <!--verification-->
  <meta name="yandex-verification" content=""/>
  <meta name="p:domain_verify" content=""/>
  <meta name="msvalidate.01" content=""/>
  <meta name="google-site-verification" content="" />
  <meta name="dmca-site-verification" content=""/>
  <meta name="facebook-domain-verification" content=""/>

  <!--Location-->
  <meta content="ID" name="geo.region"/>
  <meta content="Indonesia" name="geo.country"/>
  <meta content="Indonesia" name="geo.placename"/>
  <meta content="x;x" name="geo.position"/>
  <meta content="x,x" name="ICBM"/>

  <!--resource-->
  <link href="//fonts.googleapis.com" rel="preconnect dns-prefetch"/>
  <link href="//api.github.com" rel="preconnect dns-prefetch"/>
  <link href="//api.mapbox.com" rel="preconnect dns-prefetch"/>
  <link href="//cdnjs.cloudflare.com" rel="preconnect dns-prefetch"/>
  <link href="//unpkg.com" rel="preconnect dns-prefetch"/>
  <link href="//kit.fontawesome.com" rel="preconnect dns-prefetch"/>

  <!--CSS-->
  <link rel="stylesheet" href="'.$site_url.'/mod/assets/css/style.css">
  <link rel="stylesheet" href="'.$site_url.'/mod/assets/css/sw-custom.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">';
  if($mod =='history'){
    echo'
    <link rel="stylesheet" href="'.$site_url.'/mod/assets/js/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="'.$site_url.'/mod/assets/js/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="'.$site_url.'/mod/assets/js/plugins/magnific-popup/magnific-popup.css">';
  }

echo'
</head>

<body>
<div class="loading"><div class="spinner-border text-primary" role="status"></div></div>
  <!-- loader -->
    <div id="loader">
        <img src="'.$site_url.'/mod/assets/img/Preloader.gif" alt="icon" class="loading-icon">
    </div>
    <!-- * loader -->';
if(isset($_COOKIE['COOKIES_MEMBER'])){
  echo'
<!-- App Header -->
    <div class="appHeader bg-primary text-light">
        <div class="left">
            <a href="#" class="headerButton" data-toggle="modal" data-target="#sidebarPanel">
                <ion-icon name="menu-outline"></ion-icon>
            </a>
        </div>
        <div class="pageTitle">
            <img src="'.$site_url.'/content/'.$site_logo.'" alt="logo" class="logo">
        </div>
        <div class="right">
            <div class="headerButton" data-toggle="dropdown" id="dropdownMenuLink" aria-haspopup="true">';
              if($row_user['photo'] ==''){
                echo'<img src="'.$site_url.'/content/avatar.jpg" alt="image" class="imaged w40">';
              }else{
                echo'
                <img src="'.$site_url.'/content/karyawan/'.$row_user['photo'].'" alt="image" class="imaged w40">';}
              echo'
               <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">';?>
                <a class="dropdown-item" onclick="location.href='profile';" href="profile"><ion-icon size="small" name="person-outline"></ion-icon>Profil</a>
                <a class="dropdown-item" onclick="location.href='logout';" href="logout"><ion-icon size="small" name="log-out-outline"></ion-icon>Keluar</a>
              </div>
            </div>
        </div>
    </div>
<?php
echo'<!-- App Sidebar -->
    <div class="modal fade panelbox panelbox-left" id="sidebarPanel" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body p-0">
                    <!-- profile box -->
                    <div class="profileBox pt-2 pb-2">
                        <div class="image-wrapper">';
                        if($row_user['photo'] ==''){
                        echo'<img src="'.$site_url.'/content/avatar.jpg" alt="image" class="imaged w36">';
                        }else{
                        echo'<img src="'.$site_url.'/content/karyawan/'.$row_user['photo'].'" class="imaged w36">';
                        }
                          echo'
                        </div>
                        <div class="in">
                            <strong>'.ucfirst($row_user['employees_name']).'</strong>
                            <div class="text-muted">'.$row_user['employees_code'].'</div>
                        </div>
                        <a href="#" class="btn btn-link btn-icon sidebar-close" data-dismiss="modal">
                            <ion-icon name="close-outline"></ion-icon>
                        </a>
                    </div>
                    <!-- * profile box -->
              
                    <!-- menu -->
                    <div class="listview-title mt-1">MENU UTAMA</div>
                    <ul class="listview flush transparent no-line image-listview">
                        <li>
                            <a href="./" class="item">
                                <div class="icon-box bg-primary">
                                    <ion-icon name="home-outline"></ion-icon>
                                </div> Home 
                            </a>
                        </li>
                        <li>
                            <a href="./profile" class="item">
                                <div class="icon-box bg-primary">
                                    <ion-icon name="person-outline"></ion-icon>
                                </div> Profil
                            </a>
                        </li>
                        <li>
                            <a href="./present" class="item">
                                <div class="icon-box bg-primary">
                                    <ion-icon name="scan-outline"></ion-icon>
                                </div> Absen
                            </a>
                        </li>
                        <li>
                            <a href="./id-card" class="item">
                                <div class="icon-box bg-primary">
                                  <ion-icon name="id-card-outline"></ion-icon>
                                </div> ID Card
                            </a>
                        </li>
                        <li>
                            <a href="./history" class="item">
                                <div class="icon-box bg-primary">
                                    <ion-icon name="document-text-outline"></ion-icon>
                                </div> Riwayat
                            </a>
                        </li>
                        <li>
                            <a href="./logout" class="item">
                                <div class="icon-box bg-primary">
                                    <ion-icon name="log-out-outline"></ion-icon>
                                </div> Keluar
                            </a>
                        </li>
                    </ul>
                    <!-- * menu -->
                </div>
            </div>
        </div>
    </div>
    <!-- * App Sidebar -->';
  }
 }?>
