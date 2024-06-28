{literal}
<script type="text/javascript">
	var zBasePath = '{/literal}{$zBasePath}{literal}';
	var iUserIdConnect = {/literal}{$oUser.id}{literal};
</script>

{/literal}
<script src="{$zBasePath}assets/common/js/moment.min.js"></script>
<script src="{$zBasePath}assets/common/js/fullcalendar.min.js"></script>
<script src="{$zBasePath}assets/common/js/bootbox.js"></script>
<script src="{$zBasePath}assets/common/js/lang-all.js"></script>
<script src="{$zBasePath}assets/common/js/getcalendar.js"></script>

<div id="mon-agenda" style="display: block;">
	<div id="zavatra">
		<div class="widget-header">
			<!--                <img class="showCommuniquer" width="25" style="cursor: pointer; display: none;" src="{$zBasePath}assets/common/img/right-round-xxl.png">-->
			<img class="showCalendar" width="25" style="cursor:pointer" src="{$zBasePath}assets/common/img/left-round-xxl.png">
			<h4 class="smaller">Chronologie</h4>
			<img class="AddEvent dialog-add_event" style="cursor:pointer" width="25" src="{$zBasePath}assets/common/img/plus.png">
		</div>
		<div id="contentEventAll">

			<!--<div class="parentAgenda">
				<div class="enteteEvenement">
					<h4 class="media-heading">
						<a href="{$zBasePath}avis/rubrique/titre-de-paiement#" class="blue"> <p>- Autorisation d'absence</p></a>
					</h4>
				</div>
				<div class="media search-media cadreViolet">
					<div class="media-body11  cadreViolet  ">
						<div class="content">

							<p>
								Convenances personnelles<br>
								<span>22/04/2017 - 23/04/2017</span>
							</p>
						</div>
					</div>
					<div class="cadre3 cadreViolet">
					</div>
				</div>
				<span class="calendar ">22 <em class="cadreViolet">Avril</em></span>
				<div class="piedEvenement">
					<p><b>Lieu :</b> Analamanga</p>
				</div>
			</div>-->

			{if sizeof($toAllEvent)>0}
			{assign var=iIncrement value="0"}
			{foreach from=$toAllEvent item=oAllEvent }
			<div class="parentAgenda">
				<div class="enteteEvenement">
					<h4 class="media-heading">
						<a href="{$zBasePath}avis/rubrique/titre-de-paiement#" class="blue"> <p>- {$oAllEvent.evenement_intitule|ucFirst|truncate:32:"...":true}</p></a>
					</h4>
				</div>
				<div class="media search-media cadreViolet">
					<div class="media-body11  cadreViolet  ">
						<div class="content">

							{if $oAllEvent.evenement_image != ''}
								<p style="text-align:center!important;">
								{$oAllEvent.evenement_image}
							{else}
								<p>
								{$oAllEvent.evenement_desccription|truncate:65:"...":true}<br>
							{/if}
							{if $oAllEvent.evenement_dateFin != ""}
							<span>{$oAllEvent.evenement_dateDeb|date_format:"%d/%m/%Y"} - {$oAllEvent.evenement_dateFin|date_format:"%d/%m/%Y"}</span>
							{/if}
							</p>
						</div>
					</div>
					<div class="cadre3 cadreViolet">
					</div>
				</div>
				<span class="calendar ">{$oAllEvent.evenement_dateDeb|date_format:"%d"} <em class="cadreViolet">{$oAllEvent.evenement_dateDeb|date_format:"%m"|datecourt}</em></span>
				<div class="piedEvenement">
					<p><b>Lieu :</b> {$oAllEvent.evenement_lieu}</p>
				</div>
			</div>
			{/foreach}
			{else}
				<div class="parentAgenda">
					<div class="media ">
						<div class="media-body11" style="width:100%">
							<img class="flecheEvent" width="50" src="{$zBasePath}assets/gcap/css/arrow.png">
							<div class="content" style="padding:75px 10px 10px 10px;font-size:1.4em">
								<p>Veuillez cliquer sur le bouton "+" pour ajouter un événement</p>
							</div>
						</div>
						</div>
					</div>
				</div>
			{/if}



		</div>
	</div>
</div>

<div class="layoutCal"></div>