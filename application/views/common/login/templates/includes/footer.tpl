<link rel="stylesheet" type="text/css" href="{$zBasePath}assets/gcap/css/app/li-scroller.css">
<script type="text/javascript" src="{$zBasePath}assets/gcap/js/app/jquery.li-scroller.1.0.js"></script>
<footer id="mainFooter">
	<div id="mainFooterTop">
		 <div class="cubespinner">                 
			<div class="face1"><img src="{$zBasePath}assets/img/logo.png" alt="" width="60" height="60" style="vertical-align:middle"></div>                 
			<div class="face2"><img src="{$zBasePath}assets/gcap/images/drha.png" width="60" height="60" alt="" style="vertical-align:top"></div>                 
			<div class="face3"><img src="{$zBasePath}assets/img/logo.png" alt="" width="60" height="60" style="vertical-align:middle"></div>                 
			<div class="face4"><img src="{$zBasePath}assets/gcap/images/drha.png" width="60" height="60" alt="" style="vertical-align:top"></div>                 
			<div class="face5"><img src="{$zBasePath}assets/img/logo.png" alt="" width="60" height="60" style="vertical-align:middle"></div>                 
			<div class="face6"><img src="{$zBasePath}assets/gcap/images/drha.png" width="60" height="60" alt="" style="vertical-align:top"></div>             
		</div>
	</div>
	<div id="mainFooterBottom">
		<p>© 2017 - Ministère des finances et du budget</p>
	</div>
</footer>
{if $iModuleActif == 2}
{if $iSessionCompte == COMPTE_AGENT}
{if $iNotification > 0 && $iNotificationAffiche==1}
<div class="notification">
	<p class="titre">NOTIFICATION</p>
	<p class="notif">Vous avez {$iNotification} valid&eacute;{if $iNotification>1}s{/if} : </p>
	{if $iNotificationDecision > 0}<p class="notif">- {$iNotificationDecision} d&eacute;cision{if $iNotificationDecision>1}s{/if}</p>{/if}
	{if $iNotificationConge > 0}<p class="notif">- {$iNotificationConge} Cong&eacute;{if $iNotificationConge>1}s{/if}</p>{/if}
	{if $iNotificationAbscence > 0}<p class="notif">- {$iNotificationAbscence} Autorisation{if $iNotificationAbscence>1}s{/if} d'abscence</p>{/if}
	{if $iNotificationPermission> 0}<p class="notif">- {$iNotificationPermission} Permission{if $iNotificationPermission>1}s{/if}</p>{/if}
	<p class="button">
		<a href="#" title=""><i style="color: #F10610;padding-left:240px;" class="fa fa-close"></i></a>
	</p>
</div>
{/if}
{else}
{if $iNotification > 0 && $iNotificationAffiche==1}
<div class="notification">
	<p class="titre">
	<span>
		NOTIFICATION
	</span>
	</p>
	<p class="notif">Vous avez {$iNotification} demande{if $iNotification>1}s{/if} &agrave; valider : </p>
	{if $iNotificationDecision > 0}<p class="notif">- {$iNotificationDecision} d&eacute;cision{if $iNotificationDecision>1}s{/if}</p>{/if}
	{if $iNotificationConge > 0}<p class="notif">- {$iNotificationConge} Cong&eacute;{if $iNotificationConge>1}s{/if}</p>{/if}
	{if $iNotificationAbscence > 0}<p class="notif">- {$iNotificationAbscence} Autorisation{if $iNotificationAbscence>1}s{/if} d'abscence</p>{/if}
	{if $iNotificationPermission> 0}<p class="notif">- {$iNotificationPermission} Permission{if $iNotificationPermission>1}s{/if}</p>{/if}
	<p class="button">
		<a href="#" title=""><i style="color: #F10610;padding-left:240px;" class="fa fa-close"></i></a>
	</p>
</div>
{/if}
{/if}
{/if}

{if $iNotificationCarte > 0}
<div class="notification">
	<p class="titre">
		<span>
			NOTIFICATION NOUVELLE CARTE ROHI
		</span>
	</p>
	<p class="notif">Votre carte ROHI est disponible.</p>
	<p class="notif">Veuillez vous adresser au responsable</p>
	<p class="notif">Porte 15 MFB Antaninarenina. Merci!</p>
	<p class="notif">&nbsp;</p>
	<p class="notif">&nbsp;</p>
	<p class="button">
		<a href="#" title=""><i style="color: #F10610;padding-left:240px;" class="fa fa-close"></i></a>
	</p>
</div>
{/if}

{if sizeof($toReclassement) > 0}
<div class="notification" >
	<p class="titre">
	<span>
	Reclassement (Circuit et Suivi)
	</span>
	</p>
	<p class="notif">{$toReclassement.0.suivi_libelle}</p>
	<p class="notif">Date : {$toReclassement.0.suivi_libelle|date_format:"%d/%m/%Y"}</p>
	<p class="notif">&nbsp;</p>
	<p class="button">
		<a href="#" title=""><i style="color: #F10610;padding-left:240px;" class="fa fa-close"></i></a>
	</p>
</div>
{/if}