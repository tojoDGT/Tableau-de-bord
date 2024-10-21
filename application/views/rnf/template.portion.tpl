<tr id='ChampTr_{$iIndexNew}'>
	<td>
		<div class="item-cont">
			<input type="text" name="caption[]" id="caption_{$iIndexNew}" class="input input-sm form-control obligatoire" value="" />
			<p class="message">Champ obligatoire</p>
		</div>
	</td>
	<td>
		<div class="item-cont">
			<input type="text" name="champNom[]" id="champNom_{$iIndexNew}" {if $iType==1}readonly="readonly"{/if} class="automaticRad input input-sm form-control obligatoire" value="" />
			<p class="message">Champ obligatoire</p>
		</div>
	</td>
	<td>
		<div class="item-cont">
			<input type="text" name="montant[]" id="montant_{$iIndexNew}" class="input prix input-sm form-control obligatoire" value="" />
			<p class="message">Champ obligatoire</p>
		</div>
	</td>
	<td>
		<button style="cursonr:pointer" class="btn_close" type="button" onclick="deleteChamp({$iIndexNew})"><img style="cursonr:pointer;color: #F10610;" width="20" src="{$zBasePath}/assets/iles/del.png"></button>
	</td>
</tr>