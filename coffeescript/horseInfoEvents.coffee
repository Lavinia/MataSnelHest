horse = new Horse
need = new Need horse

window.horse = horse # Reluctantly Used to get the horse to the fodderEvent.
window.need = need # Reluctantly Used to get the need to the fodderEvent.


printNeeds = ->
	jQuery('#need_solids').html need.solidsInKilos()
	jQuery('#need_energy').html need.energyInMJ()
	jQuery('#need_protein').html need.proteinInGrams()
	jQuery('#need_calcium').html need.calciumInGrams()
	jQuery('#need_phosphor').html need.phosphorInGrams()
	jQuery('#need_magnesium').html need.magnesiumInGrams()
	jQuery('#need_selenium').html need.seleniumInMilligrams()

#document ready
jQuery ->
	jQuery('#horseInfo').submit -> false

	jQuery('#weight').keyup ->
		try
			horse.setWeight jQuery(this).val()
			printNeeds()
			jQuery('#weight').siblings('.error').html ''
		catch err
			console.log err
			jQuery('#weight').siblings('.error').html err.message

	jQuery('input[name=gender]:radio').change ->
		horse.setGender jQuery(this).val()
		printNeeds()

	jQuery('input[name=feedType]:radio').change ->
		horse.setFeedType jQuery(this).val()
		printNeeds()

	jQuery('#days-per-week').change ->
		horse.setWorkload 'daysPerWeek', jQuery(this).val()
		printNeeds()

	jQuery('#walk').keyup ->
		try
			horse.setWorkload 'walk', jQuery(this).val()
			printNeeds()
			jQuery('#walk').siblings('.error').html ''
		catch err
			jQuery('#walk').siblings('.error').html err.message

	jQuery('#trot').keyup ->
		try
			horse.setWorkload 'trot', jQuery(this).val()
			printNeeds()
			jQuery('#trot').siblings('.error').html ''
		catch err
			jQuery('#trot').siblings('.error').html err.message

