<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=yes" name="viewport"/>
    <title>Tableau de bord - Authentification</title>
    <!-- ace styles -->
    <link rel="stylesheet" href="{$zBasePath}assets/common/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="{$zBasePath}assets/common/css/vendor/jquery-ui.css?sdsds" >
    <link rel="stylesheet" type="text/css" href="{$zBasePath}assets/common/css/vendor/font-awesome.min.css" >
    <link rel="stylesheet" type="text/css" href="{$zBasePath}assets/common/css/login-inscr.css?0406201802">
    <script type="text/javascript" src="{$zBasePath}assets/common/js/vendor/jquery-1.11.3.min.js"></script>
	<script src="{$zBasePath}assets/js/jquery.maskedinput.js"></script>
	<script src="{$zBasePath}assets/js/bootstrap.min.js"></script>
	<script src="{$zBasePath}assets/js/bootbox.min.js"></script>
	<script src="{$zBasePath}assets/js/formValidation.min.js"></script>
    <script src="{$zBasePath}assets/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="{$zBasePath}assets/common/js/pageloader.js"></script>
    <script type="text/javascript" src="{$zBasePath}assets/common/js/homapage.js"></script>
	{literal}
    <style>
        body {
            background-image:url("{/literal}{$zBasePath}{literal}assets/common/img/cover.jpg?06062018") ;
            background-color:transparent ;
        }

		.modal-dialog{ text-align:center!important;}
		.modal-footer{ text-align:center!important;}
		form .message {
		  color: #ed1b24;
		  font-style: italic;
		  padding: 5px 0 5px 10px !important;
		  display: none;
		  font-size:13px;
		}
		form .error .message {
		  display: block;
		}
    </style>
	{/literal}
</head>
<body onload="showMessage()">
<div id="chargement"> <span id="chargement-infos"></span></div>