horse = new Horse
need = new Need horse

gram = ' gram'

printNeeds = ->
	jQuery('#needSolids').html need.solidsInKilos() + ' kilo'
	jQuery('#needEnergy').html need.energyInMJ() + ' MJ'
	jQuery('#needProtein').html need.proteinInGrams() + gram
	jQuery('#needCalcium').html need.calciumInGrams() + gram
	jQuery('#needPhosphor').html need.phosphorInGrams() + gram
	jQuery('#needMagnesium').html need.magnesiumInGrams() + gram
	jQuery('#needSelenium').html need.seleniumInMilligrams() + ' milligram'
	
#document ready
jQuery ->
	jQuery('#weight').keyup ->
		try 
			horse.setWeight jQuery(this).val()
			printNeeds()
			jQuery('#weight').siblings('.error').html ''
		catch err
			jQuery('#weight').siblings('.error').html err
		
	
	jQuery('input[name=gender]:radio').change ->
		horse.setGender jQuery(this).val()
		printNeeds()
	
	jQuery('input[name=feedType]:radio').change ->
		horse.setFeedType jQuery(this).val()
		printNeeds()
	
	jQuery('#horseInfo').submit -> false
	
	jQuery('#days-per-week').change ->
		horse.setWorkload 'daysPerWeek', jQuery(this).val()
		printNeeds()
	
	jQuery('#walk').keyup ->
		try
			horse.setWorkload 'walk', jQuery(this).val()
			printNeeds()
			jQuery('#walk').siblings('.error').html ''
		catch err
			jQuery('#walk').siblings('.error').html err
	
	jQuery('#trot').keyup ->
		try
			horse.setWorkload 'trot', jQuery(this).val()
			printNeeds()
			jQuery('#trot').siblings('.error').html ''
		catch err
			jQuery('#trot').siblings('.error').html err
			
	
