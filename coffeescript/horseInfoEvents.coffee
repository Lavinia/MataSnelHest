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