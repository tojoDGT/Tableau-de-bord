<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Tableau de bord BackOffice</title>
  <link rel="apple-touch-icon" sizes="180x180" href="{$zBasePath}assets/images/favicons/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="{$zBasePath}assets/images/favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="{$zBasePath}assets/images/favicons/favicon-16x16.png">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="{$zBasePath}assets/common/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{$zBasePath}assets/common/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="{$zBasePath}assets/common/bower_components/Ionicons/css/ionicons.min.css">

  <link rel="stylesheet" href="{$zBasePath}assets/common/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

  <!-- jvectormap -->
  <link rel="stylesheet" href="{$zBasePath}assets/common/bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{$zBasePath}assets/common/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="{$zBasePath}assets/cnfi/cnfi.css">
  
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="{$zBasePath}assets/common/dist/css/skins/_all-skins.min.css">
  <script type="text/javascript" src="{$zBasePath}assets/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="{$zBasePath}assets/js/jquery-ui.js"></script>
	 <link rel="stylesheet" type="text/css" href="{$zBasePath}assets/css/jquery-ui.css?dfdfd" >
  <script src="{$zBasePath}assets/js/home.js"></script>
  <script src="{$zBasePath}assets/js/transverse.js"></script>
  <style>
	th.dt-center, td.dt-center { text-align: center;}
	th, td { vertical-align: middle!important;}
  </style>
  <style>

main {
  /*max-width: 800px;*/
  /*margin: 30px auto;*/
	min-height:600px;
	background: #ffffff;
	/*color: #009abf;*/
	padding-left: 30px;
	padding-right: 30px;
	box-shadow: 0 3px 5px rgba(0,0,0,0.2);
}
input[name=css-tabs] {
  display: none;
}
a {
	color: #F29A77;
}
#tabs {
	padding: 0 0 0 50px;
	width: calc(100% + 80px);
	margin-left: -50px;
	background: #2B2A28;
	height: 80px;
	border-bottom: 5px solid #3c8dbc;
	box-shadow: 0 3px 5px rgba(0,0,0,0.2);
}
#tabs::before {
	content: "";
	display: block;
	position: absolute;
	z-index: -100;
	width: 100%;
	left: 0;
	margin-top: 16px;
	height: 80px;
	background: #2B2A28;
	border-bottom: 5px solid #3c8dbc;
}
#tabs::after {
	content: "";
	display: block;
	position: absolute;
	z-index: 0;
	height: 80px;
	width: 175px;
	background: #3c8dbc;
	transition: transform 400ms;
}
#tabs label {
	position: relative;
	z-index: 100;
	display: block;
	float: left;
	font-size: 11px;
	color: white;
	text-transform: uppercase;
	text-align: center;
	width: 175px;
	height: 100%;
	border-right: 1px dotted #575654;
	cursor: pointer;
}
#tabs label:first-child {
	border-left: 1px dotted #575654;
}
#tabs label::before {
	content: "";
	display: block;
	height: 35px;
	width: 150px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
	filter: invert(40%);
	margin: 10px auto;
}
#tab0::before {
	background-image: url({$zBasePath}assets/images/demande.png);
}
#tab1::before {
	background-image: url({$zBasePath}assets/images/developpement-web.png);
}
#tab2::before {
	background-image: url({$zBasePath}assets/images/obeservation.png);
}
#tab3::before {
	background-image: url({$zBasePath}assets/images/faq.png);
}
#tab4::before {
	background-image: url({$zBasePath}assets/images/loading.gif);
}
#radio0:checked ~ #tabs #tab0::before, #radio1:checked ~ #tabs #tab1::before, #radio2:checked ~ #tabs #tab2::before, #radio3:checked ~ #tabs #tab3::before, #radio4:checked ~ #tabs #tab4::before {
	filter: invert(100%);
}
#radio0:checked ~ #tabs::after {
	transform: translateX(0);
}
#radio1:checked ~ #tabs::after {
	transform: translateX(175px);
}

#radio2:checked ~ #tabs::after {
	transform: translateX(350px);
}

#radio3:checked ~ #tabs::after {
	transform: translateX(525px);
}
#radio4:checked ~ #tabs::after {
	transform: translateX(700px);
}
#content {
	/*position: absolute;*/
}
#content::before {
	content: "";
	display: block;
	/*position: absolute;*/
	width: 0;
	height: 0;
	margin-left: -50px;
	border-top: 8px solid #000;
	border-right: 10px solid #000;
	border-left: 10px solid transparent;
	border-bottom: 8px solid transparent;
}
#content::after {
	content: "";
	display: block;
	/*position: absolute;*/
	width: 0;
	height: 0;
	margin-left: calc(100% + 30px);
	border-top: 8px solid #000;
	border-left: 10px solid #000;
	border-right: 10px solid transparent;
	border-bottom: 8px solid transparent;
}

#content section {
	/*position: relative;*/
	transform: translateY(50px);
	opacity: 0;
	transition: transform 500ms, opacity 500ms;
}

#radio0:checked ~ #content #content0{
	transform: translateY(0);
	/*top:200px;*/
	opacity: 1;
	position:relative;
	display: block;
}

#radio0:checked ~ #content #content1, #radio0:checked ~ #content #content2, #radio0:checked ~ #content #content3{
	display: none;
}

#radio1:checked ~ #content #content1{
	transform: translateY(0);
	top:95px;
	width:96%;
	opacity: 1;
	position:absolute;
	display: block;
}

#radio1:checked ~ #content #content0, #radio1:checked ~ #content #content2, #radio1:checked ~ #content #content3{
	display: none;
}
#radio2:checked ~ #content #content2{
	transform: translateY(0);
	opacity: 1;
	top:95px;
	width:96%;
	position:absolute;
	display: block;

}

#radio2:checked ~ #content #content0, #radio2:checked ~ #content #content1,#radio2:checked ~ #content #content3{
	display: none;
}

#radio3:checked ~ #content #content3{
	transform: translateY(0);
	opacity: 1;
	top:95px;
	width:96%;
	position:absolute;
	display: block;

}


#radio3:checked ~ #content #content0, #radio3:checked ~ #content #content1,#radio3:checked ~ #content #content2{
	display: none;
}

#radio4:checked ~ #content #content4{
	transform: translateY(0);
	opacity: 1;
	width:96%;
	height:600px;
	/*top:200px;*/
	position:absolute;
	display: block;

}

.topAbs{
	top: 226px;
    position: absolute;
}

</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<input type="hidden" name="zBasePath" id="zBasePath" value="{$zBasePath}">