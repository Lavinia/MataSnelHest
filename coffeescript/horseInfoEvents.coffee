horse = new Horse
need = new Need horse

printNeeds = ->
	jQuery('#needSolids').html need.solidsInKilos()
	jQuery('#needEnergy').html need.energyInMJ()
	jQuery('#needProtein').html need.proteinInGrams()
	jQuery('#needCalcium').html need.calciumInGrams()
	jQuery('#needPhosphor').html need.phosphorInGrams()
	jQuery('#needMagnesium').html need.magnesiumInGrams()
	jQuery('#needSelenium').html need.seleniumInMilligrams()
	
#document ready
jQuery ->
	jQuery('#weight').keyup ->
		horse.setWeight jQuery(this).val() 
		printNeeds()
	
	jQuery('input[name=gender]:radio').change ->
		horse.setGender jQuery(this).val()
		printNeeds()
	
	jQuery('input[name=feedType]:radio').change ->
		horse.setFeedType jQuery(this).val()
		printNeeds()
	jQuery('#horseInfo').submit -> false

# gå igenom värdena, sätt värden på häst och uppdatera uträkningen. Sätt utskrift i egen funktion ( plus visa enheter på nåt sätt).