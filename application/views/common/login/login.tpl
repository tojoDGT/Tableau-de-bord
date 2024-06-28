{include_php file=$zCssJs}
<link href="{$zBasePath}assets/css/bootstrap.min.css?aaaa2017V320180404" rel="stylesheet">
<div id="container">
    <div class="container-fluid">
        <div class="row homepage">
            <div class="col-md-8 col-sm-5 col-xs-12 text-center boxes">
				{if sizeof($oData.toGetHomeArticle)>0}
				{foreach from=$oData.toGetHomeArticle item=toGetHomeArticle}
				<img class="homeMobileImage" src="{$zBasePath}assets/common/img/{$toGetHomeArticle.home_image}?{$oData.date}" width="40%" alt="" style="vertical-align:middle">
				<h1 class="homeDesk"><a href="{$zBasePath}assets/pdf/DECRET.pdf" target="_blank">&laquo;&nbsp;{$toGetHomeArticle.home_text}&nbsp;&raquo;</a></h1>
				<h1 class="homeDesk"><span>({$toGetHomeArticle.home_article})</span></h1>
				{/foreach}
				{/if}
			</div>
			<div class="col-md-5 col-md-push-7 col-sm-7 col-sm-push-5 col-xs-12  col-xs-push-0 animateinHome">
				<!--- login --->
					{include_php file=$zLogin}
				<!--- fin --->

				<!--- Inscription -->
					{include_php file=$zInscription}
				<!--- fin inscription -->

				<!--- Changement PassWord -->
					{include_php file=$zChangePassword}
					<h1 class="homeMobile"><a href="{$zBasePath}assets/pdf/DECRET.pdf" target="_blank">&laquo;&nbsp;{$toGetHomeArticle.home_text}&nbsp;&raquo;</a></h1>
					<h1 class="homeMobile"><span>({$toGetHomeArticle.home_article})</span></h1>
				<!--- fin password  -->
			</div>
    </div> <!-- /row -->
</div> <!-- /container -->
{literal}
<script>
jQuery(document).ready(function() {

	var zBasePath = '{/literal}{$zBasePath}{literal}';
	var passbtn = jQuery('.resetPass');
	var inscrbtn = jQuery('.signUp');
	{/literal}{if $oData.type == 1}{literal}
	passbtn.click();
	{/literal}{/if}{literal}
	{/literal}{if $oData.type == 2}{literal}
	inscrbtn.click();
	{/literal}{/if}{literal}

})
function showMessage(){
	
	{/literal}{if $oData.message}{literal}
	bootbox.alert('{/literal}{$oData.message}{literal}') ;
	{/literal}{/if}{literal}
	
}


jQuery(document).ready(function() {
	$('input').tooltip();
	$('select').tooltip();
	$('button').tooltip();

	$("#validationChangePseudo").click(function(){
		var iRet = 1 ; 
		
			$(".obligatoire").each (function ()
			{	
				$(this).next().show();
				$(this).parent().removeClass("error");
				if($(this).val()=="")
				{
					$(this).parent().addClass("error");
					$(this).next().hide();
					 iRet = 0 ;
				}
			}) ;

			$(".StatutObligatoire").parent().removeClass("error");
			$(".StatutObligatoire").next().show();
			if ($(".StatutObligatoire option:selected").val() == '1')
			{
				$(".StatutObligatoire").parent().addClass("error");
				$(".StatutObligatoire").next().hide();
				iRet = 0 ;
			}
			
			if (iRet == 1)
			{	
				$("#changeMotDePasse").submit();
			} 
	})

	$("#validationInscription").click(function(){
		var iRet = 1 ; 
		
			$(".obligatoireInscr").each (function ()
			{	
				$(this).next().show();
				$(this).parent().removeClass("error");
				if($(this).val()=="")
				{
					$(this).parent().addClass("error");
					$(this).next().hide();
					 iRet = 0 ;
				}
			}) ;

			$(".StatutObligatoire1").parent().removeClass("error");
			$(".StatutObligatoire1").next().show();
			if ($(".StatutObligatoire1 option:selected").val() == '1')
			{
				$(".StatutObligatoire1").parent().addClass("error");
				$(".StatutObligatoire1").next().hide();
				iRet = 0 ;
			}
			
			if (iRet == 1)
			{	
				$("#create_form").submit();
			} 
	})

})

function validerForm(){

	var iRet = true ; 
	$(".br").hide();
	jQuery(document).ready(function() {
		$(".obligatoireLogin").each (function ()
		{
			$(this).next().show();
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				$(this).next().hide();
				 iRet = false ;
			}
		}) ;

	}) ;

	return iRet ; 

}

function changeStatut(_iStatut,_iValue){
	$(document).ready(function() {
		$("#matricule"+ _iValue).val("");
		$("#nom").focus();
		switch(_iStatut)
		{
			case "1":
				$("#matricule"+ _iValue).attr("readonly","readonly");
				$("#matricule"+ _iValue).attr("placeholder","");
				$("#matricule"+ _iValue).val("");
				break;
			case "2":
				$("#matricule"+ _iValue).attr("readonly","readonly");
				$("#matricule"+ _iValue).mask("AAA");
				$("#matricule"+ _iValue).val("ECD");
				break;
			case "3":
				$("#matricule"+ _iValue).attr("readonly","Votre matricule");
				$("#matricule"+ _iValue).removeAttr("readonly");
				$("#matricule"+ _iValue).mask("999 999");
				$("#matricule"+ _iValue).focus();
				break;
			case "4":
				$("#matricule"+ _iValue).attr("readonly","readonly");
				$("#matricule"+ _iValue).mask("AAA");
				$("#matricule"+ _iValue).val("EMO");
				break;
			case "5":
				$("#matricule"+ _iValue).attr("placeholder","Votre matricule");
				$("#matricule"+ _iValue).removeAttr("readonly");
				$("#matricule"+ _iValue).mask("999 999");
				$("#matricule"+ _iValue).focus();
				break;
			case "6":
				$("#matricule"+ _iValue).attr("readonly","readonly");
				$("#matricule"+ _iValue).mask("AAA");
				$("#matricule"+ _iValue).val("ES");
				break;	
			case "7":
				$("#matricule"+ _iValue).attr("placeholder","Votre matricule");
				$("#matricule"+ _iValue).removeAttr("readonly");
				$("#matricule"+ _iValue).mask("999 999");
				$("#matricule"+ _iValue).focus();
				break;
			case "8":
				$("#matricule"+ _iValue).attr("placeholder","Votre matricule");
				$("#matricule"+ _iValue).removeAttr("readonly");
				$("#matricule"+ _iValue).mask("999 999");
				$("#matricule"+ _iValue).focus();
				break;
		}
	});	
}

</script>
{/literal}