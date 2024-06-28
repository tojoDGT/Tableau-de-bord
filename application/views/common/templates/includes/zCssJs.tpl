<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>DGT | Tableau de bord</title>
  <link rel="apple-touch-icon" sizes="180x180" href="{$zBasePath}assets/images/favicons/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="{$zBasePath}assets/images/favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="{$zBasePath}assets/images/favicons/favicon-16x16.png">

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{$zBasePath}assets/common/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="{$zBasePath}assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="{$zBasePath}assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="{$zBasePath}assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{$zBasePath}assets/common/dist/css/adminlte.min.css">
 <link rel="stylesheet" href="{$zBasePath}assets/common/dist/css/theme.css">
  <link rel="stylesheet" href="{$zBasePath}assets/css/soi.css">
  
</head>
<script>
		var zBasePath = "{$zBasePath}";
	</script>
<style>
.partielSearchHeader {
    -moz-box-shadow: 0px 2px 0px 0px #757e8a;
    -webkit-box-shadow: 0px 2px 0px 0px #757e8a;
    box-shadow: 0px 2px 0px 0px #757e8a;
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #599bb3), color-stop(1, #408c99));
    background: -moz-linear-gradient(to bottom, #7e94af 5%, #8297b3 100%);
    background: -webkit-linear-gradient(to bottom, #7e94af 5%, #8297b3 100%);
    background: -o-linear-gradient(to bottom, #7e94af 5%, #8297b3 100%);
    background: -ms-linear-gradient(to bottom, #7e94af 5%, #8297b3 100%);
    background: linear-gradient(to bottom, #7e94af 5%, #8297b3 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#599bb3', endColorstr='#408c99',GradientType=0);
    background-color: #599bb3;
    -moz-border-radius: 8px;
    -webkit-border-radius: 8px;
    border-radius: 8px;
    display: inline-block;
    cursor: pointer;
    color: #ffffff;
    font-family: Arial;
    font-size: 14px;
    font-weight: bold;
    padding: 10px 25px;
    text-decoration: none;
    /* text-shadow: 0px 1px 0px #3d768a; */
    border: none !important;
    margin: 0px 10px 0px 0px;
}

tr.odd {
	background-color:#f3f3e8;
}

tr.even {
	background-color:#fbfbf4;
}
.page-link {
    color: #a5a51b;
}

.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #b7b710;
    border-color: #a7a74b;
}

.partielSearchHeader1 {
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #599bb3), color-stop(1, #408c99));
    background: -moz-linear-gradient(to bottom, #7e94af 5%, #8297b3 100%);
    background: -webkit-linear-gradient(to bottom, #7e94af 5%, #8297b3 100%);
    background: -o-linear-gradient(to bottom, #7e94af 5%, #8297b3 100%);
    background: -ms-linear-gradient(to bottom, #7e94af 5%, #8297b3 100%);
    background: linear-gradient(to bottom, #3064a0 5%, #12386b 100%);
	box-shadow: 0px 2px 0px 0px #757e8a;
    background-color: #599bb3;
    padding: 6px 14px;
	color:white;
}
</style>
<body class="hold-transition sidebar-mini">
<input type="hidden" name="zBasePath" id="zBasePath" value="{$zBasePath}">